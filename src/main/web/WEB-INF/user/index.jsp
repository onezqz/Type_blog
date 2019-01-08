<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${blogName}</title>

</head>
<body>
<div class="container-fluid">
    <!--引入header.jsp-->
    <jsp:include page="header.jsp"></jsp:include>
    <div class="col-md-8 col-md-push-2 col-sm-12" id="main" role="main">
        <c:if test="${!empty pageBeanList.contentList}">
            <c:forEach items="${pageBeanList.contentList}" var="content" varStatus="vs">
                <article class="post-list">
                    <div>
                        <a class="post-title"
                           href="${pageContext.request.contextPath}/article/articleInfo?cid=${content.cid}&preCid=${cidMap[content.cid][1]}&nextCid=${cidMap[content.cid][0]}">${content.title}
                        </a>
                        <div class="pull-right p-time">
                            <i class="glyphicon glyphicon-time"></i>
                            <fmt:formatDate value="${content.modified}" pattern="yyyy-MM-dd"/>
                        </div>
                    </div>
                    <div class="post-content">
                        <p>${content.text}<br></p>
                        <p class="more">
                            <a href="${pageContext.request.contextPath}/article/articleInfo?cid=${content.cid}&preCid=${cidMap[content.cid][1]}&nextCid=${cidMap[content.cid][0]}" title="${content.title}">
                                - 阅读剩余部分 -
                            </a>
                        </p>
                    </div>
                </article>
            </c:forEach>
        </c:if>
        <c:if test="${empty pageBeanList.contentList}">
            <article class="post">
                <h4 class="post-title">
                    <br><br>
                    <span style="padding-left: 200px ;color: red">没有找到内容</span>
                </h4>
            </article>
        </c:if>
        <!--分页 -->
        <div style="width: 380px; margin: 50px auto 0;">
            <ul class="pagination" style="text-align: center; margin-top: 10px;">
                <%--上一页--%>
                <c:if test="${pageBeanList.currentPage==1}">
                    <li class="disabled">
                        <a href="javascript:void(0);" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageBeanList.currentPage!=1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/article/index?page=${pageBeanList.currentPage-1}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach begin="1" end="${pageBeanList.totalPage}" var="page">
                    <c:if test="${pageBeanList.currentPage==page}">
                        <li class="active"><a href="javascript:void(0)">${page}</a></li>
                    </c:if>
                    <c:if test="${pageBeanList.currentPage!=page}">
                        <li><a href="${pageContext.request.contextPath}/article/index?page=${page}">${page}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <%--下一页--%>
                <c:if test="${pageBeanList.currentPage==pageBeanList.totalPage}">
                    <li class="disabled">
                        <a href="javascript:void(0);" aria-label="Previous">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageBeanList.currentPage!=pageBeanList.totalPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/article/index?page=${pageBeanList.currentPage+1}"
                           aria-label="Previous">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
<!--引入footer.jsp-->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>