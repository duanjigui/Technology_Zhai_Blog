<%@page import="com.techzhai.model.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	List<UserBean> userlist = (List<UserBean>) request.getAttribute("userlist");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<title></title>
<style type="text/css">
.input-group-addon {
	background-color: #9de672;
	font-size: large;
}

#submitbtn {
	margin-right: 30px;
}

.modifyAndDelete {
	text-align: center;
}
/*表格字居中高度适应*/
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th
	{
	text-align: center;
	line-height: 3.4;
	font-size: 17px;
}

#tabletitle {
	text-align: center;
	font-size: 15px;
}

table a {
	color: white;
}

form a:HOVER {
	color: black;
}

#mymodal.modal.fade {
	display: block;
}
</style>

<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
</head>

<body>
	<ol class="breadcrumb">
		<li><a href="#">当前位置</a></li>
		<li><a href="#">User</a></li>
		<li><a href="#">用户管理</a></li>
		<li class="active">用户列表</li>
	</ol>
	<table class="table table-bordered table-striped table-hover">
		<tr id="tabletitle">
			<td>用户id</td>
			<td>用户昵称</td>
			<td>注册邮箱</td>
			<td>登录密码</td>
			<td>教育背景</td>
			<td>是否拉黑</td>
			<td>操作</td>
		</tr>

		<%
			if (userlist != null && userlist.size() > 0) {

				for (UserBean userBean : userlist) {
		%>



		<tr class="table-content">
			<td><%=userBean.getU_id()%></td>
			<td><%=userBean.getU_nickname()%></td>
			<td><%=userBean.getU_email()%></td>
			<td><%=userBean.getUserpwd()%></td>
			<td><%=userBean.getEdu_background()%></td>
			<td><%=userBean.getBlacklist()%></td>
			<td>
				<div class="modifyAndDelete">

					<button class="btn btn-success btn-lg" data-toggle="modal"
						data-target="#<%=userBean.getU_id()%>">修改</button>
					<button class="btn btn-warning btn-lg"
						onclick="confirm('是否确定拉黑该用户?点击‘确定’继续')">
						<a href="frameuserblacklist?u_id=<%=userBean.getU_id()%>">拉黑</a>
					</button>
					<button class="btn btn-primary btn-lg"
						onclick="confirm('是否添加用户到白名单?点击‘确定’继续')">
						<a href="frameuserwhitelist?u_id=<%=userBean.getU_id()%>">白名单</a>
					</button>
					<button class="btn btn-danger btn-lg"
						onclick="alert('您确定要删除该用户吗?点击‘确定’继续')">
						<a href="frameuserdelete?u_id=<%=userBean.getU_id()%>">删除</a>
					</button>

				</div>
			</td>
		</tr>


		<!-- 修改用户信息模态框 -->
		<!-- 模态框（Modal） -->
		<form action="frameusermodify" method="post">
			<div class="modal fade" id="<%=userBean.getU_id()%>" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h2 class="modal-title" id="myModalLabel">
								<center>用户信息修改</center>
							</h2>
						</div>
						<div class="modal-body">
							<input type="hidden" name="u_id" value="<%=userBean.getU_id()%>">
							<!--用户昵称 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">用户昵称</div>
								<input type="text" class="form-control" name="u_nickname"
									id="videoName" value="<%=userBean.getU_nickname()%>">
							</div>
							<!--用户邮箱 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">用户邮箱</div>
								<input type="text" class="form-control" name="u_email"
									id="videoUrl" value="<%=userBean.getU_email()%>">
							</div>
							<!--用户密码 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">用户密码</div>
								<input type="text" class="form-control" name="userpwd"
									id="videoDate" value="<%=userBean.getUserpwd()%>">
							</div>
							<!--教育背景-->
							<br />
							<div class="input-group">
								<div class="input-group-addon">教育背景</div>
								<select id="edu_background" name="edu_background"
									class="form-control edu_background">
									<option>请选择教育背景</option>
									<option>高中</option>
									<option>大专</option>
									<option>本科</option>
									<option>研究生</option>
									<option>其他</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary"
								onclick="confirm('确认提交更改?')">提交更改</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</form>

		<%
			}
		%>
		<%
			}
		%>
	</table>
	<center>
		<!--分页部分开始 -->
		<div class="page_roll">
			<div class="btn-group">

				<button type="button" class="btn btn-default"
					onclick="window.location.href='#'">
					<span class="glyphicon glyphicon-home">首页</span></a>
				</button>
				<button type="button" class="btn btn-default"
					onclick="window.location.href='#'">
					<span class="glyphicon glyphicon-circle-arrow-left">上一页</span>
				</button>
				<button type="button" class="btn btn-default"
					onclick="window.location.href='#'">
					<span class="glyphicon glyphicon-circle-arrow-right">下一页</span>
				</button>
				<button type="button" class="btn btn-default"
					style="margin-right: 10px;" onclick="window.location.href='#'">
					<span class="glyphicon glyphicon-play">尾页</span>
				</button>
			</div>
		</div>
	</center>
	<!--分页部分结束 -->
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- 日期选择器js-->
	<script type="text/javascript">
		function f(id) {
			if (confirm("确定删除？")) {
				window.location.href = "framedelete?u_id=" + id;
			}
		}
	</script>
</body>

</html>