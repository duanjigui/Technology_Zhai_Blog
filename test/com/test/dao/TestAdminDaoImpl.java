package com.test.dao;

import org.junit.Test;

import com.techzhai.dao.AdminDaoImpl;
import com.techzhai.utils.Hibernate4Utils;

public class TestAdminDaoImpl {
	
	@Test
	public void testAdminLoginByNameAndPwd() {
		Hibernate4Utils.getSessionFactory().getClass();
		boolean flag = new AdminDaoImpl().adminLoginByNameAndPwd("root", "root");
		if (flag) {
			System.err.println("true");
		}
	}
}
