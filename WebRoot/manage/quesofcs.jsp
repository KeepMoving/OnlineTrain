<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<html>
<head>
<title>�γ�����ѧϰ����ϵͳ</title>
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript">
function check(){
	if (confirm("ɾ���γ̻Ὣ��γ̹����������ĵ�����ҵɾ��\n\n\tȷ��Ҫɾ����")){
	   return true;
	}else{
	   return false ;
	}
}
</script>
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
              <td width="40%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">�γ��������  &gt;&gt;ѡ��γ�&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;��ǰ�û���<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >�˳�ϵͳ</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<table width="96%"  border="0" cellspacing="0" cellpadding="0" height="24">
  <tr>
  	<td width="7%" height="27" align="right"><img src="../Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="13%" valign="bottom">��ѵ�γ��б�</td> 
  	<td width="80%">&nbsp;</td>     
  </tr><% session.removeAttribute("course"); %>
</table>
<table width="99%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">
	<td width="8%" bgcolor="#B2D6F1">���</td>  
	<td width="40%" bgcolor="#B2D6F1" height="30">�γ̱���</td>
	<td width="13%" bgcolor="#B2D6F1">�ڿ���ʦ</td>
	<td width="13%" bgcolor="#B2D6F1">����ʱ��</td>
	<td width="13%" bgcolor="#B2D6F1">���ʱ��</td>	
	<td width="13%" bgcolor="#B2D6F1">�������</td>	
  </tr>
	<logic:iterate id="course" name="clist" type="com.wgh.actionForm.CourseForm" scope="request" indexId="ind" >	
  <tr>
  	<td align="center">${ind+1}</td>  	
    <td align="center"><bean:write name="course" property="course" filter="true"/></td>
    <td align="center"><bean:write name="course" property="tname" filter="true"/></td>
	<td align="center"><bean:write name="course" property="start" filter="true"/></td>	
	<td align="center"><bean:write name="course" property="end" filter="true"/></td>	
	<td align="center"><html:link page="/manage/questions.do?action=questionsQuery" paramId="upid" paramName="course" paramProperty="id">�鿴</html:link></td>
  </tr>
  </logic:iterate> 
</table>
<table width="94%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
  <%   String tsrow =(String)request.getAttribute("srow").toString();
  		int srow = Integer.valueOf(tsrow);
		 String tallrow =(String)request.getAttribute("allrow").toString();
		 int allrow = Integer.valueOf(tallrow);		
		 System.out.print(srow-10);
		 java.util.HashMap newValues = new java.util.HashMap();  
	%>
	<td width="60%" height="24" align="center">��<%=allrow/10+1 %>ҳ/<%=allrow %>����¼&nbsp;&nbsp;��ǰ��<%=srow/10+1 %>ҳ&nbsp;&nbsp;
	<html:link page="/manage/questions.do?action=csQuery&srow=0">��ҳ</html:link>&nbsp;<%
		if((srow-10)>=0){
		  newValues.put("srow",srow-10);
		  pageContext.setAttribute("newValues",newValues);
  %><html:link page="/manage/questions.do?action=csQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{ %>��һҳ&nbsp;<%}
	   if((srow+10)<=allrow){
	   newValues.put("srow",srow+10);
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/questions.do?action=csQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{%>��һҳ&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/manage/questions.do?action=csQuery" name="newValues">βҳ</html:link>&nbsp;
	</td>	
	  </tr>

 	</table>
      </tr>
    </table></td>   
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
