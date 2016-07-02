package com.techzhai.model;
/**
 * 用户实体bean
 * @author snowalker
 * 15.6.28
 */
public class UserBean {
	//用户id
	private Integer u_id;		
	//用户昵称
	private String  u_nickname;
	//用户密码
	private String  userpwd;
	//用户邮箱
	private String  u_email;
	//用户教育背景
	private String  edu_background;
	/*
	 * 黑名单标记
	 * true则为拉黑
	 * false则为取消拉黑
	 * 默认为false
	 */
	private Boolean blacklist;
	
	public UserBean() {
	}

	public UserBean(Integer u_id, String u_nickname, String userpwd, String u_email, String edu_background,
			Boolean backlist) {
		super();
		this.u_id = u_id;
		this.u_nickname = u_nickname;
		this.userpwd = userpwd;
		this.u_email = u_email;
		this.edu_background = edu_background;
		this.blacklist = backlist;
	}



	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getEdu_background() {
		return edu_background;
	}
	public void setEdu_background(String edu_background) {
		this.edu_background = edu_background;
	}

	public Boolean getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(Boolean blacklist) {
		this.blacklist = blacklist;
	}
	
	
	
}
