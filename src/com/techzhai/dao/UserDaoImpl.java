package com.techzhai.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.techzhai.model.AdminBean;
import com.techzhai.model.ArticleTypeBean;
import com.techzhai.model.UserBean;
import com.techzhai.utils.Hibernate4Utils;

/**
 * 用户dao层实现类
 * @author snowalker
 * 16.6.30
 *
 */
@Repository("userDao")
public class UserDaoImpl implements UserDao {
	
	private SessionFactory sessionFactory = Hibernate4Utils.getSessionFactory();
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	//获取全部用户列表
	@Override
	public List<UserBean> fetchAllUserList() {
		 Session session = sessionFactory.openSession();
		 //hql查询获取列表
		 String hql = "from UserBean";
		 Query query = session.createQuery(hql);
		 List<UserBean> userBeans = query.list();
		 session.close();
		 return userBeans;
	}
	
	//删除指定id的用户
	@Override
	public String deleteUser(Integer u_id) {
		Session session = sessionFactory.openSession();
		//开启事务
		Transaction ts = session.beginTransaction();
		UserBean userBean = new UserBean();
		userBean.setU_id(u_id);
		session.delete(userBean);
		
		ts.commit();
		session.close();
		return "删除成功";
	}
	//根据id获取用户信息
	@Override
	public UserBean fetchUserById(int id) {
		Session session = sessionFactory.openSession();
		 //hql查询获取列表
		 String hql = "from UserBean where u_id=?";
		 Query query = session.createQuery(hql);
		 query.setInteger(0, id);
		 UserBean userBean=(UserBean) query.uniqueResult();
		 return userBean;
	}
	
	//用户根据id拉黑
	@Override
	public String userInBlackList(Integer u_id) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		//获取当前对象
		UserBean userBean = (UserBean) session.get(UserBean.class, u_id);
		//更新状态为拉黑
		userBean.setBlacklist(true);
		
		session.update(userBean);
		//关闭事务
		transaction.commit();
		session.close();
		return "拉黑成功！";
	}
	
	//解除拉黑，加入白名单
	public String userInWhiteList(Integer u_id) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		//获取当前对象
		UserBean userBean = (UserBean) session.get(UserBean.class, u_id);
		//更新状态为拉黑
		userBean.setBlacklist(false);
		
		session.update(userBean);
		//关闭事务
		transaction.commit();
		session.close();
		return "解除拉黑！";
	}
	
	//用户信息修改
	@Override
	public String userInfoModify(Integer u_id, String u_nickname, String u_email, String userpwd, String edu_background) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		//获取当前对象
		UserBean userBean = (UserBean) session.get(UserBean.class, u_id);
		//更新数据
		userBean.setU_nickname(u_nickname);
		userBean.setU_email(u_email);
		userBean.setUserpwd(userpwd);
		userBean.setEdu_background(edu_background);
		
		session.update(userBean);
		//关闭事务
		transaction.commit();
		session.close();
		return "修改成功！";
	}
	
	//用户登录验证实现
	@Override
	public Boolean userLoginVerify(String u_email, String userpwd) {
		//获取sessionFactory
		SessionFactory sessionFactory = Hibernate4Utils.getSessionFactory();
		Session session = sessionFactory.openSession();
				
		
		//根据邮箱查密码
		String hql = "from UserBean u where u.u_email = :u_email";
		Query query = session.createQuery(hql);
		query.setString("u_email", u_email);
		UserBean userBean = (UserBean) query.uniqueResult();

		String userpwdInDB = userBean.getUserpwd();
		// 比较传入adminpwd和查出adminpwd是否相等
		if (userpwd.equals(userpwdInDB)) {
			return true;
		}
		session.close();
		return false;
	}
	
	//用户注册
	@Override
	public String userRegist(String u_nickname, String userpwd, String u_email, String edu_background) {
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		//持久化
		UserBean userBean = new UserBean();
		userBean.setU_nickname(u_nickname);
		userBean.setUserpwd(userpwd);
		userBean.setU_email(u_email);
		userBean.setEdu_background(edu_background);
		userBean.setBlacklist(false);
		session.save(userBean);
		//提交
		ts.commit();
		session.close();
		return "添加成功";
	}
	
	
	//根据name获取用户信息(id)
	@Override
	public UserBean fetchUserIdByname(String name) {
		Session session = sessionFactory.openSession();
		 //hql查询获取列表
		 String hql = "from UserBean where u_nickname=?";
		 Query query = session.createQuery(hql);
		 query.setString(0, name);
		 UserBean userBean=(UserBean) query.uniqueResult();
		 session.close();
		 return userBean;
		
	}
	
	//通过email获取用户信息
	public UserBean fetchUserByEmail(String u_email) {
		Session session = sessionFactory.openSession();
		 //hql查询获取列表
		 String hql = "from UserBean where u_email=?";
		 Query query = session.createQuery(hql);
		 query.setString(0, u_email);
		 UserBean userBean=(UserBean) query.uniqueResult();
		 session.close();
		 return userBean;
		
	}

	
}
