package com.techzhai.dao;

import java.util.List;

import com.techzhai.model.ArticleBean;
/**
 * 文章部分处理的dao
 * @author duanjigui
 * 2016.6.30
 */
public interface ArticleDao {
	
	public void saveArticle(ArticleBean articleBean); //保存一篇文章
	
	public List<ArticleBean> fetchAllArticle();  //获取所有文章的列表
	
	public void deletArticle(ArticleBean articleBean); //删除指定的文章
	
	public void modifyArticle(ArticleBean articleBean); //修改指定文章
	
	public ArticleBean fetchArticleById(int articleId); //根据文章id查看文章信息
	

}
