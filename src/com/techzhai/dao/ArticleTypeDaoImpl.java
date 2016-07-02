package com.techzhai.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.techzhai.model.ArticleTypeBean;
import com.techzhai.utils.Hibernate4Utils;
/**
 * 文章类型实现类
 * @author duanjigui
 * 2016.6.29
 */

@Repository(value="articleTypeDaoImpl")
public class ArticleTypeDaoImpl implements ArticleTypeDao {
	private SessionFactory sessionFactory;
	@Override
	public List<ArticleTypeBean> fetchAllArticleType() {
		sessionFactory=	Hibernate4Utils.getSessionFactory();
		Session session=	sessionFactory.openSession();
		Query query=	session.createQuery("from ArticleTypeBean");
		@SuppressWarnings("unchecked")
		List<ArticleTypeBean>list=(List<ArticleTypeBean>)	query.list();
		session.close();
		return list;
	}
	@Override
	public String fetchArticeTypeById(int type_id) {
		sessionFactory=	Hibernate4Utils.getSessionFactory();
		Session session=	sessionFactory.openSession();
		Query query=	session.createQuery("from ArticleTypeBean where t_id=?");
		query.setInteger(0, type_id);
		ArticleTypeBean articleTypeBean=(ArticleTypeBean) query.uniqueResult();
		session.close();
		return articleTypeBean.getT_typename();
	}
	@Override
	public Integer fetchArticeIdByType(String type) {
		sessionFactory=	Hibernate4Utils.getSessionFactory();
		Session session=	sessionFactory.openSession();
		Query query=	session.createQuery("from ArticleTypeBean where t_typename=?");
		query.setString(0, type);
		ArticleTypeBean articleTypeBean=	(ArticleTypeBean) query.uniqueResult();
		session.close();
		return articleTypeBean.getT_id();
	}
	//根据版块id更新版块名称
	//李鹏鹏
	@Override
	public String updateArticeTypeById(int type_id,String type) {
		sessionFactory=	Hibernate4Utils.getSessionFactory();
		Session session=	sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query query=	session.createQuery("from ArticleTypeBean where t_id=?");
			query.setInteger(0, type_id);
			ArticleTypeBean articleTypeBean=(ArticleTypeBean) query.uniqueResult();
			articleTypeBean.setT_typename(type);
			session.update(articleTypeBean);
		} catch (Exception e) {
			transaction.rollback();
			session.close();
			return "fail";
		}
		transaction.commit();
		session.close();
		return "success";
	}
}
