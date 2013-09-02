<%@ page contentType="text/html; charset=gb2312" language="java" import="com.wgh.actionForm.*,java.util.*"  errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>课程在线学习测评系统</title>
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript" src="../JS/AjaxRequest.js">
</script>
</head>
<script language="javascript">
function modi(ttid){
    var form = document.getElementById("form");
    var tm = document.getElementById(ttid);     
	if(confirm("您确定要修改分数吗？")){
		form.tid.value=ttid;
		form.mark.value=tm.value;
		form.submit();
	}else{
		location.reload();
	}
}
</script>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%><br></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="24" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">培训课程管理  &gt;&gt;管理</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
   <%	
  		CourseForm ctemp = (CourseForm)session.getAttribute("course");   			
   %>  
  <table width="96%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">	
   <tr>    
    <td align="center" colspan="4" height="30"><font style="color:Blue;font-size:Large;"><%=ctemp.getCourse() %></font></td>    
   </tr>
   <tr align="center" >
    <td colspan="4" align="center" >开课时间：<%=ctemp.getStart() %>&nbsp;&nbsp;&nbsp;结课时间：<%=ctemp.getEnd() %>
    	</td>
  	</tr>
  <tr>
    <td colspan="4">
  		<p><%=ctemp.getInfor()%></p>
    </td>    
  </tr>
  <tr align="center" >
    <td colspan="4" align="center" >&nbsp;&nbsp;&nbsp</td>
  	</tr>
  <tr>
      <td colspan="4">
      <form id="form" name="form" method="post" action="/OnlineTrain/manage/courses.do?action=tasksUp" ENCTYPE="multipart/form-data">
      <table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">		 
		 <tr>
			 <td colspan="6" height="30">培训课程作业提交列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button onclick="window.location.href='/OnlineTrain/manage/courses.do?action=coursesMan&srow=0&upid=<%=ctemp.getId() %>'">查看课程文档</button>
			 </td>
		 </tr>
		 <tr> 
		 	<td align="center" width="9%" height="30" bgcolor="#B2D6F1">序号</td>    
			<td align="center" width="40%" bgcolor="#B2D6F1">文件标题</td>
			<td align="center" width="15%" bgcolor="#B2D6F1">上传人</td>
			<td align="center" width="15%" bgcolor="#B2D6F1">上传时间</td>
			<td align="center" width="10%" bgcolor="#B2D6F1">下载</td>
			<td align="center" width="11%" bgcolor="#B2D6F1">打分</td><input type="hidden" name="tid"/><input type="hidden" name="mark"/>
		  </tr>	
		  <%
		   		List cl = (ArrayList)request.getAttribute("tlist");
		   		Iterator it = cl.iterator();
		   		int i = 1;
		   		while(it.hasNext()){
		   			TaskForm tf = (TaskForm)it.next();
		   %>
		  <tr>
		    <td align="center"><%=i %></td>
		    <td align="center"><a href="downloadt.jsp?url=<%=tf.getUrl() %>"><%=tf.getName() %></a></td>
		    <td align="center"><%=tf.getStudent() %></td>
		    <td align="center" ><%=tf.getTime() %></td>
		    <td align="center"><a href="downloadt.jsp?url=<%=tf.getUrl() %>">下载</a></td>
			<td align="center"><input type="text" id="<%=tf.getId() %>" style="border:0px solid"  width="8" value="<%=tf.getMark() %>" onchange="modi(<%=tf.getId() %>)"/></td>			
		  </tr><%
		  	i++;
		 }
		 String tsrow =(String)request.getAttribute("srow").toString();
  		 int srow = Integer.valueOf(tsrow);
  		 String tallrow =(String)request.getAttribute("allrow").toString();
		 int allrow = Integer.valueOf(tallrow);
		 System.out.println("srow:"+srow+" allrow:"+allrow);
		 java.util.HashMap newValues = new java.util.HashMap();
		 newValues.put("upid",ctemp.getId());
		 %>
		 <tr>
		 <td colspan="6" height="24" align="center">共<%=allrow/10+1 %>页/<%=allrow %>条记录&nbsp;&nbsp;当前第<%=srow/10+1 %>页&nbsp;&nbsp;
	<html:link page="/manage/courses.do?action=tasksMan&srow=0">首页</html:link>&nbsp;<%
		if((srow-10)>=0){
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);
  %><html:link page="/manage/courses.do?action=tasksMan" name="newValues">上一页</html:link>&nbsp;
	 <%}else{ %>上一页&nbsp;<%}
	   if((srow+10)<=allrow){
	   	  newValues.put("srow",srow+10);
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/courses.do?action=tasksMan" name="newValues">下一页</html:link>&nbsp;
		 <%}else{%>下一页&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues);
	 %><html:link page="/manage/courses.do?action=tasksMan" name="newValues">尾页</html:link>&nbsp;	 
	</td><input type="hidden" name="srow" value="<%=srow %>" />
	</tr>	 
	</table>
	</form>
		<table width="96%"  border="0" cellspacing="0" cellpadding="0" height="20">
  <tr> 
  	<td width="80%">&nbsp;</td> 
    <td width="7%" height="27" align="right">&nbsp;</td>
    <td width="13%" valign="bottom">&nbsp;</td>
  </tr>
</table>
     </td>      
    </tr>
</table>
</td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
