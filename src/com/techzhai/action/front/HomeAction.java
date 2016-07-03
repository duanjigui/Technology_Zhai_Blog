package com.techzhai.action.front;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.techzhai.dao.ArticleDaoImpl;
import com.techzhai.dao.ArticleTypeDaoImpl;
import com.techzhai.model.ArticleBean;
import com.techzhai.model.ArticleTypeBean;
import com.techzhai.model.UserBean;
import com.techzhai.service.UserService;
/**
 * 主页路由action
 * @author snowalker
 * 16.6.29
 */
public class HomeAction extends ActionSupport {
	
	@Resource(name = "userService")
	private UserService userService;				//用户服务层
	
	@Resource(name = "articleDaoImpl")
	private ArticleDaoImpl articleDaoImpl;			//文章数据库访问层
		
	@Resource(name = "articleTypeDaoImpl")
	private ArticleTypeDaoImpl articleTypeDaoImpl; 	//文章类型数据访问层

	public String index() throws Exception {
		List<ArticleBean> articleBeans = articleDaoImpl.fetchAllArticle();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("articleBeans", articleBeans);
		return "index";
	}
	
	@Override
	public String execute() throws Exception {
		//获取首页需要的信息
		//包括：1.文章列表 2.文章类型列表3.热门文章
		HttpServletRequest request = ServletActionContext.getRequest();
		//文章列表
		List<ArticleBean> articleBeans = articleDaoImpl.fetchAllArticle();
		//文章类型列表
		List<ArticleTypeBean> articleTypeBeans = articleTypeDaoImpl.fetchAllArticleType();
		//文章类型列表推荐
		List<ArticleTypeBean> articleTypeBeansRecommend = articleTypeDaoImpl.fetchArticleTypeRecommend();
		//热门文章，倒序排列五篇文章，按照日期
		List<ArticleBean> articleBeanRecommend = articleDaoImpl.fetchArticleRecommend();
		HttpSession session = request.getSession();
		//类型列表
		session.setAttribute("articleBeans", articleBeans);
		session.setAttribute("articleTypeBeans", articleTypeBeans);
		session.setAttribute("articleTypeBeansRecommend", articleTypeBeansRecommend);
		session.setAttribute("articleBeanRecommend", articleBeanRecommend);
		return super.execute();
	}
	
	
	/**
	 * 发帖页面路由【转发到发帖页面】
	 * 
	 */
	public String delopypage(){
		
		return "delopypage";
	}
	
	//展示文章中转路由，接受文章id转到文章展示页面
	public String showarticlebyid() {
		//获取文章页需要的信息
		//通过传来的id获取一个文章实体
		HttpServletRequest request = ServletActionContext.getRequest();
		//文章id
		String w_id = request.getParameter("w_id"); 
		//文章实体
		ArticleBean articleBean = articleDaoImpl.fetchArticleById(Integer.valueOf(w_id));
		
		HttpSession session = request.getSession();
		session.setAttribute("articleBean", articleBean);	
		
		return "showarticlebyid";
	}
	//文章展示路由
	public String showarticle() {
		return "showarticle";
	}
	
	//类型展示页
	public String showarticletype() {
		return "showarticletype";
	}
	
	//根据id获取文章类型
	public String articlesbytypeid() {
		//获取id
		HttpServletRequest request = ServletActionContext.getRequest();
		//类型id
		String t_id = request.getParameter("t_id"); 
		
		//获取结果列表
		List<ArticleBean> articleBeansByT_id = articleDaoImpl.fetchArticelistByTypeId(Integer.valueOf(t_id));
		
		HttpSession session = request.getSession();
		session.setAttribute("articleBeansByT_id", articleBeansByT_id);	
		
		return "articlesbytypeid";
	}
	
}
