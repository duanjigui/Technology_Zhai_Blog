package com.techzhai.action.manager;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.techzhai.dao.ArticleDao;
import com.techzhai.model.ArticleBean;
import com.techzhai.service.DelopyArticleService;
/**
 * 
 * @author duanjigui
 * 文章管理action
 * 2016.6.30
 */
@Controller(value="articleManage")
@Scope(value="prototype")
public class ArticleManageAction extends ActionSupport implements ModelDriven<ArticleBean>{

	private static final long serialVersionUID = 1L;
	@Resource(name="articleDaoImpl")
	private ArticleDao articleDao;  //处理文章操作的Dao 【简单的业务直接使用dao】
	
	@Resource(name="delopyArticleService")
	private DelopyArticleService delopyArticleService; //处理文章操作的service  【暂未添加spring事务】
	
	private String publisherString; //发布人（字符串类型）
	
	private String articleTypeString; //文章类型（字符串类型）
	

	
	public String getPublisherString() {
		return publisherString;
	}

	public void setPublisherString(String publisherString) {
		this.publisherString = publisherString;
	}

	public String getArticleTypeString() {
		return articleTypeString;
	}

	public void setArticleTypeString(String articleTypeString) {
		this.articleTypeString = articleTypeString;
	}
	private ArticleBean articleBean=new ArticleBean();

	@Override
	public ArticleBean getModel() {
		return articleBean;
	}
	//查询文章列表    映射到【/WEB-INF/admin/articlelist.jsp】
	public String query(){
		List<ArticleBean> list=	articleDao.fetchAllArticle(); //查询全部文章的列表
		Map<String, Object> map=ActionContext.getContext().getSession();
		map.put("article_list", list);
		return "query";
	}
	//增加文章，暂未使用
	public String add(){

		return "add";
	}
	//更新指定文章  映射到【Action:  articlequery】
	public String update(){
		delopyArticleService.updateArticle(articleTypeString, articleBean, publisherString);//更新文章
		return "update";
	}
	//删除文章   映射到【Action:  articlequery】
	public String delete(){
		articleDao.deletArticle(articleBean);
		return "delete";
	}
}
