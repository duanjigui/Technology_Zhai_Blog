<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>科技宅管理员登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="img/login.js"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link href="css/login2.css" rel="stylesheet" type="text/css" />
	
	<style type="text/css">
			.input-group-addon {
				background-color: deepskyblue;
				font-size: large;
			}
	</style>
	<script type="text/javascript">
		function verfyPasswd() {
			var userpwd = document.getElementById("userpwd").value;
			var reUserPwd = document.getElementById("userpwd2").value;
			if (userpwd != reUserPwd) {
				alert("两次输入密码不同！请重新输入");
			}
		}

		function warnInfo() {
			alert("请保证您的注册信息准确无误！\n本网站持有最终解释权");
		}
	</script>
	<style type="text/css">
		select {
			width: 80px;
			height: 35px;
			box-shadow: #959CA8;
			font-size: 17px;
		}
		
		select option {
			width: 70px;
			height: 35px;
			box-shadow: #959CA8;
			font-size: 17px;
		}
		.web_login .input-tips2 {
			float:left;
			text-align:right;
			padding-right:10px;
			width:75px;
			height:30px;
			font-size:13px;
			margin-top:10px;
			clear:both;
			line-height:30px;
			font-family:"Hiragino Sans GB", "Microsoft Yahei";
		}
	</style>
</head>
<body>
	<h1>
		科技宅管理员登录 2016
	</h1>



	<div class="login" style="margin-top: 50px;">

		<div class="header">
			<div class="switch" id="switch">
				<div>快速登录</div>
				<div class="switch_bottom" id="switch_bottom"
					style="position: absolute; width: 64px; left: 0px;"></div>
			</div>
		</div>


		<div class="web_qr_login" id="web_qr_login"
			style="display: block; height: 235px;">

			<!--登录-->
			<div class="web_login" id="web_login">


				<div class="login-box">


					<div class="login_form">
						<form action="loginVerify.action" method="post">
							<!--视频名称 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">账号</div>
								<input type="text" class="form-control inputstyle" id="adminname"
									name="adminname" placeholder="请输入账号" />
							</div>
							<!--视频链接 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">密码</div>
								<input type="password" class="form-control inputstyle" name="adminpwd"
									id="adminpwd" placeholder="请输入密码"/>
							</div><br/><br/>
							<center>
								<input type="submit" id="submitbtn" class="btn btn-primary btn-lg" value="提 交" />
								<input type="reset" class="btn btn-warning btn-lg" value="重 置" />
							</center>

							 
						</form>
					</div>

				</div>

			</div>
			<!--登录end-->
		</div>

		
	</div>
	<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</body>

</html>