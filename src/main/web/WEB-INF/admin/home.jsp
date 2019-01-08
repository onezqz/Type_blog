<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
        <meta http-equiv="Content-Language" content="zh-cn">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理员首页</title>
  </head>
    <body>
    <div class="container-fluid" style="padding-top: 8px">
        <jsp:include page="top.jsp"></jsp:include>
        <div class="col-md-12" style="width: 70%;left: 260px; text-align:center;height:77px;border: 1px solid white">
            <div id="overview">
                <h3>目前已经有了<big><b><em style="color: red">${empty articleCount?0:articleCount}</em></b></big>个文章，
                    <big><b><em style="color: red">${empty pageCount?0:pageCount}</em></b></big>个页面，
                    <big><b><em style="color: red">${empty commentCount?0:commentCount}</em></b></big>个评论，
                    <big><b><em style="color: red">${empty categoryCount?0:categoryCount}</em></b></big>个分类，
                    <big><b><em style="color: red">${empty tagCount?0:tagCount}</em></b></big>个标签。
                </h3>
                <%--<div id="shortcuts">--%>
                    <%--<ul class="list-inline">--%>
                        <%--<li><a href="/admin/article/edit">创建文章</a></li>--%>
                        <%--<li><a href="/admin/article/list">管理文章</a></li>--%>
                        <%--<li><a href="/admin/comment/list">管理评论</a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            </div>
        </div>
        <div class="col-md-12" style="width: 70%;left: 260px;top:10px; text-align:center;height:370px;padding:1px;border: 1px solid white">
            <div id="contents">
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <h3>最近的文章</h3>
                        <div style="padding-left: 85px">
                            <table>
                                <tbody >
                                <c:forEach items="${contentList}" var="content">
                                <tr style="height: 25px">
                                    <td>
                                        <span><fmt:formatDate value="${content.created}" pattern="MM-dd"/></span>&nbsp;&nbsp;
                                        <a href="${pageContext.request.contextPath}/article/articleInfo?cid=${content.cid}">${content.title}</a>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <h3>最近的页面</h3>
                        <div style="padding-left: 85px ;">
                            <table>
                                <tbody >
                                <c:forEach items="${pageList}" var="page">
                                    <tr style="height: 25px">
                                        <td>
                                            <span><fmt:formatDate value="${page.created}" pattern="MM-dd"/></span>&nbsp;&nbsp;
                                            <a href="${pageContext.request.contextPath}/article/page?cid=${page.cid}">${page.title}</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <h3>最近的评论</h3>
                        <div style="padding-left: 85px ;">
                            <table>
                                <tbody >
                                <c:forEach items="${commentList}" var="comment">
                                    <tr style="height: 25px">
                                        <td>
                                            <span><fmt:formatDate value="${comment.created}" pattern="MM-dd"/></span>
                                            <a href="${comment.url}">${comment.author}</a>:&nbsp;&nbsp;${comment.text}
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
    <jsp:include page="bottom.jsp"></jsp:include>
</html>
