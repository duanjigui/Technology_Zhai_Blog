<%@page import="com.techzhai.dao.ArticleTypeDaoImpl"%>
<%@page import="com.techzhai.dao.ArticleTypeDao"%>
<%@page import="com.techzhai.model.ArticleTypeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
    <!-- 
    	用户发帖页面
    	@author by duanjigui
    	2016.6.29
     -->
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>发布文章</title>
		<link rel="stylesheet" type="text/css" href="css/style_article_deploy.css" />
		<link rel="stylesheet" href="css/post_page.css" />
		<link rel="stylesheet" href="css/themes/default/default.css" />
		<script charset="utf-8" src="js/kindeditor-min.js"></script>
		<script charset="utf-8" src="js/lang/zh_CN.js"></script>
		<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="w_content"]', {
					allowFileManager : true,
					resizeType : 1,
					width:"100%",
					height:"400px"

				});
			});
		</script>
	</head>

	<body>
		<!-- 头部部分开始 -->
		<div id="header">
			<jsp:include page="../header.jsp"></jsp:include>
		</div>
		<!-- 头部部分结束 -->
		<div class="col-md-12 center" id="tip">
			<ul class="breadcrumb panel">
				当前位置：
				<li> <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;<a href="index.html">主页</a></li>
				<li class="active">发帖</li>
			</ul>
		</div>
		<!--表单提交部分开始 -->
		<div id="post_cointer">
			<div class="post_area center">
				<form class="form-horizontal" role="form" action="front/articledelopy" method="post">
				<s:token></s:token>
					<div class="form-group">
						<label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">标题</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" placeholder="title" name="w_title">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">类别</label>
						<div class="col-lg-10">

							<select class="form-control m-bot15" name="articletype">
                                <!-- jsp页面动态获取  通过循环来实现 开始 -->
                                <%     
                                //动态循环实现下拉选项
                                ArticleTypeDao articleTypeDao=new ArticleTypeDaoImpl();
                                List<ArticleTypeBean> list=articleTypeDao.fetchAllArticleType();
								if(null!= list&&list.size()>0){
                                for(ArticleTypeBean articleTypeBean:list){
                                %>
                                <option value="<%=articleTypeBean.getT_typename() %>"><%=articleTypeBean.getT_typename() %></option>
                                <% } %>
                                <!-- jsp页面动态获取  通过循环来实现 结束-->
                            </select>
                            <% }else{
                            %>
                            	<span style="color: red">目前还没有文章类型，亲</span>
                            <%}%>
                            </select>
						</div>
					</div>

					<div class="form-group ">
						<label for="ccomment" class="control-label col-lg-2">内容</label>
						<div class="col-lg-10">
							<textarea name="w_content" style="width:300px;height:400px;visibility:hidden;" class="form-control " ></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<button type="submit" class="btn btn-primary btn-lg">发表</button>
						</div>
					</div>
				</form>
			</div>

		</div>
		<!--表单提交部分结束 -->

		<!--尾部部分结束 -->
		<div id="footer">

			<jsp:include page="../footer.jsp"></jsp:include>
		</div>
		<!--尾部部分结束 -->
	</body>

</html>