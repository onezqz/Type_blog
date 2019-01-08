<%--
  Created by IntelliJ IDEA.
  User: onezqz
  Date: 2018/12/9
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新建页面</title>
    <script>
        Date.prototype.format = function (format) {
            var args = {
                "M+": this.getMonth() + 1,
                "d+": this.getDate(),
                "h+": this.getHours(),
                "m+": this.getMinutes(),
                "s+": this.getSeconds(),
                "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
                "S": this.getMilliseconds()
            };
            if (/(y+)/.test(format))
                format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var i in args) {
                var n = args[i];
                if (new RegExp("(" + i + ")").test(format))
                    format = format.replace(RegExp.$1, RegExp.$1.length === 1 ? n : ("00" + n).substr(("" + n).length));
            }
            return format;
        };
        var time=new Date().format("yyyy-MM-dd hh:mm:ss");
    </script>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <jsp:include page="top.jsp"></jsp:include>
    <!--发帖内容 -->
    <form action="${pageContext.request.contextPath}/admin/page/insert" method="post" id="postId">
        <input type="hidden" name="type" value="page">
        <div class="col-md-9 col-sm-9" style="left:220px ;width: 680px">
            <div class="col-md-12 col-sm-12" style="height:90px;padding:1px;border: 1px solid white">
                <span style="font-size: medium">标题</span><br/><br/>
                <input type="text" id="title" name="title"
                       style="width: 99.4% ;height:40px;padding-top: 3px" maxlength="100" placeholder="输入页面标题">
            </div>
            <div class="col-md-12 col-sm-12" style="height:40px;padding:1px;border: 1px solid white">
                <span>/page?slug=</span>
                <label><input type="text" id="slug" name="slug" maxlength="50"></label>
            </div>
            <div class="col-md-12 col-sm-12" style="top: auto;text-align:center;height:315px;padding:1px;border: 1px solid white">
                <textarea id="text" name="text" rows="30" style="width: 99.4% ;height: 99%"></textarea>
            </div>
        </div>
        <div class="col-md-3 col-sm-3" style="height:450px;left:220px ;border: 1px solid white">
            <div style="padding-left: 10px;padding-top: 10px">
                <span style="font-size: medium">时间</span><br/>
                <input type="date" id="created" name="created" value="">
                <%--datetime-local--%>
            </div>
            <div style="padding-left: 10px;padding-top: 20px">
                <a data-toggle="collapse" data-parent="#advance-form" href="#advance">
                    高级设置
                </a>
                <br/>
                <div id="advance" class="panel-collapse collapse">
                    <div class="checkbox">
                        <label><input type="checkbox" name="allowComment" value="1">允许评论</label>
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" name="allowPing" value="1">允许引用</label>
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" name="allowFeed" value="1">允许在聚合中出现</label>
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
