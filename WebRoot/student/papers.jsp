<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.*"%>
<html>
<head>
<title>�γ�����ѧϰ����ϵͳ</title>
<link href="../CSS/style.css" rel="stylesheet">
<script>
function check(){
	if (confirm("��ȷ��Ҫ��ʼ������")){
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
              <td width="40%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">��ѵ�γ̲���  &gt;&gt;�����б�&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;��ǰ�û���<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >�˳�ϵͳ</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr><%CourseForm ctemp = (CourseForm)session.getAttribute("course"); %>
        <td align="center" valign="top">
<table width="96%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td width="40%" align="left">�γ̣�<%=ctemp.getCourse() %></td>
    <td width="10%" height="27" align="right"><img src="../Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="50%">��ѧ�����Ծ��б�</td>
  </tr>
</table>
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">
  	<td width="7%" bgcolor="#B2D6F1">���</td>  
	<td width="42%" height="30" bgcolor="#B2D6F1">�Ծ�����</td>    
	<td width="20%" bgcolor="#B2D6F1">��ʼʱ��</td>
	<td width="8%" bgcolor="#B2D6F1">�Ծ�״̬</td>
	<td width="8%" bgcolor="#B2D6F1">�Ծ�����</td>
	<td width="10%" bgcolor="#B2D6F1">��ʼ����</td>
  </tr>
  <logic:iterate id="acmp" name="papersQuery" type="com.wgh.actionForm.PaperForm" scope="request" indexId="ind" >
  <tr>  
  	<td align="center">${ind+1}</td> 	
    <td align="center"><bean:write name="acmp" property="title" filter="true"/></td>
	<td align="center"><bean:write name="acmp" property="stime" filter="true"/></td>
	<td align="center"><bean:write name="acmp" property="state" filter="true"/></td>
	<td align="center"><bean:write name="acmp" property="type" filter="true"/></td>		
    <td align="center"><html:link  onclick="return check();" page="/student/papers.do?action=paReady" paramId="upid" paramName="acmp" paramProperty="id">��ʼ</html:link></td>   
   </tr>
  </logic:iterate> 
<tr>  
  <%   String tsrow =(String)request.getAttribute("srow").toString();
  		int srow = Integer.valueOf(tsrow);
		 String tallrow =(String)request.getAttribute("allrow").toString();
		 int allrow = Integer.valueOf(tallrow);		
		 System.out.print(srow-10);		 
		 java.util.HashMap newValues = new java.util.HashMap();  
	%>
	<td colspan="6" align="right">��<%=allrow/10+1 %>ҳ/<%=allrow %>����¼&nbsp;&nbsp;��ǰ��<%=srow/10+1 %>ҳ&nbsp;&nbsp;
	<html:link page="/student/papers.do?action=papersQuery&srow=0">��ҳ</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/student/papers.do?action=papersQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{ %>��һҳ&nbsp;<%}
	   if((srow+10)<=allrow){
	   newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/student/papers.do?action=papersQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{%>��һҳ&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/student/papers.do?action=papersQuery" name="newValues">βҳ</html:link>&nbsp;	 
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