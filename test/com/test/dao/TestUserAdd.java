package com.test.dao;

import org.junit.Test;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.techzhai.dao.UserDaoImpl;

public class TestUserAdd {
	@Test
	public void testUserAdd() {
		System.out.println(new UserDaoImpl().userRegist("刘宇军哦你们", "123456", "aliuyujionsg@qq.com", "本科"));
	}
}
