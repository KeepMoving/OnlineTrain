<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>课程在线学习测评系统</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/ContentLoader.js">
</script>
</head>
<script language="javascript">
function checkForm(form){
	if(form.userid.value==""){
		alert("请输入用户ID!");form.authorid.focus();return false;
	}
	if(form.userid.value==""){
		alert("请输入用户编号!");form.studentid.focus();return false;
	}
	if(form.name.value==""){
		alert("请输入用户姓名!");form.name.focus();return false;
	}
	if(form.password1.value==""){
		alert("请输入登录密码!");form.password1.focus();return false;
	}
	if(form.password1.value.length<6 || form.password1.value.length>20){
		alert("您输入的密码不合法，密码必须大于6位，并且小于等20位!");form.password1.focus();return false;
	}
	if(form.password2.value==""){
		alert("请确认登录密码!");form.password2.focus();return false;
	}		
	if(form.password1.value!=form.password2.value){
		alert("您两次输入的登录密码不一致，请重新输入!");form.password1.focus();return false;
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
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="131" background="Images/top_bg.jpg">
  <div align=center><font color=#ffd700 size=2></font>&nbsp;</div>
    <div align=center><font face=隶书 color=#ffd700 size=7>课程在线学习测评系统</font></div>
    <div align=center><font color=#ffd700 size=2></font>&nbsp;</div>
</td>
  </tr>
</table>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="word_grey">&nbsp;<img src="Images/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">用户注册 &gt;&gt;&gt;</span></td>
			  <td align="right"><img src="Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/index.jsp" >返回首页</html:link>&nbsp;</td>
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
<html:form action="/manage/student.do?action=studentAdd" method="post" onsubmit="return checkForm(studentForm)">
  <table width="70%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr>
    <td height="30" align="left" style="padding:5px;">用&nbsp;户&nbsp;ID：</td>
    <td align="left">
	 <html:text property="authorid" size="20"/><font color="red"> （用户登陆时使用，请牢记，建议使用英文）*</font></td>
    </tr>
  <tr>
    <td height="30" align="left" style="padding:5px;">学&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
    <td align="left">
	 <html:text property="studentid" size="20"/> *</td>
    </tr>
   <tr>
    <td height="30" align="left" style="padding:5px;">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
    <td align="left">
	 <html:text property="name" size="20"/> *</td>
    </tr>
   <tr>
    <td height="30" align="left" style="padding:5px;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
    <td align="left"><html:password styleId="password1" property="pwd" size="20"/>（密码由6到20位的数字或字母组成） *     </td>
    </tr>
  <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">确认密码：</td>
    <td width="84%" align="left">
      <html:password styleId="password2" property="pwd" size="20"/> *	  </td>
    </tr>    
    <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">提示问题：</td>
    <td width="84%" align="left">
      <html:text property="question" size="40"/>（如我的生日） *	  </td>
    </tr>
	  <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">问题答案：</td>
    <td width="84%" align="left">
      <html:text property="answer" size="40"/> （如7月17日）*</td>
    </tr>
	  <tr align="center">
    <td width="16%" height="30" align="left" style="padding:5px;">联系方式：</td>
    <td width="84%" align="left">
      <html:text property="contact" size="40"/>（电话或者E-mail）*</td>
    </tr>	
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><html:submit property="submit" styleClass="btn_grey" value="保存"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="取消"/>
		&nbsp;
		<html:button property="button" styleClass="btn_grey" value="返回" onclick="window.location.href='index.jsp'"/>		</td>
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
