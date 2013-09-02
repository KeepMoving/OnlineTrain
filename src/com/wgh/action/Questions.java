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
import com.wgh.actionForm.StudentForm;
import com.wgh.actionForm.QuestionsForm;
import com.wgh.dao.CourseDAO;
import com.wgh.dao.QuestionsDAO;

public class Questions extends DispatchAction{
	private CourseDAO cdao = new CourseDAO();	
	private QuestionsDAO qdao = new QuestionsDAO();	
	//条件查询题目信息
	public ActionForward questionSearch(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {			
		QuestionsForm questionsForm =(QuestionsForm) form;		
		request.setAttribute("questionsQuery", qdao.search(questionsForm));	
		questionsForm.reset(mapping, request);
		return mapping.findForward("questionSearch");
	}
	//先查询课程列表
	public ActionForward csQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession se = request.getSession();		
		String ut=(String)se.getAttribute("ut");
		System.out.println(ut);
		int srow;		
		String row = request.getParameter("srow");						
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);			
		}
		int allrow;
		List list;
		if("studentForm".equals(ut)){
			allrow = cdao.fandAll(null);
			list = cdao.query(0, srow, null);
		}else{
			String tname = (String)se.getAttribute("manager");
			allrow = cdao.fandAll(tname);
			list = cdao.query(0, srow, tname);
		}		 
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",srow);		
		if(0==list.size()){
			request.setAttribute("error", "请先添加试题相应的培训课程！");
			return mapping.findForward("error");
		}else if("studentForm".equals(ut)){
			request.setAttribute("clist",list);
			return mapping.findForward("tcsQuery");
		}else{
			request.setAttribute("clist",list);
			return mapping.findForward("csQuery");
		}		
	}
	// 查询考试题目信息
	public ActionForward questionsQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int cid; 
		HttpSession se = request.getSession();
		CourseForm ctemp = (CourseForm)se.getAttribute("course");
		if(ctemp==null){
			cid = Integer.parseInt(request.getParameter("upid"));
		}else{
			cid = ctemp.getId();
		}		
		int srow;		
		String row = request.getParameter("srow");	
		int allrow = qdao.findAllrow(0,cid);
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);
		}
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",srow);
		CourseForm course=(CourseForm)cdao.query(cid, srow, null).get(0);
		se.setAttribute("course", course);
		request.setAttribute("questionsQuery",qdao.query(0,cid,srow));
		return mapping.findForward("questionsQuery");
	}
	// 添加考试题目
	public ActionForward questionsAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm = (QuestionsForm) form;
		int ret = qdao.insert(questionsForm);
		if (ret == 1) {
			return mapping.findForward("questionsAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "该考试题目已经添加！");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "添加考试题目失败！");
			return mapping.findForward("error");
		}
	}	
	// 修改考试题目时的查询
	public ActionForward questionsModifyQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm=(QuestionsForm)((qdao.query(Integer.parseInt(request.getParameter("upid")),0,0)).get(0));
		request.setAttribute("questionsModifyQuery", questionsForm);
		return mapping.findForward("questionsModifyQuery");
	}
	//考试题目查看questionsViewQuery
	public ActionForward questionsViewQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {		
		QuestionsForm questionsForm=(QuestionsForm)((qdao.query(Integer.parseInt(request.getParameter("upid")),0,0)).get(0));
		request.setAttribute("questionsModifyQuery", questionsForm);
		return mapping.findForward("questionsViewQuery");
	}
	//修改考试题目
	public ActionForward questionsModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm = (QuestionsForm) form;
		int ret = qdao.update(questionsForm);
		if (ret == 0) {
			request.setAttribute("error", "修改考试题目失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("questionsModify");
		}
	}	
	// 删除考试题目
	public ActionForward questionsDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionsForm questionsForm = (QuestionsForm) form;		
		int ret = qdao.delete(questionsForm);
		if (ret == 0) {
			request.setAttribute("error", "删除考试题目失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("questionsDel");
		}
	}
	//学生选择题练习查询
	public ActionForward selectList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {	
		int cid; 
		HttpSession se = request.getSession();
		CourseForm ctemp = (CourseForm)se.getAttribute("course");
		if(ctemp==null){
			cid = Integer.parseInt(request.getParameter("upid"));
		}else{
			cid = ctemp.getId();
		}
		CourseForm course=(CourseForm)cdao.query(cid, 0, null).get(0);
		se.setAttribute("course", course);
		int srow;		
		QuestionsForm q = (QuestionsForm)form;
		se.removeAttribute("singleQue");
		se.removeAttribute("moreleQue");
		String row = request.getParameter("srow");
		String type = request.getParameter("type");
		System.out.println("试题类型为"+type);			
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);
			System.out.println("开始行为"+srow);
		}		
		if("1".equals(type)){
			int allrow = qdao.findAllrow(1,cid);	
			request.setAttribute("allrow",allrow);
			request.setAttribute("srow",srow);						
			se.setAttribute("singleQue",qdao.stexequery(srow,cid,type));			
			return mapping.findForward("singleQue");
		}else{
			int allrow = qdao.findAllrow(2,cid);	
			request.setAttribute("allrow",allrow);
			request.setAttribute("srow",srow);
			se.setAttribute("moreleQue",qdao.stexequery(srow,cid,type));
			return mapping.findForward("moreleQue");			
		}
	}
	//学生单选题练习提交
	public ActionForward submitExercise(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){		
		QuestionsForm qform = (QuestionsForm)form;
		int cid; 
		HttpSession se = request.getSession();
		CourseForm ctemp = (CourseForm)se.getAttribute("course");
		if(ctemp==null){
			cid = Integer.parseInt(request.getParameter("upid"));
		}else{
			cid = ctemp.getId();
		}
		CourseForm course=(CourseForm)cdao.query(cid, 0, null).get(0);
		se.setAttribute("course", course);
		
		String row = qform.getOptionB();
		String type = request.getParameter("type");
		//单选题操作		
			int allrow = qdao.findAllrow(1,cid);	
			request.setAttribute("allrow",allrow);
			request.setAttribute("srow",row);	
			List list = (List)se.getAttribute("singleQue");
			se.setAttribute("singleQue",list);
			
			String[] a =new String[list.size()];
			for(int i=0;i<list.size();i++){			
				String name = "answerArrS"+String.valueOf(i);
				if(request.getParameter(name)==null){
					a[i]="null";
				}else{
				a[i]=request.getParameter(name);
				}
			}
			qform.setAnswerArrS(a);
			request.setAttribute("sinAns", qform);
			return  mapping.findForward("singleQue");
	}
	//多选题操作
	public ActionForward submitMore(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		QuestionsForm qform = (QuestionsForm)form;
		int cid; 
		HttpSession se = request.getSession();
		CourseForm ctemp = (CourseForm)se.getAttribute("course");
		if(ctemp==null){
			cid = Integer.parseInt(request.getParameter("upid"));
		}else{
			cid = ctemp.getId();
		}
		CourseForm course=(CourseForm)cdao.query(cid, 0, null).get(0);
		se.setAttribute("course", course);
		
		String row = qform.getOptionB();
		String type = request.getParameter("type");
		int allrow = qdao.findAllrow(2,cid);	
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",row);
		List list = (List)se.getAttribute("moreleQue");
		se.setAttribute("moreleQue",list);		
		String[] ans = new String[list.size()];
		String an = "";		
		for(int i=0;i<list.size();i++){	
			String name = "answerArrM"+String.valueOf(i);
			String[] a=request.getParameterValues(name);
			if(a==null){
				ans[i]="null";
			}else{
				for(int j=0;j<a.length;j++){
					an=an+a[j];
				}			
				ans[i]=an;
				an="";
			}
		}
		qform.setAnswerArrM(ans);
		request.setAttribute("morAns", qform);
		return  mapping.findForward("moreleQue");
	}		
}
