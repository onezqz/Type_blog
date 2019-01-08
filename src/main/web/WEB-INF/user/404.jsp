<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>onezqz blog</title>
	</head>
    <body>
    	<div class="container-fluid">
    		<!--引入header.jsp-->
    		<jsp:include page="header.jsp"></jsp:include>
            <div class="col-md-8 col-md-push-2 col-sm-12">
                <div class="error-page">
                        <h2 class="post-title">404 - 页面没找到</h2>
                        <p>你想查看的页面已被转移或删除了, 要不要搜索看看</p>
                        <form method="post">
                            <p><input type="text" name="s" class="text" autofocus /></p>
                            <p><button type="submit" class="submit">搜索</button></p>
                        </form>
                </div>
            </div>
        </div>
    			    <!--引入footer.jsp-->
    		<jsp:include page="footer.jsp"></jsp:include>
 	</body>
</html>