<%--
  Created by IntelliJ IDEA.
  User: onezqz
  Date: 2018/12/10
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加分类</title>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <jsp:include page="top.jsp"></jsp:include>
        <div class="col-md-12 col-sm-12" id="main" role="main" >
            <form class="form-horizontal" role="form" id="category-edit"
                  action="${pageContext.request.contextPath}/admin/category/insert" method="post">
                <input type="hidden" name="type" value="category">
                <div class="introduction">
                    <h4>
                        新建
                    </h4>
                </div>
                <div class="row">
                    <div class="col-md-8 center-block">
                        <div class="form-group">
                            <label class="control-label col-md-2" for="name">名称</label>
                            <div class="col-md-10">
                                <input class="form-control" type="text" id="name" name="name" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2" for="slug">缩略名</label>
                            <div class="col-md-10">
                                <input class="form-control col-md-10" type="text" id="slug" name="slug" value="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-2" for="description">介绍</label>
                            <div class="col-md-10">
                                <textarea class="form-control col-md-10" name="description" id="description">
                                </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 pull-right">
                                <button type="submit" class="btn btn-default" id="meta-submit">发表</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
</div>
</body>
<!-- 引入footer.jsp -->
<jsp:include page="bottom.jsp"></jsp:include>
</html>

