package com.wgh.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.wgh.actionForm.CourseForm;
import com.wgh.dao.CourDeDAO;
import com.wgh.dao.CourseDAO;
import com.wgh.dao.PaResultDAO;
import com.wgh.dao.PaperDAO;
import com.wgh.dao.QuestionsDAO;
import com.wgh.dao.TasksDAO;

public class Courses extends DispatchAction{
	private CourseDAO cdao = new CourseDAO();
	private TasksDAO tdao = new TasksDAO();
	private CourDeDAO cedao = new CourDeDAO();
	private QuestionsDAO qdao = new QuestionsDAO();
	private PaperDAO pdao = new PaperDAO();
	private PaResultDAO prdao = new PaResultDAO();
	
	//课程查询
	public ActionForward coursesQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int srow;
		String row = request.getParameter("srow");
		HttpSession se = request.getSession();
		String tname = (String)se.getAttribute("manager");
		int allrow = cdao.fandAll(tname);		
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);			
		}
		System.out.println(row+"	"+tname+"	"+allrow);
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",srow);
		request.setAttribute("clist",cdao.query(0,srow,tname));
		
		return mapping.findForward("coursesQuery");
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
		String tname =(String)se.getAttribute("manager");		
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
		se.setAttribute("course",(CourseForm)cdao.query(cid, srow, tname).get(0));
		request.setAttribute("celist",cedao.Query(0, cid, srow));

		return mapping.findForward("coursesMan");
	}
	
	//课程作业管理tasksMan
	public ActionForward tasksMan(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int cid; 
		HttpSession se = request.getSession();
		CourseForm ctemp = (CourseForm)se.getAttribute("course");
		String tname = (String)se.getAttribute("manager");
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
		se.setAttribute("course",(CourseForm)cdao.query(cid, srow, tname).get(0));
		request.setAttribute("tlist",tdao.query(0,cid, null, srow));
		return mapping.findForward("tasksMan");
	}
	
	//课程作业修改tasksUp
	public ActionForward tasksUp(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int tid=Integer.parseInt(request.getParameter("tid")); 
		int mark=Integer.parseInt(request.getParameter("mark")); 
		int srow=Integer.parseInt(request.getParameter("srow")); 
		HttpSession se = request.getSession();
		CourseForm ctemp = (CourseForm)se.getAttribute("course");
		int allrow =tdao.fandAll(ctemp.getId());
		List list = tdao.upMark(tid, mark, ctemp.getId(), srow);
		if(list==null){
			request.setAttribute("error", "作业分数修改失败！");
			return mapping.findForward("error");
		}else{
			request.setAttribute("allrow",allrow);
			request.setAttribute("srow",srow);
			se.setAttribute("course",ctemp);
			request.setAttribute("tlist",list);
			return mapping.findForward("tasksMan");
		}		
	}
	
	//课程修改查询
	public ActionForward coursesUp(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int cid = Integer.parseInt(request.getParameter("upid"));
		HttpSession se = request.getSession();
		String tname =(String)se.getAttribute("manager");
		request.setAttribute("course",(CourseForm)cdao.query(cid, 0, tname).get(0));	
		return mapping.findForward("coursesUp");
	}
	
	//课程修改
	public ActionForward courUpdo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CourseForm cform =(CourseForm)form;
		int rs = cdao.update(cform);
		if (rs == 0) {
			request.setAttribute("error", "课程修改失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("courUpdo");
		}		
	}
	
	//添加培训课程
	public ActionForward courAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CourseForm cf = (CourseForm)form;
		int ret = cdao.insert(cf);
		if (ret == 1) {
			return mapping.findForward("courAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "该培训课程已存在，请重新输入！");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "添加培训课程失败！");
			return mapping.findForward("error");
		}		
	}
	
	//培训课程删除 coursesDel只做了删除数据库中的记录，没有删除真正的文件
	public ActionForward coursesDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {		
		int cid = Integer.parseInt(request.getParameter("upid"));
//		CourseForm cf = (CourseForm)cdao.query(cid, 0, null).get(0);
//		int rcd = cedao.fandAll(cid);   
//		int fcd = cedao.delByCid(cid);		//删除课程详细记录
//		int rtd = tdao.fandAll(cid);
//		int ftd = tdao.delByCid(cid);		//删除课程作业记录
//		int rqd = qdao.findAllrow(0, cid);
//		int fqd = qdao.delByCid(cid);		//删除课程试题记录
//		int rpd = pdao.findAllrow(cid);
//		int fpd = pdao.delByCid(cid);		//删除课程试卷记录
											
		//删除课程测试结果记录				
		int ret =cdao.delete(cid);
		if (ret == 1) {
			return mapping.findForward("coursesDel");		
		} else {
			request.setAttribute("error", "删除培训课程失败！");
			return mapping.findForward("error");
		}		
	}
	
}
