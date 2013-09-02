package com.wgh.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.wgh.actionForm.CourseForm;
import com.wgh.actionForm.StudentForm;
import com.wgh.dao.CourDeDAO;
import com.wgh.dao.CourseDAO;
import com.wgh.dao.TasksDAO;

public class Course extends DispatchAction{
	private CourseDAO cdao = new CourseDAO();
	private TasksDAO tdao = new TasksDAO();
	private CourDeDAO cedao = new CourDeDAO();	
	//课程查询tasksMan
	public ActionForward courQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int srow;
		String row = request.getParameter("srow");
		int allrow = cdao.fandAll(null);		
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);			
		}
		System.out.println("课程学习："+srow+"		"+allrow);
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",srow);
		request.setAttribute("clist",cdao.query(0,srow,null));
		
		return mapping.findForward("courQuery");
	}
	
	//课程管理，计划及学员作业管理
	public ActionForward coursesMan(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int cid; 
		HttpSession se = request.getSession();
		CourseForm ctemp = (CourseForm)se.getAttribute("course");
		if(ctemp==null){
			cid = Integer.parseInt(request.getParameter("upid"));
		}else{
			cid = ctemp.getId();
		}		
		//计划文档的管理 cedao
		int srow;
		String row = request.getParameter("srow");		
		int allrow =cedao.fandAll(cid);
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);			
		}		
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",srow);
		CourseForm course=(CourseForm)cdao.query(cid, srow, null).get(0);
		se.setAttribute("course",course);
		request.setAttribute("celist",cedao.Query(0, cid, srow));

		return mapping.findForward("coursesMan");
	}
	
	//课程作业管理tasksMan
	public ActionForward tasksMan(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int cid; 
		HttpSession se = request.getSession();
		CourseForm ctemp = (CourseForm)se.getAttribute("course");
		StudentForm sf = (StudentForm)se.getAttribute("user");
		if(ctemp==null){
			cid = Integer.parseInt(request.getParameter("upid"));
		}else{
			cid = ctemp.getId();
		}		
		int srow;
		String row = request.getParameter("srow");		
		int allrow =tdao.fandAll(cid);
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);			
		}		
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",srow);
		se.setAttribute("course",(CourseForm)cdao.query(cid, srow, null).get(0));
		request.setAttribute("tlist",tdao.query(0,cid,sf.getName(), srow));
		return mapping.findForward("tasksMan");
	}
}
