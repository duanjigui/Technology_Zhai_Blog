<%@page import="com.techzhai.model.ArticleTypeBean"%>
<%@page import="java.util.List"%>
<%@page import="com.techzhai.dao.ArticleTypeDao"%>
<%@page import="com.techzhai.dao.ArticleTypeDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-1.12.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<title></title>
<style type="text/css">
.input-group-addon {
	background-color: #9de672;
	font-size: large;
}

#submitbtn {
	margin-right: 30px;
}

#tabletitle {
	text-align: center;
}

.modifyAndDelete {
	text-align: center;
}


td{
    width: 330px;
}
.table>tbody>tr>td{
	padding: 8px;
    vertical-align: top;
    border-top: 1px solid #ddd;
    line-height: 63px;
    font-size: 23px;
}
.btn-group-lg>.btn, .btn-lg {
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 6px;
    width: 200px;
}
tr{
	text-align: center;
}
</style>

<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
</head>

<body>
	<ol class="breadcrumb">
		<li><a href="#">当前位置</a></li>
		<li><a href="#">Type</a></li>
		<li><a href="#">分类管理</a></li>
		<li class="active">分类列表</li>

	</ol>
	<table class="table table-bordered table-striped table-hover">
		<tr id="tabletitle">
			<td>分类id</td>
			<td>分类名称</td>
			<td>操作</td>
		</tr>
		<%
			ArticleTypeDao articleTypeDao1 = new ArticleTypeDaoImpl();
			List<ArticleTypeBean> list2 = articleTypeDao1.fetchAllArticleType();
			if (null != list2 && list2.size() > 0) {
				for (ArticleTypeBean articleTypeBean : list2) {
		%>
		<script>
				$('#myModal<%=articleTypeBean.getT_id()%>').modal('toggle');
		</script>
		<tr>
			<td><%=articleTypeBean.getT_id()%></td>
			<td><%=articleTypeBean.getT_typename()%></td>

			<td>
				<div class="modifyAndDelete">
					<button class="btn btn-success btn-lg" data-toggle="modal"
						data-target="#myModal<%=articleTypeBean.getT_id()%>">修改</button>
					
				</div>
			</td>
		</tr>

		<!--弹窗内容-->
		<div class="modal fade" id="myModal<%=articleTypeBean.getT_id()%>">
			<div class="modal-dialog">
				<form action="articleTypeupdate" method="get">
					<div class="modal-content">
						<div class="modal-header">
							<h3>版块信息修改</h3>
						</div>
						<div class="modal-body">
								<!--文章类型id-->
								<br />
								<div class="input-group">
									<div class="input-group-addon">类型Id</div>
									<input type="text" class="form-control" name="t_id"
										value="<%=articleTypeBean.getT_id()%>" readonly>
									
								</div>
								<!--文章类型标题-->
								<br />
								<div class="input-group">
									<div class="input-group-addon">类型名称</div>
									<input type="text" class="form-control" name="t_typename" value="<%=articleTypeBean.getT_typename()%>">
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">提交更改</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--弹窗内容-->
		<%
			}
			}
		%>
		<tr>

		</tr>
	</table>
	<center>
		<!--分页部分开始 -->
		<div class="page_roll">
			<div class="btn-group">

				<button type="button" class="btn btn-default"
					onclick="window.location.href='CollegeVoiceVideoPager?current_pageno=1'">
					<span class="glyphicon glyphicon-home">首页</span></a>
				</button>
				<button type="button" class="btn btn-default"
					onclick="window.location.href='CollegeVoiceVideoPager?current_pageno='">
					<span class="glyphicon glyphicon-circle-arrow-left">上一页</span>
				</button>
				<button type="button" class="btn btn-default"
					onclick="window.location.href='CollegeVoiceVideoPager?current_pageno='">
					<span class="glyphicon glyphicon-circle-arrow-right">下一页</span>
				</button>
				<button type="button" class="btn btn-default"
					style="margin-right: 10px;"
					onclick="window.location.href='CollegeVoiceVideoPager?current_pageno='">
					<span class="glyphicon glyphicon-play">尾页</span>
				</button>
			</div>
		</div>
	</center>
	<!--分页部分结束 -->

	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- 日期选择器js-->

</body>

</html>