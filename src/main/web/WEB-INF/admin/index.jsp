<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>博客管理中心</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/prism.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
    <style type="text/css">
        body {
            color: white;
        }
        .error{
            color: red;
            font-size: 13px;
        }
    </style>
    <script>
        $(function () {
            $("#adminForm").validate({
                rules:{
                    "name": {
                        "required": true
                    },
                    "password": {
                        "required": true
                    }
                },
                messages:{
                    "name": {
                        "required": "不能为空"
                    },
                    "password": {
                        "required": "不能为空"
                    }
                }
            });
        });
    </script>
</head>
<body style="background: #278296">
<form method="post" id="adminForm" action="${pageContext.request.contextPath }/admin/login" target="_parent" name="theForm">
    <table cellspacing="0" cellpadding="0" style="margin-top: 100px" align="center">
        <tr>
            <td style="padding-left: 50px">
                <table>
                    <tr>
                        <td>管理员姓名：</td>
                        <td><input type="text" name="name"/></td>
                        <td style="color:red;"><%=request.getAttribute("errorInfo")==null?"":request.getAttribute("errorInfo")%></td>
                    </tr>
                    <tr>
                        <td>管理员密码：</td>
                        <td><input type="password" name="password"/></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><input type="submit" value="进入管理中心" class="button"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<%--<script language="JavaScript">--%>
<%--<!----%>
<%--document.forms['theForm'].elements['username'].focus();--%>

<%--/**--%>
<%--* 检查表单输入的内容--%>
<%--*/--%>
<%--function validate() {--%>
<%--var validator = new Validator('theForm');--%>
<%--validator.required('username', user_name_empty);--%>
<%--//validator.required('password', password_empty);--%>
<%--if (document.forms['theForm'].elements['captcha']) {--%>
<%--validator.required('captcha', captcha_empty);--%>
<%--}--%>
<%--return validator.passed();--%>
<%--}--%>

<%--//-->--%>
<%--</script>--%>
</body>