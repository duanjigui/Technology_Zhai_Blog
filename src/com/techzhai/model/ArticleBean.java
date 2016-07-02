package com.techzhai.model;

import java.util.Date;

/**
 * 文章实体bean
 * @author snowalker
 * 16.5.28
 */
public class ArticleBean {

	private Integer  w_id;			//文章id
	
	private String   w_title;		//文章题目
	
	private String   w_content;		//文章内容
	
	private Integer  w_readnum;		//阅读次数
	
	private Date     w_publishtime;	//发布时间
	
	private Integer  w_publisher;	//发布者
	
	private Integer  w_articletype;	//文章类型
	
	public ArticleBean() {
	}

	public ArticleBean(Integer w_id, String w_title, String w_content, Integer w_readnum, Date w_publishtime,
			Integer w_publisher, Integer w_articletype) {
		super();
		this.w_id = w_id;
		this.w_title = w_title;
		this.w_content = w_content;
		this.w_readnum = w_readnum;
		this.w_publishtime = w_publishtime;
		this.w_publisher = w_publisher;
		this.w_articletype = w_articletype;
	}



	public Integer getW_id() {
		return w_id;
	}

	public void setW_id(Integer w_id) {
		this.w_id = w_id;
	}

	public String getW_title() {
		return w_title;
	}

	public void setW_title(String w_title) {
		this.w_title = w_title;
	}

	public String getW_content() {
		return w_content;
	}

	public void setW_content(String w_content) {
		this.w_content = w_content;
	}

	public Integer getW_readnum() {
		return w_readnum;
	}

	public void setW_readnum(Integer w_readnum) {
		this.w_readnum = w_readnum;
	}

	public Date getW_publishtime() {
		return w_publishtime;
	}

	public void setW_publishtime(Date w_publishtime) {
		this.w_publishtime = w_publishtime;
	}

	public Integer getW_publisher() {
		return w_publisher;
	}

	public void setW_publisher(Integer w_publisher) {
		this.w_publisher = w_publisher;
	}

	public Integer getW_articletype() {
		return w_articletype;
	}

	public void setW_articletype(Integer w_articletype) {
		this.w_articletype = w_articletype;
	}
	
	
}
