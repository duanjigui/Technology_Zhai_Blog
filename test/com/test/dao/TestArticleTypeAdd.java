package com.test.dao;

import org.junit.Test;

import com.techzhai.dao.ArticleTypeDaoImpl;
import com.techzhai.dao.ArticleTypeDao_addImpl;

public class TestArticleTypeAdd {
	
	@Test
	public void testAddType() {
		System.out.println(new ArticleTypeDao_addImpl().addArticleType("PHP"));
	}
	
	@Test
	public void testModifyType() {
		System.out.println(new ArticleTypeDaoImpl().updateArticeTypeById(11, "分类"));
	}
}
