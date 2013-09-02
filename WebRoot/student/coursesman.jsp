<%@ page contentType="text/html; charset=gb2312" language="java" import="com.wgh.actionForm.*,java.util.*"  errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>课程在线学习测评系统</title>
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function checkForm(){
	 if (confirm("你确定要删除吗？")){
	   return true;
	  }else{
	   return false ;
	  }
}
function modi(){
    var form = document.getElementById("form");
    var file = document.getElementById("file1");
	if(confirm("您确定要添加文件吗？")){
		form.submit();
	}else{
		file.value="";
	}
}
</script>	
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="24" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">培训课程学习  &gt;&gt;查看</span></td>
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
      <form id="form" name="form" method="post" action="uploaddo.jsp" ENCTYPE="multipart/form-data">
      <table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#67A8DB">		 
		 <tr>
			 <td colspan="5" height="30">培训课程内容文件列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button onclick="window.location.href='/OnlineTrain/student/course.do?action=tasksMan&srow=0&upid=<%=ctemp.getId() %>'">管理作业</button>
			 </td>
		 </tr>
		 <tr> 
		 	<td align="center" width="5%" height="30" bgcolor="#B2D6F1">序号</td>    
			<td align="center" width="37%" bgcolor="#B2D6F1">文件标题</td>
			<td align="center" width="10%" bgcolor="#B2D6F1">上传时间</td>
			<td align="center" width="10%" bgcolor="#B2D6F1">指导老师</td>
			<td align="center" width="7%" bgcolor="#B2D6F1">下载</td>
						
		  </tr>		 
		  <%
		   		List cl = (ArrayList)request.getAttribute("celist");
		   		Iterator it = cl.iterator();
		   		int i = 1;
		   		while(it.hasNext()){
		   			CourDeForm cdf = (CourDeForm)it.next();
		   %>
		  <tr>		  	
		    <td align="center"><%=i %></td>
		    <td align="center"><a href="downloadcd.jsp?url=<%=cdf.getUrl() %>"><%=cdf.getFname() %></a></td>
		    <td align="center"><%=cdf.getFtime() %></td>
		    <td align="center"><%=ctemp.getTname() %></td>	
		    <td align="center"><a href="downloadcd.jsp?url=<%=cdf.getUrl() %>">下载</a></td>
						
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
		 <td colspan="5" height="24" align="center">共<%=allrow/10+1 %>页/<%=allrow %>条记录&nbsp;&nbsp;当前第<%=srow/10+1 %>页&nbsp;&nbsp;
	<html:link page="/student/course.do?action=coursesMan&srow=0">首页</html:link>&nbsp;<%
		if((srow-10)>=0){		 
		  newValues.put("srow",srow-10);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/student/course.do?action=coursesMan" name="newValues">上一页</html:link>&nbsp;
	 <%}else{ %>上一页&nbsp;<%}
	   if((srow+10)<=allrow){
	   	  newValues.put("srow",srow+10);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/student/course.do?action=coursesMan" name="newValues">下一页</html:link>&nbsp;
	 <%}else{%>下一页&nbsp;<%} newValues.put("srow",(allrow/10)*10);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/student/course.do?action=coursesMan" name="newValues">尾页</html:link>&nbsp;	 
	</td>
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
