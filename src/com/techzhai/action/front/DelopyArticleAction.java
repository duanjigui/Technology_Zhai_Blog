package com.techzhai.action.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.techzhai.model.ArticleBean;
import com.techzhai.model.UserBean;
import com.techzhai.service.DelopyArticleService;
/**
 * 发表文章的action
 * @author duanjigui
 * 2016.6.30
 */
@Controller(value="delopyArticle")
@Scope(value="prototype")

public class DelopyArticleAction extends ActionSupport implements ModelDriven<ArticleBean>{
	
	private static final long serialVersionUID = 1L;
	
	private String articletype; //文章类型
	
	private ArticleBean articleBean=new ArticleBean();  //模型驱动的类

	@Resource(name="delopyArticleService")
	private DelopyArticleService delopyArticleService;
	
	@Override
	public ArticleBean getModel() {
		
		return articleBean;
	}

	public String getArticletype() {
		return articletype;
	}

	public void setArticletype(String articletype) {
		this.articletype = articletype;
	}
	
		
	// 发表文章的路由【目前映射到test.jsp页面，实际中应映射到index.jsp】
		public String delopy(){
			HttpSession session = ServletActionContext.getRequest().getSession();
			UserBean userBean = (UserBean) session.getAttribute("loginUserBean");
			if (userBean!=null) {
				int article_id = userBean.getU_id();
				
				delopyArticleService.saveArticle(articletype, articleBean,article_id);
				
				return SUCCESS;
			}else {
				return "delopypage";
			}
			
		}
}
