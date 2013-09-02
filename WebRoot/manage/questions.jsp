<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import="com.wgh.actionForm.*" %>
<html>
<head>
<title>课程在线学习测评系统</title>
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
//判断用户是否选择了要删除的记录，如果是，则提示“是否删除”；否则提示“请选择要删除的记录”
function checkdel(delid,formname){
	var flag = false;
	for(i=0;i<delid.length;i++){
		if(delid[i].checked){
			flag = true;
			break;
		}
	}
	if(!flag){
		alert("请选择要删除的记录！");
		return false;
		
	}else{
		if(confirm("一并删除包含该试题的试卷，确定要删除吗？")){
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
               <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">课程试题管理  &gt;&gt;试题&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<table width="96%"  border="0" cellspacing="0" cellpadding="0" height="24">
  <tr> 
  	<td width="80%">&nbsp;</td> 
    <td width="7%" height="27" align="right"><img src="../Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="13%" valign="bottom"><html:link page="/manage/questions_Add.jsp">添加课程试题</html:link></td>
  </tr>
</table>
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
<html:form  action="/manage/questions.do?action=questionsDel"  method="post">
  <tr align="center" bgcolor="#A8D8FC">	  
	<td width="6%" bgcolor="#B2D6F1" height="30">序号</td>
	<td width="60%" bgcolor="#B2D6F1" height="30">试题题目</td>
	<td width="10%" bgcolor="#B2D6F1">所属课程</td>  
	<td width="10%" bgcolor="#B2D6F1">试题类型</td>
	<td width="7%" bgcolor="#B2D6F1">修改</td>
	<td width="7%" bgcolor="#B2D6F1">选项</td>
  </tr>
   <%	
  		CourseForm ctemp = (CourseForm)session.getAttribute("course");   			
   %>  
	<logic:iterate id="questions" name="questionsQuery" type="com.wgh.actionForm.QuestionsForm" scope="request" indexId="ind" >	
  <tr>
  	<td align="center">${ind+1}</td>  	
    <td align="center"><bean:write name="questions" property="title" filter="true"/></td>
    <td align="center"><%=ctemp.getCourse() %></td>
	<td align="center"><bean:write name="questions" property="type" filter="true"/></td>	
	<td align="center"><html:link page="/manage/questions.do?action=questionsModifyQuery" paramId="upid" paramName="questions" paramProperty="ID">修改</html:link></td>
    <td align="center"><html:multibox property="delIdArray" styleClass="noborder"><bean:write name="questions" property="ID"/></html:multibox></td>
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
	<td width="60%" height="24" align="center">共<%=allrow/10+1 %>页/<%=allrow %>条记录&nbsp;&nbsp;当前第<%=srow/10+1 %>页&nbsp;&nbsp;
	<html:link page="/manage/questions.do?action=questionsQuery&srow=0">首页</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/manage/questions.do?action=questionsQuery" name="newValues">上一页</html:link>&nbsp;
	 <%}else{ %>上一页&nbsp;<%}
	   if((srow+10)<=allrow){
	   newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/questions.do?action=questionsQuery" name="newValues">下一页</html:link>&nbsp;
	 <%}else{%>下一页&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/manage/questions.do?action=questionsQuery" name="newValues">尾页</html:link>&nbsp;	 
	</td>
	<td width="40%" align="right"><input name="checkbox" type="checkbox" class="noborder" onClick="CheckAll(questionsForm.delIdArray,questionsForm.checkbox)">
	  [全选] [<a style="color:red;cursor:hand;" onclick="checkdel(questionsForm.delIdArray,questionsForm)">删除</a>]
	  <div id="ch">
		<input name="delid" type="checkbox" class="noborder" value="0">
	  </div></td>
	<!--层ch用于放置隐藏的checkbox控件，因为当表单中只是一个checkbox控件时，应用javascript获得其length属性值为undefine-->
	<script language="javascript">ch.style.display="none";</script>
	  </tr> 	
 	</html:form>
 	</table>
      </tr>
    </table></td>   
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
