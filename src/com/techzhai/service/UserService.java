package com.techzhai.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.techzhai.dao.UserDao;
import com.techzhai.dao.UserDaoImpl;
import com.techzhai.model.UserBean;

/**
 * 用户服务层实现
 * @author snowalker
 * 16.6.30
 */
@Service("userService")
public class UserService {
	
	@Resource(name="userDao")
	private UserDaoImpl userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}
	
	//获取用户列表
	public List<UserBean> getAllUserList() {
		return userDao.fetchAllUserList();
	}
	
	//根据id删除用户
	public String deleteUser(Integer u_id) {
		userDao = new UserDaoImpl();
		return userDao.deleteUser(u_id);
	}
	
	//用户拉黑
	public String userInBlacklist(Integer u_id) {
		return userDao.userInBlackList(u_id);
	}
	
	//用户添加白名单
	public String userInWhitelist(Integer u_id) {
		return userDao.userInWhiteList(u_id);
	}
	
	//修改用户信息
	public String userInfoModify(Integer u_id, String u_nickname, String u_email, String userpwd, String edu_background) {
		userDao = new UserDaoImpl();
		return userDao.userInfoModify(u_id, u_nickname, u_email, userpwd, edu_background);
	}
	
	//验证用户登录信息
	public Boolean userLoginVerify(String u_email, String userpwd) {
		userDao = new UserDaoImpl();
		return userDao.userLoginVerify(u_email, userpwd);
	}

	public String userRegist(String u_nickname, String userpwd, String u_email, String edu_background) {
		userDao = new UserDaoImpl();
		return userDao.userRegist(u_nickname, userpwd, u_email, edu_background);
	}
	
	/**
	 * fetchUserInfo前台获取用户信息
	 */
	public List<UserBean> fetchUserInfo() {
		return userDao.fetchUserInfo();
	}
}
