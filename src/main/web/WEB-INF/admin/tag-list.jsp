<%--
  Created by IntelliJ IDEA.
  User: onezqz
  Date: 2018/12/11
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理标签</title>
    <script>
        function updateTag(mid) {
            $.ajax({
                async:true,
                url:"${pageContext.request.contextPath}/admin/tag/edit",
                data:{"mid":mid},
                type:"POST",
                dataType:"json",
                success:function (data) {
                    $("#tagEdit").html("编辑标签");
                    $("#mid").val(data.mid);
                    $("#tagName").val(data.name);
                    $("#tagSlug").val(data.slug);
                    $("#tagDesc").val(data.description);
                    $("#tag-delete").css("display","block")
                }
            });
        }
    </script>
    <script>
        function deleteTagFun() {
            var mid=$("#mid").val();
            if(confirm("确定删除该项？")){
                window.location.href="${pageContext.request.contextPath}/admin/tag/delete?mid="+mid;
            }
        }
    </script>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="col-md-12 col-sm-12" id="main" role="main" style="left: 100px">
        <div class="table-caption">
            <h4>管理标签</h4>
        </div>
        <div class="row">
            <div class="col-md-8 col-sm-8">
                <ul class="list-inline">
                    <c:forEach items="${tagList}" var="tag">
                    <li class="tagList">
                        <a class="tagLink" onclick="updateTag('${tag.mid}')" style="font-size: medium">${tag.name}</a>
                        <span class="badge">${empty tag.count?0:tag.count}</span>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-4 col-md-4" style="right:150px">
                <form class="form-horizontal" role="form" id="tag-edit"
                        action="${pageContext.request.contextPath}/admin/tag/insert" method="post">
                    <input id="mid" type="hidden" name="mid">
                    <input id="type" type="hidden" name="type" value="tag">
                    <div class="introduction">
                        <h4 id="tagEdit">
                            新建标签
                        </h4>
                    </div>
                    <table>
                        <tr>
                            <td><label class="control-label" for="tagName">名称</label></td>
                            <td><input class="form-control" type="text" id="tagName" name="name"></td>
                        </tr>
                        <tr>
                            <td><label class="control-label" for="tagSlug">简称</label></td>
                            <td><input class="form-control " type="text" id="tagSlug" name="slug"></td>
                        </tr>
                        <tr>
                            <td><label class="control-label" for="tagDesc">介绍</label></td>
                            <td><textarea class="form-control col-md-10" name="description" id="tagDesc"></textarea></td>
                        </tr>
                    </table>
                    <div class="form-group pull-right">
                        <button class="btn btn-danger pull-left" id="tag-delete" style="display:none"
                                onclick="deleteTagFun();return false;">删除</button>
                        <button type="submit" class="btn btn-default" id="tag-submit">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<!-- 引入footer.jsp -->
<jsp:include page="bottom.jsp"></jsp:include>
</html>
