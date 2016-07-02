package com.techzhai.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.techzhai.model.AdminBean;
import com.techzhai.utils.Hibernate4Utils;
/**
 * 管理员dao层实现类
 * @author snowalker
 * 16.6.29
 *
 */
public class AdminDaoImpl implements AdminDao {
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	//管理员登录验证
	@Override
	public Boolean adminLoginByNameAndPwd(String adminname, String adminpwd) {
		//获取sessionFactory
		SessionFactory sessionFactory = Hibernate4Utils.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		//通过adminname查询adminpwd
		//:adminname占位符
		//需要制定别名
		String hql = "from AdminBean a where a.adminname = :adminname";
		Query query =  session.createQuery(hql);
		query.setString("adminname", adminname);
	    List<AdminBean> adminBeans = query.list();
	    AdminBean adminBean = adminBeans.get(0);
	    
	    String adminpwd_inDB = adminBean.getAdminpwd();
		//比较传入adminpwd和查出adminpwd是否相等
	    if (adminpwd.equals(adminpwd_inDB)) {
			return true;
		}
	    session.close();
		return false;
	}

}
