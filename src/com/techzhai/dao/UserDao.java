package com.techzhai.dao;

import java.util.List;

import com.techzhai.model.UserBean;

/**
 * 用户dao层接口
 * @author snowalker
 * 16.6.30
 */
public interface UserDao {
	
	//获取全部用户列表
	public List<UserBean> fetchAllUserList();
	//删除指定id的用户
	public String deleteUser(Integer u_id);
	//根据id获取用户信息
	public UserBean fetchUserById(int id);
	//根据id拉黑用户
	public String userInBlackList(Integer u_id);
	//解除拉黑，加入白名单
	public String userInWhiteList(Integer u_id);
	//修改用户信息
	public String userInfoModify(Integer u_id, String u_nickname, String u_email, String userpwd, String edu_background);
	//用户登录
	public Boolean userLoginVerify(String u_email, String userpwd);
	//用户注册
	public String userRegist(String u_nickname, String userpwd, String u_email, String edu_background);
	//根据用户姓名获取用户信息  sanbel
	public UserBean fetchUserIdByname(String name);
	
	/**
	 * fetchUserInfo
	 */
	public List<UserBean> fetchUserInfo();
}
