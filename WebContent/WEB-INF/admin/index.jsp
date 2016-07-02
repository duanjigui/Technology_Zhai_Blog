<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!--
	作者：武文良 
-->
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/manager-index.css" />
<title>科技宅博客后台管理系统</title>
</head>

<body>
	<div class="header">

		<nav class="navbar navbar-default navbar-fixed-top navbar-inverse"
			role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><strong>科技宅后台管理系统</strong><sup>TM</sup></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">网站首页<span class="sr-only">(current)</span></a></li>

					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><strong>欢迎管理员<font color="red"><%=session.getAttribute("adminname")%></font></strong></a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">菜单 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="adminlogout">安全退出</a></li>
								<li role="separator" class="divider"></li>
								<li><a data-toggle="modal" data-target="#userinfo">用户信息</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>



	<div class="main">
		<table border="1" width="100%" cellspacing="0" cellpadding="0"
			height="100%" class="table" bordercolor="#cccccc">
			<tr>
				<td width="300" id="menulist">
					<ul class="list-group">
						<!-- 一级菜单 -->
						<li class="list-group-item first-title">
							<h3 class="first-title-h3">
								<strong>User<i class="glyphicon glyphicon-user"></i></strong>
							</h3>
						</li>
						<!-- 二级菜单 -->
						<li class="list-group-item second-title">
							<h3 onclick="showSub('userMenu')">
								用户管理<i class="glyphicon glyphicon-circle-arrow-down"></i>
							</h3>
						</li>
						<li class="list-group-item" id="userMenu">
							<ul class="list-group">
								<li class="list-group-item"><a href="frameuserlist"
									target="menuFrame">用户列表</a><i
									class="glyphicon glyphicon-th-list"></i></li>
							</ul>
						</li>


						<!-- 一级菜单 -->
						<li class="list-group-item first-title">
							<h3 class="first-title-h3">
								<strong>article<i class="glyphicon glyphicon-film"></i></strong>
							</h3>
						</li>
						<!-- 二级菜单 -->
						<li class="list-group-item second-title">
							<h3 onclick="showSub('articleMenu')">
								文章管理<i class="glyphicon glyphicon-circle-arrow-down"></i>
							</h3>
						</li>
						<li class="list-group-item" id="articleMenu">
							<ul class="list-group">
								<li class="list-group-item"><a href="framearticlelist"
									target="menuFrame">文章列表</a><i
									class="glyphicon glyphicon-th-list"></i></li>
							</ul>

						</li>
						<!-- 一级菜单 -->
						<li class="list-group-item first-title">
							<h3 class="first-title-h3">
								<strong>Type<i class="glyphicon glyphicon-tags"></i></strong>
							</h3> <!-- 二级菜单 --> <!-- 二级菜单 -->
						<li class="list-group-item second-title">
							<h3 onclick="showSub('typeMenu')">
								分类管理<i class="glyphicon glyphicon-circle-arrow-down"></i>
							</h3>
						</li>
						<li class="list-group-item" id="typeMenu">
							<ul class="list-group">
								<li class="list-group-item"><a href="frametypeadd"
									target="menuFrame">分类添加</a><i class="glyphicon glyphicon-plus"></i></li>
								<li class="list-group-item"><a href="frametypelist"
									target="menuFrame">分类列表</a><i
									class="glyphicon glyphicon-th-list"></i></li>
								<!-- 模态框（Modal） -->

								<div class="modal fade" id="userinfo" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h2 class="modal-title" id="myModalLabel">
													<center>用户信息</center>
												</h2>
											</div>
											<div class="modal-body">	
												<table class="table table-bordered table-striped table-hover">
													<tr>
														<td class="infoname">用户身份</td>
														<td>管理员</td>
													</tr>
													<tr>
														<td class="infoname">用户名</td>
														<td><%=session.getAttribute("adminname")%></td>
													</tr>
													<tr>
														<td class="infoname">登录时间</td>
														<td><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%></td>
													</tr>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-warning"
													data-dismiss="modal">关闭</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal -->
								</div>
							</ul>
						</li>
						</li>
					</ul>
				</td>
				<td id="mainFrame"><iframe id="menuFrame" name="menuFrame"
						src="framewelcome" style="overflow: visible;" scrolling="yes"
						frameborder="no" width="100%"></iframe></td>
			</tr>
		</table>

	</div>

	<nav class="navbar navbar-default navbar-fixed-bottom navbar-inverse"
		role="navigation">
		<footer class="foot" class="navbar-fixed-top">
			<h4 class="footer-words">
				<center>剑心工作室©2016</center>
			</h4>
		</footer>
	</nav>
	<script type="text/javascript">
		function showSub(str) {
			var content2 = document.getElementById([ str ]);
			if (content2.style.display == "block") {
				content2.style.display = "none";
			} else {
				content2.style.display = "block";
			}
		}
	</script>
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>

</html>