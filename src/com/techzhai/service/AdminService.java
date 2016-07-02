package com.techzhai.service;

import com.techzhai.dao.AdminDaoImpl;

/**
 * 管理员服务层
 * @author snowalker
 * 
 */
public class AdminService {
	
	private AdminDaoImpl adminDao;
	
	
	public AdminDaoImpl getAdminDao() {
		return adminDao;
	}


	public void setAdminDao(AdminDaoImpl adminDao) {
		this.adminDao = adminDao;
	}




	//登录验证
	public Boolean AdminLoginByNameAndPwd(String adminname, String adminpwd) {
		return adminDao.adminLoginByNameAndPwd(adminname, adminpwd);
	}
}
