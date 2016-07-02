package com.techzhai.service;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.techzhai.dao.ArticleDao;
import com.techzhai.dao.ArticleTypeDao;
import com.techzhai.dao.UserDao;
import com.techzhai.model.ArticleBean;
/**
 * 对于文章操作的service
 * @author duanjigui
 *  2016.7.1
 */
@Service(value="delopyArticleService")
public class DelopyArticleService {
	@Resource(name="articleTypeDaoImpl")
	private ArticleTypeDao articleTypeDao; //处理文章类型的连接数据库dao
	
	@Resource(name="articleDaoImpl")
	private ArticleDao articleDao;//处理文章的连接数据库dao
	
	@Resource(name="userDao")
	private UserDao userDao;//处理用户的连接数据库dao【这里用来根据用户姓名转换为用户id】
	
	/**
	 * 根据文章类型和文章bean将文章数据保存到数据库
	 * @param articletype  文章类型【字符串类型】
	 * @param articleBean  文章bean【由strus2框架自动获取前台传来的数据】
	 * @param user_id  用户的id 【由用户登录时计入】
	 */
	public void saveArticle(String articletype,ArticleBean articleBean,int user_id){
		int articleId=	articleTypeDao.fetchArticeIdByType(articletype); 
		System.err.println(articleId);
		articleBean.setW_articletype(articleId);  //发布文章类型
		articleBean.setW_publishtime(new Date());//发布时间
		articleBean.setW_readnum(0);//阅读次数默认为0
		articleBean.setW_publisher(user_id);
		articleDao.saveArticle(articleBean);
	}
	/**
	 * 更新指定文章的信息
	 * @param articleTypeString  文章类型【字符串类型】
	 * @param articleBean 文章bean【由strus2框架自动获取前台传来的数据】
	 * @param publisherString 发布文章的人  【字符串类型的姓名】
	 */
	public void updateArticle(String articleTypeString,ArticleBean articleBean,String publisherString){
		int articleTypeId=	articleTypeDao.fetchArticeIdByType(articleTypeString); //获取文章类型id
		articleBean.setW_articletype(articleTypeId);
		int u_id=userDao.fetchUserIdByname(publisherString).getU_id();//获取发布者id
		articleBean.setW_content(articleDao.fetchArticleById(articleBean.getW_id()).getW_content());
		articleBean.setW_publisher(u_id);
		articleDao.modifyArticle(articleBean);
	}
	
}
