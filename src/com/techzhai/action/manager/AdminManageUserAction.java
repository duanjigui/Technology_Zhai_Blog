package com.techzhai.action.manager;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.techzhai.model.UserBean;
/**
 * 管理员对用户进行管理action
 * @author Administrator
 * 16.6.30
 */
import com.techzhai.service.UserService;

public class AdminManageUserAction extends ActionSupport {

	private static final long serialVersionUID = -4417442089415392133L;
	
	private UserService userService;
	

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private HttpSession session;
	
	private String u_id;
	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	@Override
	public String execute() throws Exception {
		List<UserBean> userlist = userService.getAllUserList();
		session = ServletActionContext.getRequest().getSession();
		session.setAttribute("userlist", userlist);
		return SUCCESS;
	}
	
	public String deleteuser() {
		//userService.deleteUser(Integer.valueOf(u_id));
		//System.out.println(u_id);
		HttpServletRequest request = ServletActionContext.getRequest();
		String u_id = request.getParameter("u_id");
		System.out.println(u_id);
		return "deleteuser";
	}
	
}
