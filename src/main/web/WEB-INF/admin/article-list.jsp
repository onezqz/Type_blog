<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>s
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>文章列表</title>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="col-md-12 col-sm-12" id="main" role="main">
        <div class="table-responsive">
            <table class="table table-striped">
                <caption><label>文章管理</label></caption>
                <thead>
                <tr>
                    <th>缩略名</th>
                    <th>评论数</th>
                    <th>标题</th>
                    <th>分类</th>
                    <th>日期</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty pageBean.contentList}">
                    <tr>
                        <td>
                            暂无数据
                        </td>
                    </tr>
                </c:if>
                <c:if test="${!empty pageBean.contentList}">
                    <c:forEach items="${pageBean.contentList}" var="content">
                        <tr>
                            <td>${content.slug}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/comment/list?cid=${content.cid}">${content.commentsNum}</a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/article/edit?cid=${content.cid}">${content.title}</a>
                                <a href="${pageContext.request.contextPath}/article/articleInfo?cid=${content.cid}">
                                    <span class="glyphicon glyphicon-link"></span>
                                </a>
                            </td>
                            <td>
                            <c:if test="${!empty content.metaList}">
                                <c:forEach items="${content.metaList}" var="meta">
                                    <c:if test="${meta.type=='category'}">
                                        <a href="${pageContext.request.contextPath}/admin/category/edit?mid=${meta.mid}">${meta.name}</a>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            </td>

                            <td><fmt:formatDate value="${content.created}" pattern="${blogArticleTimeFormat}"/></td>
                            <td>
                                <button class="btn btn-xs btn-danger" onclick="deleteFun('${content.cid}')">删除</button>
                                <c:if test="${content.status=='draft'}">
                                    <button class="btn btn-xs btn-success" onclick="publishFun('${content.cid}')">发表</button>
                                </c:if>
                                <c:if test="${content.status=='publish'}">
                                    <button class="btn btn-xs btn-warning" onclick="draftFun('${content.cid}')">草稿</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
        <%--分页--%>
        <div style="padding-left: 90%">
            <ul class="pagination">
                <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
                    <c:if test="${pageBean.currentPage==page}">
                        <li class="active"><a href="javascript:void(0)">${page}</a></li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=page}">
                        <li class="">
                            <a href="${pageContext.request.contextPath}/admin/article/list?page=${page}">${page}</a>
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
    function deleteFun(cid) {
        if(confirm("确定删除该项？")){
            window.location.href="${pageContext.request.contextPath}/admin/article/delete?cid="+cid;
        }
    }

    function publishFun(cid) {
        window.location.href="${pageContext.request.contextPath}/admin/article/status?status=publish&cid="+cid;
    }
    function draftFun(cid) {
        window.location.href="${pageContext.request.contextPath}/admin/article/status?status=draft&cid="+cid;
    }
</script>
