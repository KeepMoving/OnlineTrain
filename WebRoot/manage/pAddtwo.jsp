<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import="com.wgh.actionForm.QuestionsForm"%>
<%@ page import="java.util.*"%>
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
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">教学试卷管理>>试卷添加 </span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<table width="96%"  border="0" cellspacing="0" cellpadding="0">
  <tr> 
  	<td width="40%">&nbsp;</td> 
    <td width="7%" height="20" align="right"><img src="../Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="53%" valign="bottom">为试卷添加单选题 </td>
  </tr>
</table>
<html:form action="/manage/paperm.do?action=pAddtwo&srow=0" method="post">
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">	  
	<td width="60%" bgcolor="#B2D6F1" height="30">试题题目</td>
	<td width="10%" bgcolor="#B2D6F1">试题答案</td>  
	<td width="10%" bgcolor="#B2D6F1">试题类型</td>
	<td width="10%" bgcolor="#B2D6F1">查看</td>
	<td width="10%" bgcolor="#B2D6F1">选项</td>
  </tr>  
  <%
		List lists = (List)request.getAttribute("questionsQuery");	
		Iterator it = lists.iterator();	
		if(it.hasNext()){
	 	   	while (it.hasNext()) {
   			QuestionsForm temps = (QuestionsForm) it.next(); 			   		
	   %>		
		  <tr>  	
		    <td align="center"><%=temps.getTitle() %></td>
		    <td align="center"><%=temps.getAnswer() %></td>
			<td align="center"><%=temps.getType() %></td>
			<% java.util.HashMap newValues = new java.util.HashMap();
				newValues.put("upid",temps.getID());  		  
		  		pageContext.setAttribute("newValues",newValues); 
			 %>	
			<td align="center"><html:link page="/manage/questions.do?action=questionsViewQuery" name="newValues">查看</html:link></td>
		    <td align="center"><input type="checkbox" name="singles" border="no" value="<%=temps.getID() %>"/></td>
		  </tr>
		 <%
		   }
		 }
		  %> 			
	</table>	
	<table width="94%"  border="0" cellspacing="0" cellpadding="0">
  	<tr>  
	<td width="96%" height="24" align="center">
	<html:submit property="submit" styleClass="btn_grey" value="下一步"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="重置"/>
	</td>
	
	</table>
 		</html:form>
      </tr>
    </table></td>   
  </tr>
</table>    
<%@ include file="copyright.jsp"%>
</body>
</html>
