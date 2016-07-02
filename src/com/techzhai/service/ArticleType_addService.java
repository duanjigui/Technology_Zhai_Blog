package com.techzhai.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.techzhai.dao.ArticleTypeDao_addImpl;

/**
 * 文章添加服务层
 * @author snowalker
 * 16.7.1
 */
@Service("articleType_addService")
public class ArticleType_addService {
	
	@Resource(name="articleTypeDao_addImpl")
	private ArticleTypeDao_addImpl articleTypeDao_addImpl;
	
	public ArticleTypeDao_addImpl getArticleTypeDao_addImpl() {
		return articleTypeDao_addImpl;
	}

	public void setArticleTypeDao_addImpl(ArticleTypeDao_addImpl articleTypeDao_addImpl) {
		this.articleTypeDao_addImpl = articleTypeDao_addImpl;
	}
	//添加文章类型业务
	public String addArticleType(String t_typename) {
		return articleTypeDao_addImpl.addArticleType(t_typename);
	}
}
