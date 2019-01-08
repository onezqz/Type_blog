<%--
  Created by IntelliJ IDEA.
  User: onezqz
  Date: 2018/12/10
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理分类</title>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <jsp:include page="top.jsp"></jsp:include>
        <div class="col-md-12 col-sm-12" id="main" role="main" style="left: 150px">
            <div class="table-caption">
                <h4>管理分类 &nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/admin/category-post-jsp">新建</a>
                </h4>
            </div>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>名称</th>
                            <th>缩略名</th>
                            <th>文章数</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty categoryList}">
                            <tr>
                                <td>
                                    暂无数据
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!empty categoryList}">
                            <c:forEach items="${categoryList}" var="category">
                                <tr>
                                    <td><a href="${pageContext.request.contextPath}/admin/category/edit?mid=${category.mid}">${category.name}</a></td>
                                    <td>${category.slug}</td>
                                    <td>${category.count}</td>
                                    <td>
                                        <button class="btn btn-xs btn-danger" id="deleteCategory"
                                                onclick="deleteCategoryFun('${category.mid}')">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
</div>
</body>
<!-- 引入footer.jsp -->
<jsp:include page="bottom.jsp"></jsp:include>
</html>
<script>
    function deleteCategoryFun(mid) {
        if(confirm("确定删除该项？")){
            window.location.href="${pageContext.request.contextPath}/admin/category/delete?mid="+mid;
        }
    }
</script>
