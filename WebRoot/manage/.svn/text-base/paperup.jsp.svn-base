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
	if(form.title.value==""){
		alert("请输入试卷标题!");form.title.focus();return false;
	}
	if(form.stime.value==""){
		alert("请输入考试时间!");form.stime.focus();return false;
	}
	if(form.alltime.value==""){
		alert("请输入考试用时!");form.alltime.focus();return false;
	}
	if(form.single.value==""){
		alert("请输入单选题分数!");form.single.focus();return false;
	}
	if(form.more.value==""){
		alert("请输入多选题分数!");form.more.focus();return false;
	}
	if(confirm("您确定修改的信息准确吗？"))
	{
		return true;
	}else{
		return false;}
	
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
               <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">教学试卷管理>>试卷修改</span></td>
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
<html:form action="/manage/paperm.do?action=pModify" method="post" onsubmit="return checkForm(paperForm)">
<bean:define id="defaultOption" name="paperUp" property="type" type="String"/>
  <table width="90%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
     <tr align="center">
    <td width="20%" height="30" align="right" style="padding:5px;">试卷标题：</td>
    <td width="80%" align="left"> <html:hidden property="id" name="paperUp"/>
      <html:text property="title" name="paperUp" size="40" /> *
	  </td>
    </tr>
    <tr>
    <td height="30" align="right" style="padding:5px;">试卷类型：</td>
    <td align="left">
    <select name="type" >
    	<option value="竞赛试卷" >竞赛试卷
    	<option value="测试试卷" >测试试卷
		<option value="练习试卷" >练习试卷
	 </select>	
     </td>     
    </tr>
    <tr>
    <td height="30" align="right" style="padding:5px;">试卷状态：</td>
    <td align="left">
    <select name="state">		
		<option value="等待中" >等待中
		<option value="进行中" >进行中
		<option value="已结束" >已结束	
	 </select>	  	
     </td>     
    </tr>
    <tr align="center">
    <td width="15%" height="30" align="right" style="padding:5px;">单选题分数：</td>
    <td width="85%" align="left">
      <html:text property="single" name="paperUp" size="40"/> *
	  </td>
    </tr>
    <tr align="center">
    <td width="15%" height="30" align="right" style="padding:5px;">多选题分数：</td>
    <td width="85%" align="left">
      <html:text property="more" name="paperUp" size="40"/> *
	  </td>
    </tr>    
    <tr align="center">
    <td width="15%" height="30" align="right" style="padding:5px;">考试时间：</td>
    <td width="85%" align="left">
      <html:text property="stime" name="paperUp" size="30"/> *&nbsp;格式如：2010-05-10 09:30:00 *
	  </td>
    </tr>	
    <tr align="center">
    <td width="15%" height="30" align="right" style="padding:5px;">考试用时：</td>
    <td width="85%" align="left">
      <html:text property="alltime" name="paperUp" size="30"/> *&nbsp;格式如：01:30:00&nbsp;即90分钟 *
	  </td>
    </tr>    
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><html:submit property="submit" styleClass="btn_grey" value="提交"/>
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
