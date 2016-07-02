package com.test.dao;

import org.junit.Test;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.techzhai.dao.UserDaoImpl;
import com.techzhai.service.UserService;

public class TestUserDaoImpl {

	@Test
	public void testUserListSize() {
		System.out.println(new UserDaoImpl().fetchAllUserList().size());
	}
	
	@Test
	public void testDeleteUser() {
		System.out.println(new UserService().deleteUser(85));
	}
	
	
	@Test
	public void testBlackList() {
		System.out.println(new UserDaoImpl().userInBlackList(97));
	}
	
	@Test
	public void testModifyUser() {
		System.out.println(new UserService().userInfoModify(19, "卖女孩的DADA火柴", "1210812591@qq.com", "123123", "本科"));
	}
	
	@Test
	public void testGetAllUsers() {
		System.out.println(new UserDaoImpl().fetchUserInfo().size());
	}
}
