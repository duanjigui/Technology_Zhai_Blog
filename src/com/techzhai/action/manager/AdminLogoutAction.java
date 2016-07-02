package com.techzhai.action.manager;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 管理员注销action
 * @author snowalker
 * 16.6.29
 */
@Controller("adminLogoutAction")
@Scope(scopeName="prototype")
public class AdminLogoutAction extends ActionSupport {

	private static final long serialVersionUID = 8927843611031028167L;

	private HttpSession session = ServletActionContext.getRequest().getSession();
	@Override
	public String execute() throws Exception {
		if (session.getAttribute("adminname") != null) {
			session.removeAttribute("adminname");
		}
		return super.execute();
	}
}
