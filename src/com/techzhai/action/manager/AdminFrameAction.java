package com.techzhai.action.manager;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.techzhai.model.UserBean;
import com.techzhai.service.ArticleType_addService;
import com.techzhai.service.UserService;

/**
 * 管理员页面action路由
 * @author snowalker
 * 16.6.29
 *
 */
@Controller("adminFrameAction")
@Scope(scopeName="prototype")
public class AdminFrameAction extends ActionSupport implements ModelDriven<UserBean> {
	
	private static final long serialVersionUID = 3487169468435434641L;

	@Resource(name="userService")
	private UserService userService;
	@Resource(name="articleType_addService")
	private ArticleType_addService articleType_addService;
	
	private HttpSession session;
	
	//数据采集
	private UserBean userbean;
		
	@Override
	public UserBean getModel() {
		if (userbean == null) {
			userbean = new UserBean();
		}
		return userbean;
	}
	
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	//欢迎页
	public String welcome() {
		return "welcome";
	}
	//用户列表
	public String userlist() {
		List<UserBean> userlist = userService.getAllUserList();
		HttpServletRequest request = ServletActionContext.getRequest();
		session = ServletActionContext.getRequest().getSession();
		session.setAttribute("userlist", userlist);
		request.setAttribute("userlist", userlist);
		return "userlist";
	}
	//用户删除
	public String userdelete() {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String u_id =  request.getParameter("u_id");
		System.out.println(u_id);
		userService.deleteUser(Integer.valueOf(u_id));
		
		return "userdelete";
	}
	//用户拉黑
	public String userblacklist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String u_id =  request.getParameter("u_id");
		userService.userInBlacklist(Integer.valueOf(u_id));
		return "userblacklist";
	}
	//用户解除白名单添加白名单
	public String userwhitelist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String u_id =  request.getParameter("u_id");
		userService.userInWhitelist(Integer.valueOf(u_id));
		return "userwhitelist";
	}
	//用户信息修改
	public String usermodify() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String u_id =  request.getParameter("u_id");
		String u_nickname = request.getParameter("u_nickname");
		String u_email = request.getParameter("u_email");
		String userpwd = request.getParameter("userpwd");
		String edu_background = request.getParameter("edu_background");
		System.out.println(u_id + u_email);
		userService.userInfoModify(Integer.valueOf(u_id), u_nickname, u_email, userpwd, edu_background);
		return "usermodify";
	}
	//文章列表
	public String articlelist() {
		return "articlelist";
	}
	//分类添加
	public String typeadd() {
		return "typeadd";
	}
	//分类列表
	public String typelist() {
		return "typelist";
	}
	//添加分类业务action
	public String typeaddrouter() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String t_typename = request.getParameter("t_typename");
		articleType_addService.addArticleType(t_typename);
		return "typeaddrouter";
	}
	
}
