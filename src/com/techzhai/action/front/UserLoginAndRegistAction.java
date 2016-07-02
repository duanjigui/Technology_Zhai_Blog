package com.techzhai.action.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.techzhai.dao.UserDaoImpl;
import com.techzhai.model.UserBean;
import com.techzhai.service.UserService;

@Controller("userLoginAndRegistAction")
public class UserLoginAndRegistAction extends ActionSupport {

	private static final long serialVersionUID = -6074877173420669490L;
	
	//用户登录验证服务
	@Resource(name="userService")
	private UserService userService;
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public String execute() throws Exception {
		
		return super.execute();
	}
	
	//用户登录验证路由
	public String verify() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String u_email = request.getParameter("u_email");
		String userpwd = request.getParameter("userpwd");
		if (userService.userLoginVerify(u_email, userpwd)) {
			HttpSession session = request.getSession();
			//通过u_email拿到用户所有信息
			UserBean loginUserBean = new UserDaoImpl().fetchUserByEmail(u_email);
			session.setAttribute("loginUserBean", loginUserBean);
			return "verify";
		}
		
		return "failed";
	}
	//用户注册
	public String register() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String u_nickname = request.getParameter("u_nickname");
		String userpwd = request.getParameter("userpwd");
		String u_email = request.getParameter("u_email");
		String edu_background = request.getParameter("edu_background");
		System.out.println(u_nickname + " " + userpwd + " " + u_email + " " + edu_background);
		userService.userRegist(u_nickname, userpwd, u_email, edu_background);
		return "register";
	}
	
	//用户注销
	public String logout() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (session.getAttribute("loginUserBean") != null) {
			session.removeAttribute("loginUserBean");
			System.err.println(session.getAttribute("loginUserBean"));
		}
		return "logout";
	}
	
	
}
