<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>博客设置</title>
</head>
<body>
<div class="container-fluid" style="padding-top: 8px">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="col-md-12 col-sm-12" id="main" role="main">
        <form class="form-horizontal" role="form" id="blog-config">
            <input type="hidden" name="bid" value="${blogConfig.bid}">
            <div class="introduction">
                <h4>
                    博客设置
                </h4>
            </div>
            <div class="row">
                <div class="col-md-8 center-block">
                    <div class="form-group">
                        <label class="control-label col-md-2" for="blogName">名称</label>
                        <div class="col-md-10">
                            <input class="form-control" type="text" id="blogName" name="blogName" value="${blogConfig.blogName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="blogKeywords">缩略名</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="blogKeywords" name="blogKeywords"
                                   value="${blogConfig.blogKeywords}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="blogDesc">博客描述</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="blogDesc" name="blogDesc"
                                   value="${blogConfig.blogDesc}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="blogCommentTimeFormat">评论时间格式</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="blogCommentTimeFormat"
                                   name="blogCommentTimeFormat" value="${blogConfig.blogCommentTimeFormat}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="blogCommentListNum">评论分页数目</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="blogCommentListNum"
                                   name="blogCommentListNum" value="${blogConfig.blogCommentListNum}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="blogCommentAvatarUrl">评论头像源</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="blogCommentAvatarUrl"
                                   name="blogCommentAvatarUrl" value="${blogConfig.blogCommentAvatarUrl}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="blogArticleTimeFormat">文章时间格式</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="blogArticleTimeFormat"
                                   name="blogArticleTimeFormat"
                                   value="${blogConfig.blogArticleTimeFormat}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="blogArticleNumEachPage">文章分页数量</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="blogArticleNumEachPage"
                                   name="blogArticleNumEachPage"
                                   value="${blogConfig.blogArticleNumEachPage}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="BlogArticleNumEachPage">文章是否截取</label>
                        <div class="col-md-10">
                            <c:if test="${blogConfig.blogArticleSub==true}">
                                <label class="radio-inline">
                                    <input type="radio" name="blogArticleSub"  value="true" checked> 是
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="blogArticleSub" value="false"> 否
                                </label>
                            </c:if>
                            <c:if test="${blogConfig.blogArticleSub==false}">
                                <label class="radio-inline">
                                    <input type="radio" name="blogArticleSub" value="true"> 是
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="blogArticleSub"  value="false" checked> 否
                                </label>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2 pull-right">
                            <button type="submit" class="btn btn-default" id="blog-config-setting">提交
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<jsp:include page="bottom.jsp"></jsp:include>
</html>
<script>
    $('form').submit(function () {
        var data=$(this).serialize();
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/blog-setting",
            data:data,
            async:true,
            type:"POST",
            dataType:"JSON",
            success:function (status) {
                if(status===1){
                    if(alert("修改成功")){
                        window.location.href="${pageContext.request.contextPath}/admin/blog-setting-jsp";
                    }
                }else{
                    alert("修改失败，请重新修改")
                }
            }
        });
        return false;
    })
</script>