package com.wgh.actionForm;

import org.apache.struts.action.ActionForm;

public class PaperForm extends ActionForm{
	private int id;
	private String title;
	private String type;
	private String state;
	private String alltime;
	private String stime;
	private String single;
	private String more;
	private String slist;
	private String mlist;
	private int	   cid;
	private String couse;
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCouse() {
		return couse;
	}
	public void setCouse(String couse) {
		this.couse = couse;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAlltime() {
		return alltime;
	}
	public void setAlltime(String alltime) {
		this.alltime = alltime;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getSingle() {
		return single;
	}
	public void setSingle(String single) {
		this.single = single;
	}
	public String getMore() {
		return more;
	}
	public void setMore(String more) {
		this.more = more;
	}
	public String getSlist() {
		return slist;
	}
	public void setSlist(String slist) {
		this.slist = slist;
	}
	public String getMlist() {
		return mlist;
	}
	public void setMlist(String mlist) {
		this.mlist = mlist;
	}

}
