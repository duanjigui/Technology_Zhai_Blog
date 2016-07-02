package com.techzhai.action.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.techzhai.model.AdminBean;
import com.techzhai.service.AdminService;
/**
 * 管理员密码验证action
 * 接受前台录入数据成功则转发到后台
 * 失败则重新登陆
 * @author snowalker
 *
 */
public class AdminLoginVerifyAction extends ActionSupport implements ModelDriven<AdminBean>{

	
	private static final long serialVersionUID = -3952709099235198753L;

	private AdminBean adminBean;
	
	private String message;
	
	private AdminService adminService;// 管理员服务层
	
	private HttpServletRequest request;

	private HttpSession session;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public AdminBean getModel() {
		if (adminBean == null) {
			adminBean = new AdminBean();
		}
		return adminBean;
	}


	public AdminService getAdminService() {

		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	//密码验证
	@Override
	public String execute() throws Exception {
		request = ServletActionContext.getRequest();
		String adminName = request.getParameter("adminname");
		String adminpwd = request.getParameter("adminpwd");
		//登录判断
		if (adminService.AdminLoginByNameAndPwd(adminName, adminpwd)) {
			request = ServletActionContext.getRequest();
			session = request.getSession();
			session.setAttribute("adminname", adminName);
			System.out.println(session.getAttribute("adminname"));
			message = "登录成功！";
			return "success";
		} else {
			message = "登录失败，请核对账号或密码";
			session.setAttribute("message", message);
			return "error";
		}
		
	}
	
	
}
