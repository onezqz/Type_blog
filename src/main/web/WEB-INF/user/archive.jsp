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
    		
			<div class="col-md-8 col-md-push-2 col-sm-12" id="main" role="main">
    			<h3 class="archive-title">archiveTitle</h3>
	        	<!--<?php if ($this->have()): ?>
    			<?php while($this->next()): ?>-->
                <article class="post-list">
                    <div>
                        <a class="post-title" href="<?php $this->permalink() ?>">title</a>
                        <div class="pull-right p-time">
                            <i class="glyphicon glyphicon-time"></i> date
                        </div>
                    </div>
                    <div class="post-content">
                        content  阅读剩余部分 
                    </div>
                </article>
                <!--<?php endwhile; ?>
        		<?php else: ?>-->
	            <article class="post">
	                <h3 class="post-title">没有找到内容</h3>
	            </article>
		        <ul class="pager">
		            <li class="previous">pageLink</li>
		            <li class="next">pageLink</li>
		        </ul>
			</div><!-- end #main -->
        </div>
    			    <!--引入footer.jsp-->
    	<jsp:include page="footer.jsp"></jsp:include>
 	</body>
</html>