<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	String article;
	try {
		// 加载驱动
		Class.forName("com.mysql.jdbc.Driver");
		// 建立连接
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/techzhaiblog", "root", "root");
		String sql = "select w_content from t_article where w_id=1";
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			article = rs.getString("w_content"); 
			--%>
			
			<%--= article.replace("<", "&lt;").replace(">","&gt;").replace("\n","<p>").replace("\t"," &nbsp;&nbsp;&nbsp;&nbsp;").replace("\"","&quot;") --%>
			<%-- 
		}
		System.out.println(new SimpleDateFormat("yyyy-mm-dd,hh:mm:ss ").format(new Date()) + "connected==>" + connection.getMetaData().getURL());
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}

--%>
<%out.println("<h1>你好</h1>"); %>
</body>
</html>