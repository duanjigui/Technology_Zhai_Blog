package com.techzhai.model;
/**
 * admin实体bean
 * @author snowalker
 * 15.6.28
 */
public class AdminBean {
	
	private Integer a_id;		//管理员id
	
	private String adminname;	//管理员名称
	
	private String adminpwd;	//管理员密码
	
	public AdminBean() {
	}

	public AdminBean(Integer a_id, String adminname, String adminpwd) {
		super();
		this.a_id = a_id;
		this.adminname = adminname;
		this.adminpwd = adminpwd;
	}


	public Integer getA_id() {
		return a_id;
	}

	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getAdminpwd() {
		return adminpwd;
	}

	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}
	
	
}
