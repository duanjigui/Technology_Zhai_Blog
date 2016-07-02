<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<title>欢迎页面</title>
		<style>
			img {
				width: 100%;
				height: 750px;
			}
			.current-time > small{
				color: deepskyblue;
			}
			tr {
				height: 55px;
				margin: 5px;
			}
			.table>tbody>tr>td {
				padding-top: 20px;
				padding-left: 20px;
				font-size: 18px;
			}
		</style>
	</head>

	<body>
		
		<div class="col-lg-8">
			<ol class="breadcrumb">
			  <li><a href="#">当前位置</a></li>
			  <li><a href="#">管理员主页</a></li>
			  <li class="active">欢迎页</li>
			  <li>登录时间：<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%></li>
			</ol>
			<div class="col-md-12">
				<div class="page-header">
				  <h1>请注意保护密码安全<small>选择一项开始工作吧！</small>
				  	<span class="current-time"><small></small></span>
				  </h1>
				  
				</div>
			</div>
			
			<div class="col-md-12">
				<table class="table table-striped">
				  <tr>
				  	<td>操作系统</td>
				  	<td>CentOS-7</td>
				  </tr>
				  <tr>
				  	<td>数据库信息</td>
				  	<td>MariaDB10</td>
				  </tr>
				  <tr>
				  	<td>服务器信息</td>
				  	<td>Tomcat 7.0及以上</td>
				  </tr>
				  <tr>
				  	<td>Java版本</td>
				  	<td>1.8.0_60</td>
				  </tr>
				  <tr>
				  	<td>版本信息</td>
				  	<td>V1.0</td>
				  </tr>
				</table>
				
			</div>
		<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</body>

</html>