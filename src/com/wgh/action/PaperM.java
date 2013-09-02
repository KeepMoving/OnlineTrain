package com.wgh.action;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.wgh.actionForm.CourseForm;
import com.wgh.actionForm.PaperForm;
import com.wgh.dao.CourseDAO;
import com.wgh.dao.PaperDAO;
import com.wgh.dao.QuestionsDAO;

public class PaperM extends DispatchAction {
	private PaperDAO pdao = new PaperDAO();
	private QuestionsDAO qdao = new QuestionsDAO();
	private CourseDAO cdao = new CourseDAO();
	
	//先查询课程csQuery
	public ActionForward csQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession se = request.getSession();		
		String ut=(String)se.getAttribute("ut");
		System.out.println("用户类型："+ut);
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
		
	//查询某课程的试卷
	public ActionForward paperQuery(ActionMapping mapping, ActionForm form,
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
		int allrow = pdao.findAllrow(cid);
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);			
		}
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",srow);
		CourseForm course=(CourseForm)cdao.query(cid, srow, null).get(0);
		se.setAttribute("course", course);
		request.setAttribute("paperQuery", pdao.query(0,cid, srow));		
		return mapping.findForward("paperQuery");
	}
	//添加第1步
	public ActionForward pAddone(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		CourseForm ctemp = (CourseForm)session.getAttribute("course");
		PaperForm pat = (PaperForm)session.getAttribute("pat");		
		if(pat==null){
		 pat = (PaperForm)form;
		 pat.setCid(ctemp.getId());
		 pat.setCouse(ctemp.getCourse());
		}
		int flag = pdao.findByTitle(pat.getTitle());
		if(flag!=0){
			request.setAttribute("error", "试卷标题已使用，请重新命名！");
			return mapping.findForward("error");
		}else{		
			session.setAttribute("pat", pat);			
			int srow;
			String row = request.getParameter("srow");	
			int allrow = qdao.findAllrow(1,ctemp.getId());
			if(row==null||row==""){
				srow = 0;
			}else{
				srow = Integer.valueOf(row);
				System.out.println("开始行为"+srow);
			}
			request.setAttribute("allrow",allrow);
			request.setAttribute("srow",row);
			request.setAttribute("questionsQuery",qdao.paquery(srow,ctemp.getId(),"1"));		
			return mapping.findForward("pAddtwo");
		}
		
	}
	//添加第2步	
	public ActionForward pAddtwo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		CourseForm ctemp = (CourseForm)session.getAttribute("course");
		PaperForm pat = (PaperForm)session.getAttribute("pat");		
		String st = "";
		String[] sl=request.getParameterValues("singles");
		if(sl==null){
			request.setAttribute("error", "你没有为试卷选择单选题！");
			return mapping.findForward("error");
		}else if(sl!=null){
			st="";
			for(int i=0;i<sl.length;i++){
				st=st+sl[i]+",";
			}
			st=st.substring(0, st.length()-1);				
			pat.setSlist(st);
			System.out.println("已经选了的题："+st+":题的数量为："+sl.length);			
		}		
		session.setAttribute("pat", pat);		
		int srow;				
		String row = request.getParameter("srow");	
		int allrow = qdao.findAllrow(2,ctemp.getId());		
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);
			System.out.println("开始行为"+srow);
		}
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",row);
		request.setAttribute("questionsQuery",qdao.paquery(srow,ctemp.getId(),"2"));
		
		return mapping.findForward("pAddthree");		
	}
	//添加第3步	
	public ActionForward pAddthree(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		PaperForm pat = (PaperForm)session.getAttribute("pat");
		String name = "mores",an="";
		String[] a=request.getParameterValues(name);
		if(a!=null){
			for(int j=0;j<a.length;j++){
				an=an+a[j]+",";
			}
			an=an.substring(0, an.length()-1);
			pat.setMlist(an);
		}else{
			request.setAttribute("error", "你没有为试卷选择多选题！");
			return mapping.findForward("error");
		}
		int ret = pdao.insert(pat);
		if (ret == 1) {
			return mapping.findForward("paperAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "该试卷标题已经添加！");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "添加考试题目失败！");
			return mapping.findForward("error");
		}				
	}
	//修改试卷准备pModify
	public ActionForward paperUp(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		int did = Integer.valueOf(request.getParameter("upid"));
		List pl = pdao.query(did,0, 0);	
		PaperForm pf = null;
		Iterator it = pl.iterator();
		pf = (PaperForm)it.next();			
		request.setAttribute("paperUp", pf);
		return mapping.findForward("paperUp");
	}
	//修改试卷
	public ActionForward pModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){				
		PaperForm pf = (PaperForm)form;
		int ret = pdao.update(pf);
		if (ret == 1) {
			return mapping.findForward("pModify");		
		} else {
			request.setAttribute("error", "教学试卷修改失败！");
			return mapping.findForward("error");
		}
	}
	//删除试卷
	public ActionForward paperDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		
		String delid = (String)request.getParameter("upid");
		if (delid==null||delid=="") {
			request.setAttribute("error", "获取删除试卷的ID失败！");
			return mapping.findForward("error");	
		} else {
			int flag = pdao.delete(delid);
			if(flag==1){
				return mapping.findForward("paperDel");
			}else{			
				request.setAttribute("error","删除试卷操作失败！");
				return mapping.findForward("paperDel");				
			}				
		}  
	}
}
