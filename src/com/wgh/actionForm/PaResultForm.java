package com.wgh.actionForm;

import org.apache.struts.action.ActionForm;

public class PaResultForm extends ActionForm{
	private int id;
	private int paid;
	private String patitle;
	private String userid;
	private int sscore;
	private int mscore;
	private int allscore;
	private String subtime;
	private String course;
	
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPaid() {
		return paid;
	}
	public void setPaid(int paid) {
		this.paid = paid;
	}
	public String getPatitle() {
		return patitle;
	}
	public void setPatitle(String patitle) {
		this.patitle = patitle;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getSscore() {
		return sscore;
	}
	public void setSscore(int sscore) {
		this.sscore = sscore;
	}
	public int getMscore() {
		return mscore;
	}
	public void setMscore(int mscore) {
		this.mscore = mscore;
	}
	public String getSubtime() {
		return subtime;
	}
	public void setSubtime(String subtime) {
		this.subtime = subtime;
	}
	public int getAllscore() {
		return allscore;
	}
	public void setAllscore(int allscore) {
		this.allscore = allscore;
	}
}