<%@page import="com.techzhai.dao.ArticleTypeDaoImpl"%>
<%@page import="com.techzhai.dao.ArticleDaoImpl"%>
<%@page import="com.techzhai.dao.ArticleTypeDao"%>
<%@page import="com.techzhai.dao.UserDaoImpl"%>
<%@page import="com.techzhai.dao.UserDao"%>
<%@page import="com.techzhai.model.ArticleBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	//获取某一个类型下的文章列表
	List<ArticleBean> articleBeans = (List<ArticleBean>)session.getAttribute("articleBeansByT_id");
	if(articleBeans!=null&&articleBeans.size()>0){
		//获取文章类型id
		int articletypeId=articleBeans.get(0).getW_articletype();
		 ArticleTypeDao articleTypeDao=new ArticleTypeDaoImpl();
		 String type=articleTypeDao.fetchArticeTypeById(articletypeId);
		 UserDao userDao=new UserDaoImpl();
%> 
<title><%=type%>版块文章列表</title>
		<link rel="stylesheet" type="text/css" href="css/article-list.css" />
</head>

<body>
	<!--文章列表模块-->
		<div class="aritcle-block">
			<!--面包屑导航-->
			<div class="video-rode-nav">
				<ol class="breadcrumb">
					<li><a href="home">论坛首页</a></li>
					<li class="active"><%=type%>版块</li>
				</ol>
			</div>
			<!--文章列表-->
			<div class="article-list">
				<div class="article-list-content">
					<div class="article-list-header">
						<!--<img src="img/PHP.jpg" />-->
						<span class="glyphicon glyphicon-flag"></span>
						<span class="title"><%=type%>技术社区欢迎你！</span>
					</div>
					<div class="article-list-body">
					<%
					if (articleBeans != null && articleBeans.size() > 0) {
		
						for (ArticleBean articleBean : articleBeans) {
							
							String publisher=userDao.fetchUserById(articleBean.getW_publisher()).getU_nickname();
					%>
						<!--单篇文章的样式开始-->
						<div class="article">
							<span class="article-icon glyphicon glyphicon-star"></span>
							<a href="homeshowarticlebyid?w_id=<%=articleBean.getW_id()%>"><span class="article-title"><%=articleBean.getW_title() %></span></a>
							<!--上传者信息-->
							<div class="article-owner">
								<i class="glyphicon glyphicon-user"></i>
								<span class=""><%=publisher%></span>
							</div>
							<!--上传日期-->
							<div class="article-date">
								<i class="glyphicon glyphicon-time"></i>
								<span class=""><%=articleBean.getW_publishtime() %></span>
							</div>
							<!--阅读次数-->
							<div class="article-times">
								<i class="glyphicon glyphicon-play-circle"></i>
								<span class=""><%=articleBean.getW_readnum() %></span>
							</div>
						</div>
						<!--单篇文章的样式结束-->
						<%}} %>
					</div>
					<!--分页部分开始 -->
					<div class="page_roll article-list-divider">
						<div class="btn-group" style="width: 840px;" >
							<button type="button" class="btn btn-default"><a href="#"><span class="glyphicon glyphicon-home">首页</span></a></button>
							<button type="button" class="btn btn-default"><a href="#"><span class="glyphicon glyphicon-circle-arrow-left">上一页</span></a></button>
							<button type="button" class="btn btn-default"><a href="#"><span class="glyphicon glyphicon-circle-arrow-right">下一页</span></a></button>
							<button type="button" class="btn btn-default" style="margin-right: 10px;"><a href="#"><span class="glyphicon glyphicon-play">尾页</span></a></button>
							<span>
								<form action="" method="post">
									<div class="input-group">
		      							<input type="text" class="form-control"  placeholder="跳转到"/>
		     							<span class="input-group-btn">
		       								<button class="btn btn-success" type="submit">Go!</button>
		     					 		</span>
									</div>
								</form>
							</span>
						</div>
					</div>
					<!--分页部分结束 -->
			</div>
		</div>
		</div>
		<!--文章列表结束-->
		<%
		
		}else{
		%>
			<div align="center"><font color="red">sorry! &nbsp;该分类下暂时没有文章</font><br/><a href="home">返回主页</a></div>	
		<% }%>
		<!--50px占位符-->
		<div class="blank-content">

		</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>