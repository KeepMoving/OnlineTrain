package com.wgh.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.wgh.dao.DataDAO;
import com.wgh.actionForm.DataForm;

public class Data extends DispatchAction {
	private DataDAO dataDao = new DataDAO();
	//管理查询
	public ActionForward dataQuery(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		int srow;		
		String row = request.getParameter("srow");	
		int allrow = dataDao.findAllrow();		
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);
			System.out.println("开始行为"+srow);
		}
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",row);
		request.setAttribute("datasQuery",dataDao.query(0,srow));
		return mapping.findForward("dataQuery");		
	}
	//学生查询
	public ActionForward datasQuery(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		int srow;		
		String row = request.getParameter("srow");	
		int allrow = dataDao.findAllrow();		
		if(row==null||row==""){
			srow = 0;
		}else{
			srow = Integer.valueOf(row);
			System.out.println("开始行为"+srow);
		}
		request.setAttribute("allrow",allrow);
		request.setAttribute("srow",row);
		request.setAttribute("datasQuery",dataDao.query(0,srow));
		return mapping.findForward("datasQuery");		
	}
	//添加资料
	public ActionForward dataAdd(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		DataForm dataForm = (DataForm)form;
		int ret = dataDao.insert(dataForm);
		if (ret == 1) {
			return mapping.findForward("datasAdd");
		} else if (ret == 2) {
			request.setAttribute("error", "该ACM资料已经添加！");
			return mapping.findForward("error");
		} else {
			request.setAttribute("error", "添加ACM资料失败！");
			return mapping.findForward("error");
		}		
	}
	//修改资料查询
	public ActionForward dataModifyQuery(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {		
		DataForm dataForm = (DataForm)((dataDao.query(Integer.parseInt(request.getParameter("upid")),0)).get(0));
		request.setAttribute("dataModifyQuery",dataForm);
		return mapping.findForward("dataModifyQuery");		
	}
	//添加资料
	public ActionForward dataModify(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		DataForm dataForm = (DataForm)form;
		int ret = dataDao.update(dataForm);
		if (ret == 0) {
			request.setAttribute("error", "修改ACM资料失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("dataModify");
		}
	}
	// 删除考试题目
	public ActionForward datasDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		 DataForm dataForm = (DataForm) form;		
		int ret = dataDao.delete(dataForm);
		if (ret == 0) {
			request.setAttribute("error", "删除ACM资料失败！");
			return mapping.findForward("error");
		} else {
			return mapping.findForward("datasDel");
		}
	}
}
