<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.*"%>
<html>
<head>
<title>课程在线学习测评系统</title>
<link href="../CSS/style.css" rel="stylesheet">
<script>
function check(){
	if (confirm("您确定要开始考试吗？")){
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
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">培训课程测试  &gt;&gt;测试列表&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr><%CourseForm ctemp = (CourseForm)session.getAttribute("course"); %>
        <td align="center" valign="top">
<table width="96%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td width="40%" align="left">课程：<%=ctemp.getCourse() %></td>
    <td width="10%" height="27" align="right"><img src="../Images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="50%">教学测试试卷列表</td>
  </tr>
</table>
<table width="96%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center" bgcolor="#A8D8FC">
  	<td width="7%" bgcolor="#B2D6F1">序号</td>  
	<td width="42%" height="30" bgcolor="#B2D6F1">试卷名称</td>    
	<td width="20%" bgcolor="#B2D6F1">开始时间</td>
	<td width="8%" bgcolor="#B2D6F1">试卷状态</td>
	<td width="8%" bgcolor="#B2D6F1">试卷类型</td>
	<td width="10%" bgcolor="#B2D6F1">开始考试</td>
  </tr>
  <logic:iterate id="acmp" name="papersQuery" type="com.wgh.actionForm.PaperForm" scope="request" indexId="ind" >
  <tr>  
  	<td align="center">${ind+1}</td> 	
    <td align="center"><bean:write name="acmp" property="title" filter="true"/></td>
	<td align="center"><bean:write name="acmp" property="stime" filter="true"/></td>
	<td align="center"><bean:write name="acmp" property="state" filter="true"/></td>
	<td align="center"><bean:write name="acmp" property="type" filter="true"/></td>		
    <td align="center"><html:link  onclick="return check();" page="/student/papers.do?action=paReady" paramId="upid" paramName="acmp" paramProperty="id">开始</html:link></td>   
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
	<td colspan="6" align="right">共<%=allrow/10+1 %>页/<%=allrow %>条记录&nbsp;&nbsp;当前第<%=srow/10+1 %>页&nbsp;&nbsp;
	<html:link page="/student/papers.do?action=papersQuery&srow=0">首页</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/student/papers.do?action=papersQuery" name="newValues">上一页</html:link>&nbsp;
	 <%}else{ %>上一页&nbsp;<%}
	   if((srow+10)<=allrow){
	   newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/student/papers.do?action=papersQuery" name="newValues">下一页</html:link>&nbsp;
	 <%}else{%>下一页&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/student/papers.do?action=papersQuery" name="newValues">尾页</html:link>&nbsp;	 
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
