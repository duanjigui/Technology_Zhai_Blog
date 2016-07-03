package com.techzhai.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.techzhai.model.ArticleBean;
import com.techzhai.model.UserBean;
import com.techzhai.utils.Hibernate4Utils;
/**
 * 文章处理部分的dao
 * @author duanjigui
 * 2016.6.30
 */

@Repository(value="articleDaoImpl")
public class ArticleDaoImpl implements ArticleDao {

	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public void saveArticle(ArticleBean articleBean) {
		Session session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		try{
			session.save(articleBean);
		}catch(Exception e){
			transaction.rollback();
			System.err.println("保存文章部分失败！ saveArticle");
			e.printStackTrace();
		}
		transaction.commit();
		session.close();
	}

	@Override
	public List<ArticleBean> fetchAllArticle() {
		Session session=sessionFactory.openSession();
		//Session session = Hibernate4Utils.getSessionFactory().openSession();
		Query query=session.createQuery("from ArticleBean");
		@SuppressWarnings("unchecked")
		List<ArticleBean> list=(List<ArticleBean>)query.list();
		session.close();
		return list;
	}
	
	public List<ArticleBean> fetchArticleRecommend() {
		Session session=sessionFactory.openSession();
		//Session session = Hibernate4Utils.getSessionFactory().openSession();
		Query query=session.createQuery("from ArticleBean where w_id<13 order by w_id desc");
		@SuppressWarnings("unchecked")
		List<ArticleBean> list=(List<ArticleBean>)query.list();
		session.close();
		return list;
	}

	@Override
	public void deletArticle(ArticleBean articleBean) {
		Session session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		try{
			session.delete(articleBean);
		}catch(Exception e){
			transaction.rollback();
			System.err.println("删除文章部分失败！ deletArticle");
			e.printStackTrace();

		}
		transaction.commit();
		session.close();
	}

	@Override
	public void modifyArticle(ArticleBean articleBean) {
		Session session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		try{
			session.update(articleBean);
		}catch(Exception e){
			transaction.rollback();
			System.err.println("修改文章部分失败！ modifyArticle");
			e.printStackTrace();

		}
		transaction.commit();
		session.close();
	}

	@Override
	public ArticleBean fetchArticleById(int articleId) {
		Session session=sessionFactory.openSession();
		ArticleBean articleBean=(ArticleBean) session.get(ArticleBean.class, articleId);
		session.close();
		return articleBean;
	}
	
	//根据类型id获取类型下的文章列表
		@Override
		public List<ArticleBean> fetchArticelistByTypeId(int type_id) {
			sessionFactory=	Hibernate4Utils.getSessionFactory();
			Session session=	sessionFactory.openSession();
			Query query=	session.createQuery("from ArticleBean where w_articletype=?");
			query.setInteger(0, type_id);
			//获取结果
			List<ArticleBean> articleBeans = query.list();
			session.close();
			return articleBeans;
		}
		
		//增加阅读次数
		
		public void addReadTime(Integer w_id) {
			sessionFactory=	Hibernate4Utils.getSessionFactory();
			Session session=	sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			
			//获取当前的文章阅读次数
			ArticleBean articleBean = (ArticleBean) session.get(ArticleBean.class, w_id);
			Integer currendReadTime = articleBean.getW_readnum();
			//更新状态为拉黑
			articleBean.setW_readnum(currendReadTime + 1);
			session.update(articleBean);
			//关闭事务
			transaction.commit();
			
			session.close();
		}
		
		public static void main(String[] args) {
			System.out.println(new ArticleDaoImpl().fetchArticelistByTypeId(1).size());
			new ArticleDaoImpl().addReadTime(6);
		}
}
