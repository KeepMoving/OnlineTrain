<%@ page contentType="text/html; charset=gb2312" language="java" import="com.wgh.actionForm.*,java.util.*"  errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html>
<head>
<title>课程在线学习测评系统</title>
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript" src="../JS/AjaxRequest.js">
</script>
</head>
<script language="javascript">

function checkForm(form){	
	if(form.start.value==""){
		alert("请输入开课时间!");form.start.focus();return false;
	}
	if(form.end.value==""){
		alert("请输入结课时间!");form.end.focus();return false;
	}
	if(form.infor.value==""){
		alert("请输入课程描述信息!");form.infor.focus();return false;
	}	
	if(confirm("您确定输入的信息准确吗？"))
	{
		return true;
	}else{
		return false;
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
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">培训课程管理>>课程修改</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
          	</tr>
          </table></td>
        </tr>
      <tr>
     <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="90%">&nbsp;</td>
</tr>
</table> 
<html:form action="/manage/courses.do?action=courUpdo" method="post" onsubmit="return checkForm(this)">
<%	
  		CourseForm ctemp = (CourseForm)request.getAttribute("course");   			
   %> 
  <table width="98%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
   <tr align="center">
    <td width="20%" height="30" align="right" style="padding:5px;">课程标题：</td>
    <td width="80%" align="left">
      <input type="text" name="course" size="40" value="<%=ctemp.getCourse() %>" readonly="true"/> *
      <input type="hidden" name="id" value="<%=ctemp.getId() %>" />
	  </td>
    </tr>
   <tr align="center">
    <td width="20%" height="30" align="right" style="padding:5px;">授课老师：</td>
    <td width="80%" align="left"><%String tname =(String)session.getAttribute("manager");  %>
     <input type="text" name="tname" size="40" value="<%=tname %>" readonly="true" /> *
	  </td>
    </tr>
    <tr align="center">
    <td width="15%" height="30" align="right" style="padding:5px;">开课时间：</td>
    <td width="85%" align="left">
     <input type="text" name="start" size="40" value="<%=ctemp.getStart() %>" /> *&nbsp;格式如：2010-11-13 *
	  </td>
    </tr>	
    <tr align="center">
    <td width="15%" height="30" align="right" style="padding:5px;">结课时间：</td>
    <td width="85%" align="left">
      <input type="text" name="end" size="40" value="<%=ctemp.getEnd() %>"/> *&nbsp;格式如：2010-11-13 *
	  </td>
    </tr>
    <td width="15%" height="190" style="padding:5px;" valign="top" align="right">课程描述：</td>
    <tr>
    <td class="altbg2" >
					<textarea name="infor" style="width : 98%; height : 99%" ><%=ctemp.getInfor() %></textarea>*</td>	 
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><html:submit property="submit" styleClass="btn_grey" value="修改"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="重置"/>
		&nbsp;
		<html:button property="button" styleClass="btn_grey" value="返回" onclick="history.back(-1)"/></td>
    </tr>
</table>
</html:form>
</td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
