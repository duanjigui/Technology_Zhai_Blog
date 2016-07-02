package com.techzhai.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.techzhai.model.ArticleTypeBean;
import com.techzhai.utils.Hibernate4Utils;

/**
 * 文章添加实现
 * @author snowalker
 * 16.7.1
 *
 */
@Repository("articleTypeDao_addImpl")
public class ArticleTypeDao_addImpl implements ArticleTypeDao_add {
	
	private SessionFactory sessionFactory = Hibernate4Utils.getSessionFactory();
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	//添加文章类型实现
	@Override
	public String addArticleType(String t_typename) {
		//开启事务
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		//持久化
		ArticleTypeBean articleTypeBean = new ArticleTypeBean();
		articleTypeBean.setT_typename(t_typename);
		session.save(articleTypeBean);
		//提交
		ts.commit();
		session.close();
		return "添加成功";
	}

}
