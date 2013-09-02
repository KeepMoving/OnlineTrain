<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>课程在线学习测评系统</title>
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript">
function checkForm(form){
	if(form.name.value==""){
		alert("请输入考生姓名!");form.name.focus();return false;
	}
	if(form.oldpwd1.value==""){
		alert("请输入的原密码!");form.oldpwd1.focus();return false;
	}
	if(form.oldpwd1.value!=form.holdpwd.value){
		alert("您输入的原密码不正确，请重新输入!");form.oldpwd1.value="";
		form.oldpwd1.focus();return false;
	}
	if(form.newpwd.value==""){
		alert("请输入的新密码!");form.newpwd.focus();return false;
	}	
	if(form.newpwd1.value==""){
		alert("请确认新密码!");form.newpwd1.focus();return false;
	}	
	if(form.newpwd.value!=form.newpwd1.value){
		alert("您两次输入的新密码不一致，请重新输入!");
		form.newpwd.value="";form.newpwd1.value="";
		form.newpwd.focus();return false;
	}
	if(form.question.value==""){
		alert("请输入提示问题!");form.question.focus();return false;
	}
	if(form.answer.value==""){
		alert("请输入问题答案!");form.answer.focus();return false;
	}
	if(form.contact.value==""){
		alert("请输入联系方式!");form.contact.focus();return false;
	}
}
</script>
</head>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%><br></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">修改用户信息  &gt;&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top"> 
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td width="84%">&nbsp;      </td>
		   </tr>
		</table> 
		<html:form action="/manage/student.do?action=studentModify" method="post" onsubmit="return checkForm(studentForm)">		
		  <table width="90%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
		<logic:iterate id="modifyStu" name="studentQuery" type="com.wgh.actionForm.StudentForm" scope="request">
		  <tr align="center">
		    <td width="16%" height="30" align="left" style="padding:5px;">用户ID：</td>
		    <td width="84%" align="left">		      
		      <html:text property="authorid" size="20" name="modifyStu" readonly="true"/> <span class="word_orange1"> （只读）</span></td>
		    </tr>	
		  <tr>
		    <td height="30" align="left" style="padding:5px;">用户姓名：</td>
		    <td align="left">			
			<html:text property="name" size="20" name="modifyStu" /></td>
		    </tr>
		  <tr>
		    <td align="left" style="padding:5px;">原&nbsp;密&nbsp;码：</td>
		    <td align="left"><html:password styleId="oldpwd1" property="oldpwd" size="20"/> *
		      <html:hidden styleId="holdpwd" property="oldpwd"  name="modifyStu" /></td>
		    </tr>
		    <tr>
		    <td height="30" align="left" style="padding:5px;">新&nbsp;密&nbsp;码：</td>
		    <td align="left"><html:password styleId="newpwd" property="pwd" size="20"/>（密码由6到20位的数字或字母组成） *     </td>
		    </tr>
		  <tr align="center">
		    <td width="20%" height="30" align="left" style="padding:5px;">确认新密码：</td>
		    <td width="80%" align="left">
		      <html:password styleId="newpwd1" property="pwd" size="20"/> *	  </td>
		    </tr>    
		  <tr align="center">
		    <td width="20%" height="30" align="left" style="padding:5px;">提示问题：</td>
		    <td width="80%" align="left">
		      <html:text property="question" size="40" name="modifyStu"/>（如我的生日） *	  </td>
		    </tr>
		  <tr align="center">
		    <td width="20%" height="30" align="left" style="padding:5px;">问题答案：</td>
		    <td width="80%" align="left">
		      <html:text property="answer" size="40" name="modifyStu"/> （如7月17日）*</td>
		    </tr>
		  <tr align="center">
		    <td width="16%" height="30" align="left" style="padding:5px;">联系方式：</td>
		    <td width="84%" align="left">
		      <html:text property="contact" size="40" name="modifyStu"/>（电话或者E-mail）
		    </tr>
		  </logic:iterate>	
		  <tr>
		      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
		      <td><html:submit property="submit" styleClass="btn_grey" value="保存"/>&nbsp;
		        <html:reset property="reset" styleClass="btn_grey" value="重置"/>&nbsp;
				<html:button property="button" styleClass="btn_grey" value="返回"  onclick="history.back(-1)"/>
				</td>
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
