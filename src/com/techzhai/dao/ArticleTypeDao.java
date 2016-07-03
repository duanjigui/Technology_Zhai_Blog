package com.techzhai.dao;

import java.util.List;

import com.techzhai.model.ArticleBean;
import com.techzhai.model.ArticleTypeBean;
/**
 * 访问文章类型的接口
 * @author duanjigui
 *  2016.6.29
 */
public interface ArticleTypeDao {

	public  List<ArticleTypeBean> fetchAllArticleType();  //获取所有的文章类型
	
	public String fetchArticeTypeById(int type_id);  //根据类型id获取文章类型
	
	public Integer fetchArticeIdByType(String type);  //根据文章类型获取文章id
	
	public String updateArticeTypeById(int type_id,String type); //根据id修改类型名
	
}
