package com.techzhai.model;
/**
 * 文章类型bean
 * @author snowalker
 * 16.6.28
 */
public class ArticleTypeBean {
	
	private Integer t_id;			//类型id
	
	private String  t_typename;		//类型名称

	public ArticleTypeBean() {
	}

	public ArticleTypeBean(Integer t_id, String t_typename) {
		super();
		this.t_id = t_id;
		this.t_typename = t_typename;
	}

	public Integer getT_id() {
		return t_id;
	}

	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}

	public String getT_typename() {
		return t_typename;
	}

	public void setT_typename(String t_typename) {
		this.t_typename = t_typename;
	}
	
	
}
