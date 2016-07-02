package com.techzhai.utils;

import org.hibernate.SessionFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 * 饿汉式单例写法
 * @author snowalker
 * 16.6.28
 */
public class Hibernate4Utils {	
	
	static ClassPathXmlApplicationContext context = 
			new ClassPathXmlApplicationContext("applicationContext.xml");
	
	private static SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
	
	private Hibernate4Utils(){}

	public static SessionFactory getSessionFactory() {		
		
		return sessionFactory;
	}
	
	public static void main(String[] args) {
		System.out.println(Hibernate4Utils.getSessionFactory().getClass());
	}
}
