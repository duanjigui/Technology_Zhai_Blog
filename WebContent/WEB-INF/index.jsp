<%@page import="com.techzhai.model.ArticleTypeBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.techzhai.model.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="com.techzhai.dao.UserDaoImpl"%>
<%@page import="com.techzhai.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	//获取后台文章列表
	List<ArticleBean> articleBeans = (List<ArticleBean>)session.getAttribute("articleBeans");
	//获取后台板块列表
	List<ArticleTypeBean> articleTypeBeans = (List<ArticleTypeBean>)session.getAttribute("articleTypeBeans");
	//板块前五个
	List<ArticleTypeBean> articleTypeBeansRecommend = (List<ArticleTypeBean>)session.getAttribute("articleTypeBeansRecommend");
	//获取最新五篇文章按照时间倒序排列列表
	List<ArticleBean> articleBeansRecommend = (List<ArticleBean>)session.getAttribute("articleBeanRecommend");
	
	UserDao userDao=new UserDaoImpl();
	
	
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>科技宅博客论坛</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" />
	</head>
	
	<script>
		$('#myModal').modal('toggle');
	</script>
		<jsp:include page="header.jsp"></jsp:include>
	<body>
		<!--内容部分开始-->
		<div class="content">
			<!--文章列表-->
			<div class="article-list">
				<div class="article-list-logo">
					<span class="glyphicon glyphicon-home words"></span>
					<span class="words">&nbsp;博海畅游</span>
					<hr style="margin-top: -1px"/>
					
				</div>
				<!--渤海畅游文章列表开始-->
				
				<div class="article-list-content">
					<%
					if (articleBeans != null && articleBeans.size() > 0) {
		
						for (ArticleBean articleBean : articleBeans) {
					%>
					<!--单篇文章的样式开始-->
					<div class="article">
						<span class="article-icon glyphicon glyphicon-star"></span>
						<a href="homeshowarticlebyid?w_id=<%=articleBean.getW_id()%>"><span class="article-title"><%=articleBean.getW_title() %></span></a>
						<!--上传者信息-->
						<div class="article-owner">
							<i class="glyphicon glyphicon-user"></i>
							<span class=""><%=userDao.fetchUserById(articleBean.getW_publisher()).getU_nickname()  %></span>
						</div>
						<!--上传日期-->
						<div class="article-date">
							<i class="glyphicon glyphicon-time"></i>
							<span class=""><%=new SimpleDateFormat("yyyy-MM-dd").format(articleBean.getW_publishtime())%></span>
						</div>
						<!--阅读次数-->
						<div class="article-times">
							<i class="glyphicon glyphicon-play-circle"></i>
							<span class=""><%=articleBean.getW_readnum() %></span>
						</div>
					</div>
					<!--单篇文章的样式结束-->
					<% } %>
				<% }  %>
				</div>
				<!--渤海畅游文章列表结束-->
				<!--分页部分开始 -->
				<div class="page_roll">
					<div class="btn-group">
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
			<!--版块栏和推荐栏-->
			<div class="type-recommand">
				<div class="article-type">
					<div class="article-type-logo">
						<span class="glyphicon glyphicon-send words"></span>
						<span class="words">&nbsp;版块直通车</span>
						<hr style="margin-top: -1px"/>
					</div>
					<div class="article-type-content">
					<%
					if (articleTypeBeansRecommend != null && articleTypeBeansRecommend.size() > 0) {
		
						for (ArticleTypeBean articleTypeBean : articleTypeBeansRecommend) {
					%>
						<div class="type-common">
							<div class="type-logo">
								<span class="glyphicon glyphicon-flag"></span>
							</div>
							<div class="type-name">
								<span><%=articleTypeBean.getT_typename() %></span>
								<a href="homearticlesbytypeid?t_id=<%=articleTypeBean.getT_id()%>"><span class="glyphicon glyphicon-play button"></span></a>
							</div>
						</div>
						<% }} %>
						
					</div>
					<div class="article-type-morebutton">
						<button data-toggle="modal" data-target="#myModal" class="btn btn-primary">更多版块</button>
					</div>
				</div>
				<div class="article-recommand">
					<div class="article-recommand-logo">
						<span class="glyphicon glyphicon-fire words"></span>
						<span class="words">&nbsp;热文推荐</span>
						<hr />
					</div>
					<div class="article-recommand-content">
					
					<%
					if (articleBeansRecommend != null && articleBeansRecommend.size() > 0) {
		
						for (ArticleBean articleBean : articleBeansRecommend) {
					%>
					
						<!--热门推荐单条开始-->
						<hr />
						<div class="article-recommand-style">
							<span class="hot">热</span>
							<a href="homeshowarticlebyid?w_id=<%=articleBean.getW_id()%>"><span class="hot-title"><%=articleBean.getW_title() %></span></a>
							<div class="hot-article-owner">
								<i class="glyphicon glyphicon-user"></i>
								<span class=""><%=userDao.fetchUserById(articleBean.getW_publisher()).getU_nickname()%></span>
							</div>
						</div>
						
						<%}} %>
						<!--热门推荐单条结束-->
					</div>
				</div>
			</div>
		</div>
		<!--50px占位符-->
		<div class="blank-content">
			
		</div>
		<!--内容部分结束-->
		<!--footer部分开始-->
		<jsp:include page="footer.jsp"></jsp:include>
		<!--footer部分结束-->
		
		<!--弹窗内容-->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3>版块列表</h3>
					</div>
					<div class="modal-body">
					<%
					if (articleTypeBeans != null && articleTypeBeans.size() > 0) {
		
						for (ArticleTypeBean articleTypeBean : articleTypeBeans) {
					%>
						<a href="homearticlesbytypeid?t_id=<%=articleTypeBean.getT_id()%>"><span class="modal-span"><%=articleTypeBean.getT_typename() %></span></a>
					<%}} %>	
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px;">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!--弹窗内容-->
		
		
	</body>

</html>