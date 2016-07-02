package com.techzhai.dao;
/**
 * 管理员数据访问接口
 * @author snowalker
 * 2016.6.28
 */
public interface AdminDao {
	//管理员登录
	public Boolean adminLoginByNameAndPwd(String adminname, String adminpwd);
}
