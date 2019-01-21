<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户设置</title>
</head>
<body>
<div class="container-fluid" style="padding-top: 8px">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="col-md-12 col-sm-12" id="main" role="main">
        <form class="form-horizontal" role="form" id="user-config">
            <input type="hidden" name="uid" value="${user.uid}">
            <div class="introduction">
                <h4>
                    用户设置
                </h4>
            </div>
            <div class="row">
                <div class="col-md-8 center-block">
                    <div class="form-group">
                        <label class="control-label col-md-2" for="uid">用户Id</label>
                        <div class="col-md-10">
                            <input class="form-control" type="text" id="uid" value="${user.uid}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="name">用户名</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="name" name="name"
                                   value="${user.name}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-2" for="password">用户密码</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="password" id="password" name="password"
                                   value="${user.password}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="mail">用户邮箱</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="mail"
                                   name="mail" value="${user.mail}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-2" for="url">用户网站</label>
                        <div class="col-md-10">
                            <input class="form-control col-md-10" type="text" id="url"
                                   name="url" value="${user.url}">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-2 pull-right">
                            <button type="submit" class="btn btn-default" id="user-config-setting">提交
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
            url:"${pageContext.request.contextPath}/admin/user-setting",
            data:data,
            type:"POST",
            dataType:"JSON",
            async:true,
            success:function (flag) {
                if(flag===1){
                    alert("修改成功")
                    window.location.href="${pageContext.request.contextPath}/admin/user-setting-jsp";
                }else{
                    alert("修改失败，请重新修改")
                }
            }
        });
        return false;
    })
</script>