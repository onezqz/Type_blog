<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${content.title}-${blogName}</title>
</head>
<body>
<div class="container-fluid">
    <!--引入header.jsp-->
    <jsp:include page="header.jsp"></jsp:include>
    <div class="col-md-8 col-md-push-2 col-sm-12" id="main" role="main">
        <article class="post">
            <%--content--%>
            <c:if test="${content.type=='article'}">
                <ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/article/index">首页</a>
                    </li>
                    &nbsp;
                    <span>/</span>&nbsp;
                    <c:if test="${!empty categoryList}">
                        <c:forEach items="${categoryList}" var="category" varStatus="vs">
                            <c:if test="${size==vs.count}">
                                <span>
                                    <a href="${pageContext.request.contextPath}/article/category?type=category&name=${category.name}&mid=${category.mid}">
                                        ${category.name}
                                    </a>
                                </span>
                            </c:if>
                            <c:if test="${size!=vs.count}">
                                <span>
                                    <a href="${pageContext.request.contextPath}/article/category?type=category&name=${category.name}&mid=${category.mid}">
                                            ${category.name}
                                    </a>
                                    --
                                </span>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    &nbsp;<span>/</span>&nbsp;
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/article/articleInfo?cid=${content.cid}">${content.title}</a>
                    </li>
                </ol>
            </c:if>
            <%--page--%>
            <c:if test="${content.type=='page'}">
                <h1 class="post-title">
                    <a href="${pageContext.request.contextPath}/article/page?cid=${content.cid}">${content.title}</a>
                </h1>
            </c:if>
            <div class="post-content">
                ${content.text}
            </div>
            <p class="tags">
                <c:if test="${!empty tagList}">
                    <c:forEach items="${tagList}" var="tag">
                        <span class="label label-info">
                            <a href="${pageContext.request.contextPath}/article/category?type=tag&name=${tag.name}&mid=${tag.mid}">${tag.name}</a>
                        </span>
                        &nbsp;&nbsp;
                    </c:forEach>
                </c:if>
            </p><br/>
        </article>
        <ul class="pager">
            <c:if test="${!empty preContent}">
            <li class="previous">
                <a href="${pageContext.request.contextPath}/article/articleInfo?cid=${preContent.cid}&preCid=${cidMap[preContent.cid][1]}&nextCid=${cidMap[preContent.cid][0]}"
                   title="${preContent.title}">${preContent.title}</a>
            </li>
            </c:if>
            <c:if test="${!empty nextContent}">
            <li class="next">
                <a href="${pageContext.request.contextPath}/article/articleInfo?cid=${nextContent.cid}&preCid=${cidMap[nextContent.cid][1]}&nextCid=${cidMap[nextContent.cid][0]}"
                   title="${nextContent.title}">${nextContent.title}</a>
            </li>
            </c:if>
        </ul>
        <div class="panel-group" id="comment-form">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#comment-form" href="#comment">
                            查看评论
                        </a>
                    </h4>
                </div>
                <div id="comment" class="panel-collapse collapse">
                    <div class="panel-body">
                        <jsp:include page="comments.jsp"></jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- end #main-->
</div>
<!--引入footer.jsp-->
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>