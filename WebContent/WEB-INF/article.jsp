<%@page import="com.techzhai.model.ArticleBean"%>
<%@page import="com.techzhai.model.ArticleTypeBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.techzhai.model.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="com.techzhai.dao.ArticleTypeDao"%>
<%@page import="com.techzhai.dao.ArticleTypeDaoImpl"%>
<%@page import="com.techzhai.dao.UserDaoImpl"%>
<%@page import="com.techzhai.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//获取对应id返回的文章实体
	ArticleBean articleBean = (ArticleBean)session.getAttribute("articleBean");
	
  	//获取某一个类型下的文章列表
  	List<ArticleBean> articleBeans = (List<ArticleBean>)session.getAttribute("articleBeansByT_id");
	//获取后台板块列表
	List<ArticleTypeBean> articleTypeBeans = (List<ArticleTypeBean>)session.getAttribute("articleTypeBeans");
		
	int articletypeId=articleBeans.get(0).getW_articletype();
	
	ArticleTypeDao articleTypeDao=new ArticleTypeDaoImpl();
	
	UserDao userDao=new UserDaoImpl();
	//通过文章类型id获取文章类型
	String type=articleTypeDao.fetchArticeTypeById(articletypeId);
	
%>
	<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>${articleBean.getW_title()}</title>
		<link rel="stylesheet" type="text/css" href="css/article.css" />
	</head>
	<script>
		$('#myModal').modal('toggle');
	</script>
	<jsp:include page="header.jsp"></jsp:include>
	<body>
		
		<!--面包屑导航-->
		<div class="video-rode-nav">
			<ol class="breadcrumb">
				<li><a href="home">论坛首页</a></li>
				<li><a href="homearticlesbytypeid?t_id=<%=articletypeId%>"><%=type%>版块</a></li>
				<li class="active">文章标题</li>
			</ol>
		</div>
		<!--内容部分开始-->
		<div class="content">
			<div class="article content">
				<!--文章标题-->
				<div class="article-title">
					<span><%=articleBean.getW_title() %></span>
				</div>
				<!--文章信息，包括作者，阅读次数-->
				<div class="article-info">
					<span class="author">
						<i class="glyphicon glyphicon-user"></i><%=userDao.fetchUserById(articleBean.getW_publisher()).getU_nickname() %>
					</span>
					<span class="times">
						<i class="glyphicon glyphicon-play-circle"></i><%=articleBean.getW_readnum() %>
					</span>
				</div>
				<!--文章内容-->
				<div class="article-body">
					<%=articleBean.getW_content() %>
				</div>
				<!--文章信息，上传时间-->
				<div class="article-info">
					<span class="date">
						<%=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(articleBean.getW_publishtime()) %>
					</span>
				</div>
			</div>
		</div>
		<!--内容部分结束-->

		<!--50px占位符-->
		<div class="blank-content">

		</div>

		<!--footer部分开始-->
		<div class="footer">
			<span class="footer-content">Copyright ©2016 剑心工作室 Version 1.0.0</span>
		</div>
		<!--footer部分结束-->
		<div class="publish-article">
			<a href="homedelopypage"><span class="glyphicon glyphicon-pencil"></span></a>
		</div>

	</body>

</html>
