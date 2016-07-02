<%@page import="com.techzhai.model.UserBean"%>
<%@page import="com.techzhai.model.ArticleTypeBean"%>
<%@page import="com.techzhai.dao.UserDaoImpl"%>
<%@page import="com.techzhai.dao.UserDao"%>
<%@page import="com.techzhai.dao.ArticleTypeDaoImpl"%>
<%@page import="com.techzhai.dao.ArticleTypeDao"%>
<%@page import="com.techzhai.model.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
    
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script type="text/javascript" src="js/jquery-1.12.3.min.js" ></script>		
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>
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
		</style>

		<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
	<%
	   	Map<String,Object> map=  ActionContext.getContext().getSession();
		List<ArticleBean> list=(List<ArticleBean>)map.get("article_list");	
		if(null!=list){
			if(list.size()>0){
				
	%>
	
		<ol class="breadcrumb">
			<li><a href="#">当前位置</a></li>
			<li><a href="#">Article</a></li>
			<li><a href="#">文章管理</a></li>
			<li class="active">文章列表</li>

		</ol>
			<table class="table table-bordered table-striped table-hover">
				<tr id="tabletitle">
					<td>文章id</td>
					<td>文章标题</td>
					<td>文章阅读次数</td>
					<td>发表时间</td>
					<td>发布人</td>
					<td>所属板块</td>
					<td>操作</td>
				</tr>
			<%
				for(ArticleBean articleBean:list){
					ArticleTypeDao articleTypeDao=new ArticleTypeDaoImpl();
					UserDao userDao=new UserDaoImpl();
					String publisher=userDao.fetchUserById(articleBean.getW_publisher()).getU_nickname();
					String type=articleTypeDao.fetchArticeTypeById(articleBean.getW_articletype());
			%>
					<script>
						$("#myModal<%=articleBean.getW_id()%>").modal('toggle');
					</script>
				<tr>
					<td><%=articleBean.getW_id() %></td>
					<td><%=articleBean.getW_title() %></td>
					<td><%=articleBean.getW_readnum() %></td>
					<td><%=articleBean.getW_publishtime() %></td>
					<td><%=publisher %></td>
					<td><%=type %></td>
					<td>
						<div class="modifyAndDelete">
								<button class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal<%=articleBean.getW_id() %>">修改</button>
						
								<button class="btn btn-warning btn-lg"  ><a href="<%=basePath %>manager/articledelete.action?w_id=<%=articleBean.getW_id()%>" onclick="if(confirm('确定删除?')==false)return false;">删除</a></button>
							
						</div>
					</td>
				</tr>
				
				
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal<%=articleBean.getW_id() %>" >
			<div class="modal-dialog">
			<form action="articleupdate"  method="post">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
						<h2 class="modal-title" id="myModalLabel">
               	<center>文章信息修改</center>
            </h2>
					</div>
					<input type="hidden" value="<%=articleBean.getW_id() %>" name="w_id"/>
					<div class="modal-body">
						<!--文章标题-->
						<br/>
						<div class="input-group">
							<div class="input-group-addon">文章标题</div>
							<input type="text" class="form-control" name="w_title"  value="<%=articleBean.getW_title() %>">
						</div>
						<!--阅读次数 -->
						<br/>
						<div class="input-group">
							<div class="input-group-addon">阅读次数</div>
							<input type="text" class="form-control" name="w_readnum"  value="<%=articleBean.getW_readnum() %>" >
						</div>
						<!--发表时间 -->
						<br/>
						<div class="input-group">
							<div class="input-group-addon">发表时间</div>
							<input type="text" class="form-control" name="w_publishtime"  placeholder="请选择文章发布日期" onClick="WdatePicker()" value="<%=articleBean.getW_publishtime() %>">
						</div>
						<!--发布人-->
						<br/>
						<div class="input-group">
							<div class="input-group-addon">发布人</div>
						<select class="form-control m-bot15" name="publisherString">
                                <!-- jsp页面动态获取  通过循环来实现 开始 -->
                                <%     
                                //动态循环实现下拉选项
                                UserDao userDao2=new UserDaoImpl();
                                List<UserBean> list2=(List<UserBean>)userDao2.fetchAllUserList();
								if(null!= list2&&list2.size()>0){
                                for(UserBean userBean:list2){
                                %>
                                <option value="<%=userBean.getU_nickname() %>"><%=userBean.getU_nickname() %></option>
                                <% } %>
                                <!-- jsp页面动态获取  通过循环来实现 结束-->
                            </select>
                            <% }else{
                            %>
                            	<span style="color: red">目前还没有用户，亲</span>
                            <%}%>
                            </select>
						
						</div>
						<!--所属板块 -->
						<br/>
						<div class="input-group">
							<div class="input-group-addon">所属板块</div>
								<select class="form-control m-bot15" name="articleTypeString">
                                <!-- jsp页面动态获取  通过循环来实现 开始 -->
                                <%     
                                //动态循环实现下拉选项
                            	 ArticleTypeDao articleTypeDao1=new ArticleTypeDaoImpl();
                                List<ArticleTypeBean> list3=articleTypeDao1.fetchAllArticleType();
								if(null!= list3&&list3.size()>0){
                                for(ArticleTypeBean articleTypeBean:list3){
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
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
            </button>
						<button type="submit" class="btn btn-primary">
               提交更改
            </button>
            
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			</form>
			<!-- /.modal -->
			
		</div>
				
				
				<%} %>
			</table>
				<% }else{%>
				
					sorry,没有数据！
				
				<% }%>
			<center>
						<!--分页部分开始 -->
						<div class="page_roll">
							<div class="btn-group">
							
								<button type="button" class="btn btn-default" onclick="window.location.href='#'"><span class="glyphicon glyphicon-home">首页</span></a></button>
								<button type="button" class="btn btn-default" onclick="window.location.href='#'"><span class="glyphicon glyphicon-circle-arrow-left">上一页</span></button>
								<button type="button" class="btn btn-default" onclick="window.location.href='#'"><span class="glyphicon glyphicon-circle-arrow-right">下一页</span></button>
								<button type="button" class="btn btn-default" style="margin-right: 10px;" onclick="window.location.href='#'"><span class="glyphicon glyphicon-play">尾页</span></button>
							</div>
						</div>
						<!--分页部分结束 -->
					</center>
			
						
	
		<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		
		<!-- 日期选择器js-->
		<% }else{
			
			response.sendRedirect(basePath+"manager/articlequery.action");
		 }%>
	</body>

</html>