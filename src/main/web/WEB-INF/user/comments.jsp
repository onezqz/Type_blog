<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div id="comments" class="cf">
    <ul class="comment-list" id="comments-list">
        <c:if test="${!empty commentList}">
        <c:forEach items="${commentList}" var="comment" >
            <li id="li-comment-${comment.coid}" class="comment-body comment-parent comment-odd">
                <div id="comment-${comment.coid}">
                    <img class="avatar" src="${pageContext.request.contextPath}/images/author_logo.png">
                    <div class="comment-main">
                        <p>${comment.text}</p>
                        <div class="comment-meta">
                            <span class="comment-author">
                                <a href="${comment.url}">${comment.author}</a>
                            </span>
                            <time class="comment-time">${comment.created}</time>
                            <span class="comment-reply">
                                <button id="comment-reply-${comment.coid}"
                                    class="btn btn-sm btn-default" onclick="commentReplyFun('${comment.coid}')">回复</button>
                            </span>
                        </div>
                    </div>
                </div>
            </li>
        </c:forEach>
        </c:if>
        <c:if test="${empty commentList}">
            <span style="padding-left: 200px">目前暂无评论</span>
        </c:if>
    </ul>
    <div class="modal fade" id="replyComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="modal" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        你想说什么
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="comment-form">
                        <input type="hidden" name="parent" id="comment-parent" value="0">
                        <input type="hidden" name="cid" id="comment-cid" value="${content.cid}">
                        <div class="row">
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="username"
                                       name="author"
                                       placeholder="请输入名字">
                            </div>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="mail"
                                       name="mail"
                                       placeholder="请输入邮箱">
                            </div>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="url"
                                       name="url"
                                       placeholder="请输入网址">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <textarea id="commentContent" class="form-control" rows="3"
                                          name="text" placeholder="请输入评论内容"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3 pull-right">
                                <button type="submit" class="btn btn-default" id="comment-submit">评论
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <div class="pull-right">
        <button data-toggle="modal" data-target="#replyComment"
                id="comment-new-reply" class="btn btn-success">新建评论</button>
    </div>
</div>
<script>
    function commentReplyFun(coid) {
        //alert(coid);
        $("#comment-parent").val(coid);
        $("#replyComment").modal("show");
    }
</script>

<script>
    $('form').submit(function() {
        var data=$(this).serialize();
        var content="";
        $.ajax({
            url:"${pageContext.request.contextPath}/article/comment",
            type:"post",
            async:true,
            data:data,
            dataType:"json",
            success:function (result) {
               if(result!=null){
                   for(var i=0;i<result.length;i++){
                       content+=
                           " <li id=\"li-comment-"+result[i].coid+"\" class=\"comment-body comment-parent comment-odd\">\n" +
                           "   <div id=\"comment-"+result[i].coid+"\">\n" +
                           "     <img class=\"avatar\" src=\"${pageContext.request.contextPath}/images/author_logo.png\">\n" +
                           "     <div class=\"comment-main\">\n" +
                           "         <p>"+result[i].text+"</p>\n" +
                           "         <div class=\"comment-meta\">\n" +
                           "            <span class=\"comment-author\">\n" +
                           "               <a href=\""+result[i].url+"\">"+result[i].author+"</a>\n" +
                           "            </span>\n" +
                           "            <time class=\"comment-time\">"+result[i].created+"</time>\n" +
                           "            <span class=\"comment-reply\">\n" +
                           "               <button id=\"comment-reply-"+result[i].coid+"\"\n" +
                           "                 class=\"btn btn-sm btn-default\" onclick=\"commentReplyFun('"+result[i].coid+"')\">回复</button>\n" +
                           "            </span>\n" +
                           "         </div>\n" +
                           "      </div>\n" +
                           "    </div>\n" +
                           " </li>\n"
                   }
               }else{
                   content+=" <span style=\"padding-left: 200px\">目前暂无评论</span>";
               }
               $("#comments-list").html(content);
                $("#replyComment").modal("hide");
            }
        });
        return false;
    });
</script>