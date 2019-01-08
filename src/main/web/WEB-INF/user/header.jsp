<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prism.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/prism.js"></script>
	<!-- 使用url函数转换相关路径 -->
	<!--<link rel="stylesheet" href="<?php $this->options->themeUrl('css/bootstrap.min.css'); ?>">
	<link rel="stylesheet" href="<?php $this->options->themeUrl('css/style.css'); ?>">
	<link rel="stylesheet" href="<?php $this->options->themeUrl('css/prism.css'); ?>">-->

	<!-- 通过自有函数输出HTML头部信息 -->
	<!-- <?php $this->header(); ?>-->
    <script>
        <c:if test="${!empty meta}">
            var metaMid=${meta.mid};
        </c:if>
    </script>
    <script>
        $(function () {
            var categoryContent="";
            var pageContent="";
            $.ajax({
                url:"${pageContext.request.contextPath}/article/headerInfo",
                async:true,
                dataType:"JSON",
                type:"POST",
                success:function (data) {
                    $("#headerId").html(data[2]);
                    if(data.length===0){
                        $("#categoryId").html(categoryContent);
                        $("#pageId").html(pageContent);
                    }
                    for(var i=0;i<data[0].length;i++){
                        var cateLi="";
                        if(${!empty meta}){
                            // 域里面的值一定要提前取出来
                            if(data[0][i].mid===metaMid){
                                cateLi="<li id="+(i+1)+"   class='active'>" +
                                    "<a href='${pageContext.request.contextPath}/article/category?type=category&name="
                                    +data[0][i].name+"&mid="+data[0][i].mid+"'>"+data[0][i].name+"</a>" +
                                "</li>";
                            }
                            if(data[0][i].mid!==metaMid){
                                cateLi="<li id="+(i+1)+">" +
                                    "<a href='${pageContext.request.contextPath}/article/category?type=category&name="
                                    +data[0][i].name+"&mid="+data[0][i].mid+"'>"+data[0][i].name+"</a>" +
                                    "</li>";
                            }
                        }
                        if(${empty meta}){
                            cateLi="<li id="+(i+1)+">" +
                                "<a href='${pageContext.request.contextPath}/article/category?type=category&name="
                                +data[0][i].name+"&mid="+data[0][i].mid+"'>"+data[0][i].name+"</a>" +
                                "</li>";
                        }
                        categoryContent+=cateLi;
                    }
                    if(${empty meta} && ${empty content}){ // 首页
                        categoryContent=
                            "<li class='active' >" +
                                "<a href='${pageContext.request.contextPath}/article/index'>首页</a>"+
                            "</li>"+categoryContent;
                    }
                    if(${!empty meta} && ${empty content}){ // 分类页
                        categoryContent=
                            "<li >" +
                            "<a href='${pageContext.request.contextPath}/article/index'>首页</a>"+
                            "</li>"+categoryContent;
                    }
                    if(${empty meta} && ${!empty content}){ // 详情页
                        categoryContent=
                            "<li >" +
                            "<a href='${pageContext.request.contextPath}/article/index'>首页</a>"+
                            "</li>"+categoryContent;
                    }
                    $("#categoryId").html(categoryContent);

                    if(data[1].length!==0){
                        for(var j=0;j<data[1].length;j++){
                            pageContent+="<li><a href='${pageContext.request.contextPath}/article/page?cid="+
                                data[1][j].cid+"'>"+data[1][j].title+"</a></li>";
                        }
                        pageContent="<li class=\"dropdown\">" +
                            "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">" +
                            "页面 <b class=\"caret\"></b></a>"+
                            "<ul class=\"dropdown-menu\" >"+pageContent+"</ul></li>";
                        $("#pageId").html(pageContent);
                    }else{
                        $("#pageId").html("");
                    }
                }
            })
        })
    </script>
</head>
<header id="header">
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
    		<div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar">1</span>
                    <span class="icon-bar">2</span>
                    <span class="icon-bar">3</span>
                </button>
                <a id="headerId" class="navbar-brand navbar-left" href="${pageContext.request.contextPath}/article/index">
                </a>
    		</div>
    		<div class="collapse navbar-collapse navbar-right" id="example-navbar-collapse">
        		<ul class="nav navbar-nav" id="categoryId" >
                    <%--<li onclick="activeFun()"><a>1</a></li>--%>
                    <%--<li><a>1</a></li>--%>
                    <%--<li><a>1</a></li>--%>
                    <%--<li><a>1</a></li>--%>
                    <%--<li><a>1</a></li>--%>
                    <%--<li><a>1</a></li>--%>
        		</ul>
                <ul class="nav navbar-nav" id="pageId">
                    <%--<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
                        <%--页面 <b class="caret"></b></a>--%>
                        <%--<ul class="dropdown-menu" >--%>
                            <%--<li><a>1</a></li>--%>
                            <%--<li><a>1</a></li>--%>
                            <%--<li><a>1</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                </ul>
    		</div>
		</div>
	</nav>
</header><!-- end #header -->