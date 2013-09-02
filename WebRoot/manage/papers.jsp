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
			if(confirm("一并删除包含试题的试卷，确定要删除吗？")){
				formname.submit();
		}
	}
}
function check(){
	 if (confirm("您确定要删除吗？")){
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
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">课程试卷管理  &gt;&gt;试卷查询&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr><% CourseForm ctemp = (CourseForm)session.getAttribute("course");session.removeAttribute("pat"); %>
        <td align="center" valign="top">
<table width="96%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="80%" align="left">课程：<%=ctemp.getCourse() %></td> 
    <td width="7%" height="27" align="right"><img src="../Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="13%" valign="bottom"><html:link page="/manage/pAddone.jsp">添加教学试卷</html:link></td>
  </tr>
</table>
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">
  	<td width="8%" height="30" bgcolor="#B2D6F1">序号</td>
	<td width="42%" height="30" bgcolor="#B2D6F1">试卷名称</td>    
	<td width="16%" bgcolor="#B2D6F1">开始时间</td>
	<td width="11%" bgcolor="#B2D6F1">试卷状态</td>
	<td width="11%" bgcolor="#B2D6F1">试卷类型</td>
	<td width="12%" bgcolor="#B2D6F1">操作</td>
  </tr>
	<logic:iterate id="paper" name="paperQuery" type="com.wgh.actionForm.PaperForm" scope="request"  indexId="ind" >	
  <tr>
  	<td align="center">${ind+1}</td>
    <td align="center"><bean:write name="paper" property="title" filter="true"/></td>
	<td align="center"><bean:write name="paper" property="stime" filter="true"/></td>
	<td align="center"><bean:write name="paper" property="state" filter="true"/></td>
	<td align="center"><bean:write name="paper" property="type" filter="true"/></td>		
    <td align="center">
    <html:link page="/manage/paperm.do?action=paperUp" paramId="upid" paramName="paper" paramProperty="id">
    修改</html:link>
    <html:link  onclick="return check();" page="/manage/paperm.do?action=paperDel" paramId="upid" paramName="paper" paramProperty="id">
    删除</html:link></td>   
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
	<td width="94%" height="24" align="center">共<%=allrow/10+1 %>页/<%=allrow %>条记录&nbsp;&nbsp;当前第<%=srow/10+1 %>页&nbsp;&nbsp;
	<html:link page="/manage/paperm.do?action=paperQuery&srow=0">首页</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/manage/paperm.do?action=paperQuery" name="newValues">上一页</html:link>&nbsp;
	 <%}else{ %>上一页&nbsp;<%}
	   if((srow+10)<=allrow){
	   newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/paperm.do?action=paperQuery" name="newValues">下一页</html:link>&nbsp;
	 <%}else{%>下一页&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/manage/paperm.do?action=paperQuery" name="newValues">尾页</html:link>&nbsp;	 
	</td>
	<td width="40%" align="right">&nbsp;</td>	
	  </tr> 
	</table> 
      </tr>
    </table></td>   
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
