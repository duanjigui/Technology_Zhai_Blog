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
import com.techzhai.model.ArticleBean;
import com.techzhai.model.UserBean;
import com.techzhai.service.UserService;
/**
 * 主页路由action
 * @author snowalker
 * 16.6.29
 */
public class HomeAction extends ActionSupport {
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "articleDaoImpl")
	private ArticleDaoImpl articleDaoImpl;

	public String index() throws Exception {
		List<ArticleBean> articleBeans = articleDaoImpl.fetchAllArticle();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("articleBeans", articleBeans);
		return "index";
	}
	
	@Override
	public String execute() throws Exception {
		List<ArticleBean> articleBeans = articleDaoImpl.fetchAllArticle();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("articleBeans", articleBeans);
		return super.execute();
	}
	
	
	/**
	 * 发帖页面路由【转发到发帖页面】
	 * 
	 */
	public String delopypage(){
		
		return "delopypage";
	}
}
