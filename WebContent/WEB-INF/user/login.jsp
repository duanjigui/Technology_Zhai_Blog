<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>科技宅用户登录注册</title>
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
		.web_login.userRegister {
		    width: 370px;
		    position: relative;
		    margin-left: 37px;
		    margin-top: 5px;
		}
	</style>
</head>
<body>
	<h1>
		科技宅用户登录 2016
	</h1>



	<div class="login" style="margin-top: 50px;">

		<div class="header">
			<div class="switch" id="switch">
				<a class="switch_btn_focus" id="switch_qlogin"
					href="javascript:void(0);" tabindex="7">快速登录</a> <a
					class="switch_btn" id="switch_login" href="javascript:void(0);"
					tabindex="8">快速注册</a>
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
						<form action="userloginverify" method="post">
							<!--视频名称 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">账号</div>
								<input type="text" class="form-control inputstyle" id="u_email"
									name="u_email" placeholder="请输入注册邮箱" />
							</div>
							<!--视频链接 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon userpwd">密码</div>
								<input type="password" class="form-control inputstyle" name="userpwd"
									id="userpwd" placeholder="请输入密码"/>
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

		<!--注册-->
		<div class="qlogin" id="qlogin" style="display: none;">

			<div class="web_login userRegister">
				<form action="userloginregister" method="post" class="formlist">
							<!--用户昵称 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">用户昵称</div>
								<input type="text" class="form-control inputstyle" id="u_nickname"
									name="u_nickname" placeholder="请输入用户昵称" />
							</div>
							<!--用户密码 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">登录密码</div>
								<input type="password" class="form-control inputstyle" name="userpwd"
									id="userpwd" placeholder="请输入密码"/>
							</div>
							<!--确认密码 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">确认密码</div>
								<input type="password" class="form-control inputstyle" name="reUserPwd"
									id="reUserPwd" placeholder="请再次输入密码"/>
							</div>
							<!--登录邮箱 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">登录邮箱</div>
								<input type="text" class="form-control inputstyle" name="u_email"
									id="u_email" placeholder="请输入登录邮箱"/>
							</div>
							<!--教育背景 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">教育背景</div>
								<select id="edu_background" name="edu_background"
									class="edu_background">
									<option>请选择教育背景</option>
									<option>高中</option>
									<option>大专</option>
									<option>本科</option>
									<option>研究生</option>
									<option>其他</option>
								</select>
							</div>
							<br/><br/>
							<center>
								<input type="submit" id="submitbtn" class="btn btn-primary btn-lg" value="提 交" onclick="alert('注册成功，请登录！')"/>
								<input type="reset" class="btn btn-warning btn-lg" value="重 置" />
							</center>

							 
						</form>
			</div>


		</div>
		<!--注册end-->
	</div>
	<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</body>

</html>