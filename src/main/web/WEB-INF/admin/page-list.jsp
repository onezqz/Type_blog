<%--
  Created by IntelliJ IDEA.
  User: onezqz
  Date: 2018/12/10
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>页面列表</title>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="col-md-12 col-sm-12" id="main" role="main" style="left: 100px">
        <div class="table-responsive">
            <table class="table table-striped">
                <caption><label>页面管理</label></caption>
                <thead>
                <tr>
                    <th>缩略名</th>
                    <th>评论数</th>
                    <th>标题</th>
                    <th>日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty pageList}">
                    <tr>
                        <td>
                            暂无数据
                        </td>
                    </tr>
                </c:if>
                <c:if test="${!empty pageList}">
                    <c:forEach items="${pageList}" var="page">
                        <tr>
                            <td>${page.slug}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/comment/list?cid=${page.cid}">${page.commentsNum}</a></td>
                            <td><a href="${pageContext.request.contextPath}/admin/page/edit?cid=${page.cid}">${page.title}</a>
                                <a href="${pageContext.request.contextPath}/user/page?cid=${page.cid}">
                                    <span class="glyphicon glyphicon-link"></span></a>
                            </td>
                            <td><fmt:formatDate value="${page.created}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <button class="btn btn-xs btn-danger" onclick="deleteFun('${page.cid}')">删除</button>
                                <c:if test="${page.status=='draft'}">
                                    <button class="btn btn-xs btn-success" onclick="publishFun('${page.cid}')">发表</button>
                                </c:if>
                                <c:if test="${page.status=='publish'}">
                                    <button class="btn btn-xs btn-warning" onclick="draftFun('${page.cid}')">草稿</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
        <%--分页--%>
        <div class="pull-right">
            <ul class="pagination">
                <li class="active">
                    <a href="#"></a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
<!-- 引入footer.jsp -->
<jsp:include page="bottom.jsp"></jsp:include>
</html>
<script>
    function deleteFun(cid) {
        if(confirm("确定删除该项？")){
            window.location.href="${pageContext.request.contextPath}/admin/page/delete?cid="+cid;
        }
    }

    function publishFun(cid) {
        window.location.href="${pageContext.request.contextPath}/admin/page/status?status=publish&cid="+cid;
    }
    function draftFun(cid) {
        window.location.href="${pageContext.request.contextPath}/admin/page/status?status=draft&cid="+cid;
    }
</script>