package com.techzhai.action.manager;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.techzhai.dao.ArticleTypeDaoImpl;
import com.techzhai.model.ArticleTypeBean;

public class ArticleTypeAction extends ActionSupport implements ModelDriven<ArticleTypeBean>{
	ArticleTypeBean articleTypeBean = new ArticleTypeBean();
	private ArticleTypeDaoImpl articleTypeDaoImpl;
	public ArticleTypeDaoImpl getArticleTypeDaoImpl() {
		return articleTypeDaoImpl;
	}

	public void setArticleTypeDaoImpl(ArticleTypeDaoImpl articleTypeDaoImpl) {
		this.articleTypeDaoImpl = articleTypeDaoImpl;
	}

	@Override
	public ArticleTypeBean getModel() {
		return articleTypeBean;
	}
	
	//获取参数并调用dao层方法
	public String update(){
		
		articleTypeDaoImpl.updateArticeTypeById(articleTypeBean.getT_id(), articleTypeBean.getT_typename());
		return "update";
	}
	
	
}
