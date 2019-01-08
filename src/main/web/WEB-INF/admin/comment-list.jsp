<%--
  Created by IntelliJ IDEA.
  User: onezqz
  Date: 2018/12/11
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>评论管理</title>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="col-md-12 col-sm-12" id="main" role="main" >
        <div class="table-caption">
            <h4>管理评论</h4>
        </div>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>作者</th>
                    <th></th>
                    <th>内容</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty commentPageBean.contentList}">
                    <tr>
                        <td>
                            暂无数据
                        </td>
                    </tr>
                </c:if>
                <c:if test="${!empty commentPageBean.contentList}">
                    <c:forEach items="${commentPageBean.contentList}" var="comment">
                    <tr>
                        <td>
                            <img class="avatar" src="${pageContext.request.contextPath}/images/author_logo.png"
                                style="width: 40px;height: 40px">
                        </td>
                        <td>
                            <span>
                                <a href="${comment.url}" target="_blank">${comment.author}</a>
                            </span><br/>
                            <span>
                                <a href="mailto:${comment.mail}">${comment.mail}</a>
                            </span><br/>
                            <span>${comment.ip}</span>
                        </td>
                        <td>
                            <span>
                                <time class="comment-time">
                                    <fmt:formatDate value="${comment.created}" pattern="${blogCommentTimeFormat}"/>
                                </time> &nbsp;评论于
                                <a href="${pageContext.request.contextPath}/admin/article/edit?cid=${comment.cid}"
                                    target="_blank">${comment.content.title}</a>
                            </span><br/>
                            <span>评论内容：${comment.text}</span><br/>
                            <span class="comment-operation">
                                <button id="comment-reply-${comment.coid}" class="btn btn-sm btn-success"
                                        onclick="commentReply('${comment.coid}','${comment.cid}')">回复</button>
                                <button id="comment-edit-${comment.coid}" class="btn btn-sm btn-warning"
                                        onclick="commentEdit('${comment.coid}')">编辑</button>
                                <c:if test="${comment.status=='approved'}">
                                    <button id="comment-audit-${comment.coid}" class="btn btn-sm btn-info"
                                        onclick="commentStatus('${comment.coid}','waiting')">审核</button>
                                </c:if>
                                <c:if test="${comment.status=='waiting'}">
                                    <button id="comment-approved-${comment.coid}" class="btn btn-sm btn-info"
                                        onclick="commentStatus('${comment.coid}','approved')">通过</button>
                                </c:if>
                                <button id="comment-delete-${comment.coid}" class="btn btn-sm btn-danger"
                                        onclick="commentDelete('${comment.coid}','${comment.cid}')">删除</button>
                        </span>
                        </td>
                    </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
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
                        <form class="form-horizontal" role="form" id="comment-form" method="post"
                              action="${pageContext.request.contextPath}/admin/comment/reply">
                            <input type="hidden" name="coid" id="comment-coid" value="">
                            <input type="hidden" name="parent" id="comment-parent" value="">
                            <input type="hidden" name="cid" id="comment-cid" value="">
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
        <div style="padding-left: 80%">
            <ul class="pagination">
                <c:forEach begin="1" end="${commentPageBean.totalPage}" var="page">
                    <c:if test="${commentPageBean.currentPage==page}">
                        <li class="active"><a href="javascript:void(0)">${page}</a></li>
                    </c:if>
                    <c:if test="${commentPageBean.currentPage!=page}">
                        <li class="">
                            <a href="${pageContext.request.contextPath}/admin/comment/list?page=${page}">${page}</a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</body>
<!-- 引入footer.jsp -->
<jsp:include page="bottom.jsp"></jsp:include>
</html>
<script>
    <%--回复--%>
    function commentReply(coid,cid) {
        $("#comment-parent").val(coid);
        $("#comment-cid").val(cid);
        $("#replyComment").modal("show");
    }
    <%--编辑--%>
    function commentEdit(coid) {
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/comment/editJson",
            async:true,
            dataType:"json",
            data:{"coid":coid},
            type:"post",
            success:function (result) {
                // comment
                if(result!=null){
                    $("#username").val(result.author);
                    $("#mail").val(result.mail);
                    $("#url").val(result.url);
                    $("#commentContent").html(result.text);
                    $("#comment-coid").val(result.coid);
                }
                $("#replyComment").modal("show");
            }
        });
    }
    <%--审核,通过--%>
    function commentStatus(coid,status) {
        window.location.href="${pageContext.request.contextPath}/admin/comment/status?status="+status+"&coid="+coid
    }
    <%--删除--%>
    function commentDelete(coid,cid) {
        if(confirm("确定删除该项？")){
            window.location.href="${pageContext.request.contextPath}/admin/comment/delete?coid="+coid+"&cid="+cid
        }
    }


</script>
