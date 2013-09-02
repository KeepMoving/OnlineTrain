<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.actionForm.*"%>
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
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">课程竞赛成绩管理  &gt;&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
      <tr>
        <td align="center" valign="top">
        <table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
		<html:form action="/manage/queryResultIf.do?action=stuResultQuery" method="post">
          <tr>
            <td align="left" valign="middle">&nbsp;查询条件：
	          <html:select property="queryIf">
		<html:option value="userid">用户ID</html:option>
		<html:option value="ptitle">竞赛名称</html:option>		
	 </html:select>
	 &nbsp;关键字：
	 <html:text property="key"/>&nbsp;&nbsp;
	 <html:submit property="submit" styleClass="btn_grey" value="查询"/>&nbsp;&nbsp;
	 <html:submit property="submit" styleClass="btn_grey" value="排名"/></td>
          </tr>
		  </html:form>
        </table>
				
		<table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">
  <tr align="center">
    <td width="20%" height="27" bgcolor="#B2D6F1">竞赛名称</td>
	<td width="10%" bgcolor="#B2D6F1">用户ID</td>
	<td width="10%" bgcolor="#B2D6F1">竞赛名次</td>
	<td width="10%" bgcolor="#B2D6F1">正确/全部</td>	
	<td width="12%" bgcolor="#B2D6F1">竞赛用时(M)</td>
    <td width="13%" bgcolor="#B2D6F1">代码长度(KB)</td>
    <td width="25%" bgcolor="#B2D6F1">提交时间</td>
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
	<td colspan="7" height="24" align="center">共<%=allrow/10+1 %>页/<%=allrow %>条记录&nbsp;&nbsp;当前第<%=srow/10+1 %>页&nbsp;&nbsp;
	<html:link page="/manage/queryResultIf.do?action=stuResultQuery&srow=0">首页</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/manage/queryResultIf.do?action=stuResultQuery" name="newValues">上一页</html:link>&nbsp;
	 <%}else{ %>上一页&nbsp;<%}
	   if((srow+10)<=allrow){
	   	  newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/queryResultIf.do?action=stuResultQuery" name="newValues">下一页</html:link>&nbsp;
	 <%}else{%>下一页&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/manage/queryResultIf.do?action=stuResultQuery" name="newValues">尾页</html:link>&nbsp;	 
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
