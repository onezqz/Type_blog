<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <title>新建文章</title>
    <script>
        $(function () {
            var content="";
            $.ajax({
                //async:true,
                url:"${pageContext.request.contextPath}/admin/category/json",
                dataType:"json",
                type:"POST",
                success:function (data) { //metaList
                    for(var i=0;i<data.length;i++) {
                        content += "<label>" +
                            "<input type='checkbox' name='category[]' value='" + data[i].name + "'>" + data[i].name
                            + "</label><br>";
                    }
                    $("#category").html(content);
                }
            });
        });
    </script>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <jsp:include page="top.jsp"></jsp:include>
    <!--发帖内容 -->
    <form action="${pageContext.request.contextPath}/admin/article/insert" method="post" id="postId">
        <input type="hidden" name="type" value="article">
        <div class="col-md-9 col-sm-9" style="left:220px ;width: 680px">
            <div class="col-md-12 col-sm-12" style="height:90px;padding:1px;border: 1px solid white">
                <span style="font-size: medium">标题</span>
                <br/><br/>
                <input type="text" id="title" name="title" value=""
                       style="width: 99.4% ;height:40px;padding-top: 3px" maxlength="100" placeholder="输入文章标题">
            </div>
            <div class="col-md-12 col-sm-12" style="height:40px;padding:1px;border: 1px solid white">
                <span>/article?slug=</span>
                <label><input type="text"  value="" id="slug" name="slug" maxlength="50"></label>
            </div>
            <div class="col-md-12 col-sm-12"
                 style="top: auto;text-align:center;height:315px;padding:1px;border: 1px solid white">
                <textarea id="text" name="text" rows="30" style="width: 99.4% ;height: 99%">
                </textarea>
            </div>
        </div>
        <div class="col-md-3 col-sm-3" style="height:450px;left:220px ;border: 1px solid white">
            <div style="padding-left: 10px;padding-top: 10px">
                <span style="font-size: medium">时间</span>
                <br/>
                <input type="date" id="created" name="created">
            </div>
            <div style="padding-left: 10px;padding-top: 40px">
                <label>分类：</label>
                <div class="checkbox" id="category">

                </div>
            </div>
            <div style="padding-left: 10px;padding-top: 20px">
                <label>标签：</label><br/>
                <label><input type="text" id="tags" name="tags" placeholder="如：A B" value=""
                              style="width: 70%  ;height:25px;padding-top: 3px" maxlength="50">
                </label>
            </div>
            <div style="padding-left: 10px;padding-top: 20px">
                <a data-toggle="collapse" data-parent="#advance-form" href="#advance">
                    高级设置
                </a>
                <br/>
                <div id="advance" class="panel-collapse collapse">
                    <div class="checkbox">
                        <label><input type="checkbox" name="allowComment" value="1" >允许评论</label>
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" name="allowPing" value="1" >允许引用</label>
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" name="allowFeed" value="1" >允许在聚合中出现</label>
                    </div>
                    <label class="radio-inline">
                        <input type="radio"  name="status"  value="publish" > 发表
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio"  name="status"  value="draft" checked="checked"> 草稿
                    </label>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-sm-12" style="height:50px;left:235px ;width: 680px;border: 1px solid white">
            <div class="form-group">
                <div style="padding-top: 10px;padding-left: 350px">
                    <input type="submit" width="100" value="提交">
                    <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                    <%--<input type="submit" width="100" value="发表" name="status">--%>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<!-- 引入footer.jsp -->
<jsp:include page="bottom.jsp"></jsp:include>
</html>
