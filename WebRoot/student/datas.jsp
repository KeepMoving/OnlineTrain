<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>�γ�����ѧϰ����ϵͳ</title>
<link href="../CSS/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="40%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">�γ����ϲ�ѯ &gt;&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;��ǰ�û���<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >�˳�ϵͳ</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<table width="96%" height="27" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
</table>
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">	  
	<td width="10%" bgcolor="#B2D6F1" height="30">���</td>
	<td width="35%" bgcolor="#B2D6F1">��������</td>  
	<td width="55%" bgcolor="#B2D6F1">��������</td>	
  </tr>
  <%   List datas = (List)request.getAttribute("datasQuery");
  	   Iterator it = datas.iterator();
  	   int i=1;
  	   while(it.hasNext()){
  	   com.wgh.actionForm.DataForm dform = (com.wgh.actionForm.DataForm)it.next();
   %>		
	  <tr>  	
	    <td align="center">&nbsp;<%=i %>&nbsp;</td>
	    <td align="center"><a onclick="javascript:window.open('<%=dform.getLink() %>')"><%=dform.getName() %></a></td>
		<td align="center"><a onclick="javascript:window.open('<%=dform.getLink() %>')"><%=dform.getLink() %></a></td>		
	  </tr>
  
  <%  
  		i++;
  	}
   String tsrow =(String)request.getAttribute("srow").toString();
  		int srow = Integer.valueOf(tsrow);
		 String tallrow =(String)request.getAttribute("allrow").toString();
		 int allrow = Integer.valueOf(tallrow);		
		 java.util.HashMap newValues = new java.util.HashMap();  
	%>
  <tr>
  <td colspan="3" align="right">
   ��<%=allrow/10+1 %>ҳ/<%=allrow %>����¼&nbsp;&nbsp;��ǰ��<%=srow/10+1 %>ҳ&nbsp;&nbsp;
  <html:link page="/manage/data.do?action=datasQuery&srow=0">��ҳ</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/manage/data.do?action=datasQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{ %>��һҳ&nbsp;<%}
	   if((srow+10)<=allrow){
	   newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/data.do?action=datasQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{%>��һҳ&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/manage/data.do?action=datasQuery" name="newValues">βҳ</html:link>&nbsp;</td>
  </tr>
</table>

    </table></td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>