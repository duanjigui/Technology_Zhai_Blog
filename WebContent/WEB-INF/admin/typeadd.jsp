<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.typename {
	font-size: 24px;
}

#typename {
	font-size: 30px;
	text-align: center;
	line-height: 141px;
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
		<li class="active">分类添加</li>
	</ol>
	<form action="frametypeaddrouter" method="post">
		<table class="table table-bordered">
			<tr>
				<td>
					<div class="input-group">
						<div class="input-group-addon typename">分类名称</div>
						<textarea name="t_typename" id="typename" maxlength="10"
							style="width: 100%; height: 150px;"></textarea>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<center>
						<input type="submit" id="submitbtn" class="btn btn-primary btn-lg"
							value="提 交" /> <input type="reset"
							class="btn btn-warning btn-lg" value="重 置" />
					</center>

				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- 日期选择器js-->
</body>

</html>