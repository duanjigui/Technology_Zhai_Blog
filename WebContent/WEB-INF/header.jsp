<%@page import="com.techzhai.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer u_id;
	String u_nickname;
	String u_email;
	//通过邮箱获取该登陆用户的全部信息
	UserBean userBean = (UserBean)session.getAttribute("loginUserBean");
	
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>科技宅博客论坛</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/header.css"/>
		<link rel="stylesheet" type="text/css" href="css/footer.css"/>
		<script src="js/jquery-1.12.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	</head>
	
	<script>
		$('#myModal').modal('toggle');
	</script>
	<body>
		<!--导航栏部分开始-->
		<nav class="navbar navbar-default navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">科技宅<sup>TM</sup>博客论坛</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">首页</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">版块列表<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Java</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">PHP</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">C#</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">JavaScript</a></li>
							</ul>
						</li>
					</ul>
					<%
					if (userBean == null) {
					
					%>
						<ul class="nav navbar-nav user">
							<li><a href="user/userlogin">登录</a></li>
							<li><a href="user/userlogin">注册</a></li>
						</ul>
					<% }else{
						u_id = userBean.getU_id(); //ID
						u_nickname = userBean.getU_nickname(); //昵称
						u_email = userBean.getU_email(); //邮箱
					%>
						<ul class="nav navbar-nav user">
							<li><a href="#">用户名：<font color="orange"><%=u_nickname %></font></a></li>
							<li><a href="user/userloginlogout">注销</a></li>
						</ul>
		
						<!-- 发布文章按钮 -->
						<div class="publish-article">
							<a href="homedelopypage"><span class="glyphicon glyphicon-pencil"></span></a>
						</div>
				<% }%>
				</div>
			</div>
		</nav>
		<!--导航栏部分结束-->
		
		
	</body>
</html>