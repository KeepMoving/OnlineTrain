<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>课程在线学习测评系统</title>
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
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">课程成绩查询</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>      
      <tr>
        <td align="center" valign="top">
        <table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
		<html:form action="/manage/paResultIf.do?action=paResultsQuery" method="post">	
          <tr>
            <td align="left" valign="middle">&nbsp;查询条件：
	          <html:select property="queryIf">
		<html:option value="userid">用户ID</html:option>
		<html:option value="patitle">竞赛名称</html:option>		
	 </html:select>
	 &nbsp;关键字：
	 <html:text property="key"/>&nbsp;&nbsp;
	 <html:submit property="submit" styleClass="btn_grey" value="查询"/></td>
          </tr>
		  </html:form>
        </table>
				
		<table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center">
  	<td width="6%" height="27" bgcolor="#B2D6F1">序号</td>
    <td width="20%" height="27" bgcolor="#B2D6F1">试卷名称</td>
    <td width="20%" height="27" bgcolor="#B2D6F1">所属课程</td>
	<td width="10%" bgcolor="#B2D6F1">姓名</td>
	<td width="7%" bgcolor="#B2D6F1">单选</td>
	<td width="7%" bgcolor="#B2D6F1">多选</td>
	<td width="7%" bgcolor="#B2D6F1">总分</td>
    <td width="24%" bgcolor="#B2D6F1">提交时间</td>
  </tr>
	<logic:iterate id="stuResult" name="stuResultQuery" type="com.wgh.actionForm.PaResultForm" scope="request"indexId="ind" >	
  <tr>
  	<td align="center">${ind+1}</td>  
    <td style="padding:5px;"><bean:write name="stuResult" property="patitle" filter="true"/></td>	
	<td align="center"><bean:write name="stuResult" property="course" filter="true"/></td>
	<td style="padding:5px;"><bean:write name="stuResult" property="userid" filter="true"/></td>
	<td align="center"><bean:write name="stuResult" property="sscore" filter="true"/></td>
	<td align="center"><bean:write name="stuResult" property="mscore" filter="true"/></td>
    <td align="center"><bean:write name="stuResult" property="allscore" filter="true"/></td>
    <td align="center"><bean:write name="stuResult" property="subtime" filter="true"/></td>
  </tr>
  </logic:iterate> 
   <tr>
  <%   
  		String tsrow =(String)request.getAttribute("srow").toString();
  		int srow = Integer.valueOf(tsrow);
		 String tallrow =(String)request.getAttribute("allrow").toString();
		 int allrow = Integer.valueOf(tallrow);		
		 System.out.print(srow-10);
		 java.util.HashMap newValues = new java.util.HashMap();  
	%>
	<td colspan="8" height="24" align="center">共<%=allrow/10+1 %>页/<%=allrow %>条记录&nbsp;&nbsp;当前第<%=srow/10+1 %>页&nbsp;&nbsp;
	<html:link page="/manage/paResultIf.do?action=paResultsQuery&srow=0">首页</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/manage/paResultIf.do?action=paResultsQuery" name="newValues">上一页</html:link>&nbsp;
	 <%}else{ %>上一页&nbsp;<%}
	   if((srow+10)<=allrow){
	   newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/paResultIf.do?action=paResultsQuery" name="newValues">下一页</html:link>&nbsp;
	 <%}else{%>下一页&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/manage/paResultIf.do?action=paResultsQuery" name="newValues">尾页</html:link>&nbsp;	 
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
