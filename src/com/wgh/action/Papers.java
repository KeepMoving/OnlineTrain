package com.wgh.action;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.wgh.actionForm.*;
import com.wgh.dao.QuestionsDAO;
import com.wgh.dao.*;

public class Papers extends DispatchAction {
	private PaperDAO pdao = new PaperDAO();
	private QuestionsDAO qdao = new QuestionsDAO();
	private PaResultDAO prdao = new PaResultDAO();
	private CourseDAO cdao = new CourseDAO();
	//查询
	public ActionForward papersQuery(ActionMapping mapping, ActionForm form,
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
		request.setAttribute("papersQuery", pdao.query(0,cid,srow));		
		return mapping.findForward("papersQuery");
	}	
	//查询单套试卷，准备考试
	public ActionForward paReady(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		int did = Integer.valueOf(request.getParameter("upid"));
		List pl = pdao.query(did,0,0);
		PaperForm pf = null;
		Iterator it = pl.iterator();
		if(it.hasNext()){
			pf = (PaperForm)it.next();
		}
		if(!("进行中".equals(pf.getState()))){
			request.setAttribute("error", "考试没在进行中，不能开始考试！");
			return mapping.findForward("error");
		}else{
			List spl = qdao.tpaquery(pf.getSlist());
			List mpl = qdao.tpaquery(pf.getMlist());
			session.setAttribute("pf", pf);
			session.setAttribute("spl", spl);
			session.setAttribute("mpl", mpl);		
			return mapping.findForward("paperTest");
		}
	}
	//自动阅卷
	public ActionForward testPa(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {		
		HttpSession session=request.getSession();
		PaperForm pf = (PaperForm )session.getAttribute("pf");
		PaResultForm prf = new PaResultForm();
		prf.setPaid(pf.getId());
		prf.setPatitle(pf.getTitle());
		prf.setUserid((String)session.getAttribute("manager"));
		//添加时间
		java.util.Date date = new java.util.Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String dateString = formatter.format(date);
		prf.setSubtime(dateString);
		//单选操作
		List spl = (List)session.getAttribute("spl");
		String[] a =new String[spl.size()];
		for(int i=0;i<spl.size();i++){			
			String name = "answerArrS"+String.valueOf(i);
			if(request.getParameter(name)==null){
				a[i]="null";
			}else{
				a[i]=request.getParameter(name);
			}
		}
		int s = Integer.parseInt(pf.getSingle())/spl.size();
		int alls =Integer.parseInt(pf.getSingle())-s*spl.size(),i=0;
		Iterator it = spl.iterator();
		while(it.hasNext()){
			QuestionsForm qf = (QuestionsForm)it.next();
			if(a[i].equalsIgnoreCase(qf.getAnswer())){
				alls=alls+s;
			}
			i++;
		}
		prf.setSscore(alls);
		//多选操作
		List mpl = (List)session.getAttribute("mpl");			
		String[] ans = new String[mpl.size()];
		String an = "";		
		for(i=0;i<mpl.size();i++){	
			String name = "answerArrM"+String.valueOf(i);
			String[] am=request.getParameterValues(name);
			if(am==null){
				ans[i]="null";
			}else{
				for(int j=0;j<am.length;j++){
					an=an+am[j];
				}			
				ans[i]=an;				
				an="";
			}
		}
		int m = Integer.parseInt(pf.getMore())/mpl.size();
		int allm =Integer.parseInt(pf.getMore())-m*mpl.size();i=0;
		it = mpl.iterator();
		while(it.hasNext()){
			QuestionsForm qf = (QuestionsForm)it.next();
			if(ans[i].equalsIgnoreCase(qf.getAnswer())){
				allm=allm+m;
			}
			i++;
		}
		prf.setMscore(allm);
		prf.setCourse(pf.getCouse());
		int flag = prdao.insert(prf);
		if(flag==1){
			session.setAttribute("prf", prf);
			return mapping.findForward("testPa");
		}else{
			request.setAttribute("error", "考试结果提交失败！");
			return mapping.findForward("error");
		}			
	}	
}
