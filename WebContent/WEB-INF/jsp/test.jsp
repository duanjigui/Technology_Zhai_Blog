<%@page import="com.techzhai.model.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
用户登录/注册<a href="user/userlogin">登录</a>
本页面也是用户登陆目标页
登陆失败注册成功
<hr>
<%
	List<UserBean> userlists =  (List<UserBean>) request.getAttribute("userlists");

	if(userlists != null && userlists.size() > 0) {
		
		for(UserBean userbean : userlists) {
%>
	<hr>
	用户id:<%=userbean.getU_id() %><br/>
	用户昵称:<%=userbean.getU_nickname() %><br/>
	邮箱地址:<%=userbean.getU_email() %><br/>
	教育背景:<%=userbean.getEdu_background() %><br/>
	<hr>
<% 
		}
	} else {
		out.print("用户列表获取失败");
	}
%>

</body>
</html>