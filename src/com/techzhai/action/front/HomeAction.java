package com.techzhai.action.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
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

	public String index() throws Exception {
		return "index";
	}
	
	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	/**
	 * 获取用户全部信息
	 * @return
	 */
	public String fetchuser() {
		List<UserBean> userlists =  userService.fetchUserInfo();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("userlists", userlists);
		return "fetchuser";
	}
	
	/**
	 * 发帖页面路由【转发到发帖页面】
	 * 
	 */
	public String delopypage(){
		
		return "delopypage";
	}
}
