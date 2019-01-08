<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>编辑页面</title>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <jsp:include page="top.jsp"></jsp:include>
    <form action="${pageContext.request.contextPath}/admin/page/insert" method="post" id="postId">
        <input type="hidden" name="type" value="page">
        <input type="hidden" name="cid" value="${page.cid}">
        <div class="col-md-9 col-sm-9" style="left:220px ;width: 680px">
            <div class="col-md-12 col-sm-12" style="height:90px;padding:1px;border: 1px solid white">
                <span style="font-size: medium">标题</span>
                <br/><br/>
                <input type="text" id="title" name="title" value="${page.title}"
                       style="width: 99.4% ;height:40px;padding-top: 3px" maxlength="100" placeholder="输入页面标题">
            </div>
            <div class="col-md-12 col-sm-12" style="height:40px;padding:1px;border: 1px solid white">
                <span>/page?slug=</span>
                <label><input type="text" id="slug" name="slug" maxlength="50" value="${page.slug}"></label>
            </div>
            <div class="col-md-12 col-sm-12" style="top: auto;text-align:center;height:315px;padding:1px;border: 1px solid white">
                <textarea id="text" name="text" rows="30" style="width: 99.4% ;height: 99%">${page.text}</textarea>
            </div>
        </div>
        <div class="col-md-3 col-sm-3" style="height:450px;left:220px ;border: 1px solid white">
            <div style="padding-left: 10px;padding-top: 10px">
                <span style="font-size: medium">时间</span><br/>
                <input type="date" id="created" name="created"
                value="<fmt:formatDate value='${page.created}' pattern='yyyy-MM-dd'/>">
            </div>
            <div style="padding-left: 10px;padding-top: 20px">
                <a data-toggle="collapse" data-parent="#advance-form" href="#advance">
                    高级设置
                </a>
                <br/>
                <div id="advance" class="panel-collapse collapse">
                    <div class="checkbox">
                        <c:if test="${empty page.allowComment}">
                            <label><input type="checkbox" name="allowComment" value="1">允许评论</label>
                        </c:if>
                        <c:if test="${!empty page.allowComment}">
                            <label><input type="checkbox" name="allowComment" value="1" checked="checked">允许评论</label>
                        </c:if>
                    </div>
                    <div class="checkbox">
                        <c:if test="${empty page.allowPing}">
                            <label><input type="checkbox" name="allowPing" value="1">允许引用</label>
                        </c:if>
                        <c:if test="${!empty page.allowPing}">
                            <label><input type="checkbox" name="allowPing" value="1" checked="checked">允许引用</label>
                        </c:if>
                    </div>
                    <div class="checkbox">
                        <c:if test="${empty page.allowFeed}">
                            <label><input type="checkbox" name="allowFeed" value="1">允许在聚合中出现</label>
                        </c:if>
                        <c:if test="${!empty page.allowFeed}">
                            <label><input type="checkbox" name="allowFeed" value="1" checked="checked">允许在聚合中出现</label>
                        </c:if>
                    </div>
                    <label class="radio-inline">
                        <c:if test="${page.status=='publish'}">
                            <input type="radio"  name="status" value="publish" checked="checked">发表
                        </c:if>
                        <c:if test="${page.status!='publish'}">
                            <input type="radio" name="status"  value="publish">发表
                        </c:if>
                    </label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label class="radio-inline">
                        <c:if test="${page.status=='draft'}">
                            <input type="radio" name="status"  value="draft" checked="checked">草稿
                        </c:if>
                        <c:if test="${page.status!='draft'}">
                            <input type="radio" name="status"  value="draft">草稿
                        </c:if>
                    </label>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-sm-12" style="height:50px;left:235px ;width: 680px;border: 1px solid white">
            <div class="form-group">
                <div style="padding-top: 10px;padding-left: 350px">
                    <input type="submit" width="100" value="提交">
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<!-- 引入footer.jsp -->
<jsp:include page="bottom.jsp"></jsp:include>
</html>