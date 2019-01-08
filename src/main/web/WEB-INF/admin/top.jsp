<%--
  Created by IntelliJ IDEA.
  User: onezqz
  Date: 2018/12/4
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prism.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/prism.js"></script>
</head>
<header id="header">
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header" style="padding-left: 5px">
            <a class="navbar-brand navbar-left" href="">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/index">控制台</a>
            </a>
        </div>
        <div class="btn-group" style="padding-top: 10px;padding-left: 10px">
            <button type="button" style=";background: #2f974a;color: white" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                撰写 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/admin/article-post-jsp">新建文章</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/page-post-jsp">新建页面</a></li>
            </ul>
        </div>
        <div class="btn-group" style="padding-top: 10px;padding-left: 10px">
            <button type="button" style=";background: #2f974a;color: white" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                管理 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/admin/article/list">文章</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/page/list">页面</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/comment/list">评论</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/category/list">分类</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/tag/list">标签</a></li>
            </ul>
        </div>
        <div class="btn-group" style="padding-top: 10px;padding-left: 10px">
            <button type="button" style=";background: #2f974a;color: white" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                设置 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/admin/blog-setting-jsp">博客设置</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/user-setting-jsp">用户设置</a></li>
            </ul>
        </div>
        <div class="collapse navbar-collapse navbar-right" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active" >
                    <a href="javascript:void(0)">管理员：${user.name}</a>
                </li>
                <li >
                    <a href="${pageContext.request.contextPath}/admin/logout" title="logout">退出</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/article/index">网站</a></li>
            </ul>
        </div>
    </nav>
</header><!-- end #header -->
