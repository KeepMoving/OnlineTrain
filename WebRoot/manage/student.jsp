<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>�γ�����ѧϰ����ϵͳ</title>
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript">
function CheckAll(elementsA,elementsB){
	for(i=0;i<elementsA.length;i++){
		elementsA[i].checked = true;
	}
	if(elementsB.checked ==false){
		for(j=0;j<elementsA.length;j++){
			elementsA[j].checked = false;
		}
	}
}
//�ж��û��Ƿ�ѡ����Ҫɾ���ļ�¼������ǣ�����ʾ���Ƿ�ɾ������������ʾ����ѡ��Ҫɾ���ļ�¼��
function checkdel(delid,formname){
	var flag = false;
	for(i=0;i<delid.length;i++){
		if(delid[i].checked){
			flag = true;
			break;
		}
	}
	if(!flag){
		alert("��ѡ��Ҫɾ���ļ�¼��");
		return false;
	}else{
			if(confirm("ȷ��Ҫɾ����")){
				formname.submit();
		}
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
               <td width="40%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">�û���Ϣ����  &gt;&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;��ǰ�û���<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/index.jsp" >�˳�ϵͳ</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<html:form action="/manage/student.do?action=studentDel" method="post">
&nbsp;
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">
    <td width="15%" height="26" bgcolor="#B2D6F1">�û�ID</td>
    <td width="30%" bgcolor="#B2D6F1">ѧ��</td>
	<td width="15%" bgcolor="#B2D6F1">����</td>
	<td width="30%" bgcolor="#B2D6F1">��ϵ��ʽ</td>	
    <td width="10%" bgcolor="#B2D6F1">ѡ��</td>
  </tr>
	<logic:iterate id="student" name="studentQuery" type="com.wgh.actionForm.StudentForm" scope="request">
  <tr>
 	<td align="center"><bean:write name="student" property="authorid" filter="true"/></td> 
 	<td align="center"><bean:write name="student" property="studentid" filter="true"/></td>
    <td align="center"><bean:write name="student" property="name" filter="true"/></td>	
    <td align="center"><bean:write name="student" property="contact" filter="true"/></td>
    <td align="center"><html:multibox property="delIdArray" styleClass="noborder"><bean:write name="student" property="id"/></html:multibox></td>
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
	<html:link page="/manage/student.do?action=studentQuery&srow=0">��ҳ</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/manage/student.do?action=studentQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{ %>��һҳ&nbsp;<%}
	   if((srow+10)<=allrow){
	   newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/student.do?action=studentQuery" name="newValues">��һҳ</html:link>&nbsp;
	 <%}else{%>��һҳ&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/manage/student.do?action=studentQuery" name="newValues">βҳ</html:link>&nbsp;	 
	</td>
	<td width="40%" align="right"><input name="checkbox" type="checkbox" class="noborder" onClick="CheckAll(studentForm.delIdArray,studentForm.checkbox)">
	  [ȫѡ/��ѡ] [<a style="color:red;cursor:hand;" onClick="checkdel(studentForm.delIdArray,studentForm)">ɾ��</a>]
	  <div id="ch">
		<input name="delid" type="checkbox" class="noborder" value="0">
	  </div></td>
	<!--��ch���ڷ������ص�checkbox�ؼ�����Ϊ������ֻ��һ��checkbox�ؼ�ʱ��Ӧ��javascript�����length����ֵΪundefine-->
	<script language="javascript">ch.style.display="none";</script>
  </tr>
</table>
</html:form></td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
