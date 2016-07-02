package com.techzhai.action.manager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.techzhai.model.AdminBean;

/**
 * 登录页路由action
 * 
 * @author snowalker 16.6.29
 */
public class AdminLoginPageAction extends ActionSupport implements ModelDriven<AdminBean> {

	private static final long serialVersionUID = 6980050592302518880L;

	private AdminBean adminBean; // 模型驱动目的对象

	
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	// 模型驱动
	@Override
	public AdminBean getModel() {
		if (adminBean == null) {
			adminBean = new AdminBean();
		}
		return adminBean;
	}

	// 登录路由
	public String login() {
		return "login";
	}
}
