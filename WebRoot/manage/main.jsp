<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.*"%>
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
              <td width="40%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">�γ̾����ɼ�����  &gt;&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;��ǰ�û���<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >�˳�ϵͳ</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
      <tr>
        <td align="center" valign="top">
        <table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
		<html:form action="/manage/queryResultIf.do?action=stuResultQuery" method="post">
          <tr>
            <td align="left" valign="middle">&nbsp;��ѯ������
	          <html:select property="queryIf">
		<html:option value="userid">�û�ID</html:option>
		<html:option value="ptitle">��������</html:option>		
	 </html:select>
	 &nbsp;�ؼ��֣�
	 <html:text property="key"/>&nbsp;&nbsp;
	 <html:submit property="submit" styleClass="btn_grey" value="��ѯ"/>&nbsp;&nbsp;
	 <html:submit property="submit" styleClass="btn_grey" value="����"/></td>
          </tr>
		  </html:form>
        </table>
				
		<table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center">
    <td width="20%" height="27" bgcolor="#B2D6F1">��������</td>
	<td width="10%" bgcolor="#B2D6F1">�û�ID</td>
	<td width="10%" bgcolor="#B2D6F1">��������</td>
	<td width="10%" bgcolor="#B2D6F1">��ȷ/ȫ��</td>	
	<td width="12%" bgcolor="#B2D6F1">������ʱ(M)</td>
    <td width="13%" bgcolor="#B2D6F1">���볤��(KB)</td>
    <td width="25%" bgcolor="#B2D6F1">�ύʱ��</td>
  </tr>
	<logic:iterate id="stuResult" name="stuResultQuery" type="com.wgh.actionForm.AcmPaCoForm" scope="request">
  <tr align="center" >
    <td style="padding:5px;"><bean:write name="stuResult" property="ptitle" filter="true"/></td>
	<td style="padding:5px;"><bean:write name="stuResult" property="userid" filter="true"/></td>
	<td style="padding:5px;"><bean:write name="stuResult" property="rank" filter="true"/></td>
	<td align="center"><bean:write name="stuResult" property="accept" filter="true"/>/<bean:write name="stuResult" property="sum" filter="true"/></td>
	<td align="center"><bean:write name="stuResult" property="examtime" filter="true"/></td>    
    <td align="center"><bean:write name="stuResult" property="alength" filter="true"/></td>
    <td align="center"><bean:write name="stuResult" property="subtime" filter="true"/></td>
  </tr>
  </logic:iterate> 
   <tr>
  <%     QueryResultIfForm qrif = (QueryResultIfForm)request.getAttribute("qrif");  		 
  		 String tsrow =(String)request.getAttribute("srow").toString();  		 
  		 int srow = Integer.valueOf(tsrow);
		 String tallrow =(String)request.getAttribute("allrow").toString();
		 int allrow = Integer.valueOf(tallrow);		
		 System.out.print("srow:"+srow+"  allrow:"+allrow);
		 java.util.HashMap newValues = new java.util.HashMap();
		 newValues.put("qrif",qrif);
	%>
	<td colspan="7" height="24" align="center">��<%=allrow/10+1 %>ҳ/<%=allrow %>����¼&nbsp;&nbsp;��ǰ��<%=srow/10+1 %>ҳ&nbsp;&nbsp;
	<html:link page="/manage/queryResultIf.do?action=stuResultQuery&srow=0">��ҳ</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/manage/queryResultIf.do?action=stuResultQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{ %>��һҳ&nbsp;<%}
	   if((srow+10)<=allrow){
	   	  newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/queryResultIf.do?action=stuResultQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{%>��һҳ&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/manage/queryResultIf.do?action=stuResultQuery" name="newValues">βҳ</html:link>&nbsp;	 
	</td>
	</tr>
</table>
</td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>