<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
<title>课程在线学习测评系统</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript">
function check(form){
	if (form.name.value==""){
		alert("请输入用户名!");form.name.focus();return false;
	}
	if (form.pwd.value==""){
		alert("请输入密码!");form.pwd.focus();return false;
	}
}
</script>   
</head>    
<%   
	Enumeration enumer = session.getAttributeNames();
	while(enumer.hasMoreElements()){
		String name=(String)enumer.nextElement();
		System.out.println(name);
		session.removeAttribute(name);		
	}
	
 %>
<body>
<table width="778" height="266" border="0" align="center" cellpadding="0" cellspacing="0" background="Images/login_top.jpg">
<tr>
 
    <td height="100">
    
     <div align=center><font color=#ffd700 size=2></font>&nbsp;</div>
    <div align=center><font face=隶书 color=#ffd700 size=8>课程在线学习测评系统</font></div>
    <div align=center><font color=#ffd700 size=2></font>&nbsp;</div>
     <div align=center><font color=#ffd700 size=2></font>&nbsp;</div>
   <div align=center><font color=#ffd700 size=2></font>&nbsp;</div>
   </td>
</tr>
</table>
<table width="778" height="158"  border="0" align="center" cellpadding="0" cellspacing="0" background="Images/login_mid.jpg">
<html:form action="manage/student.do?action=login" method="post" focus="ID" onsubmit="return check(studentForm)">
          <tr>
            <td>				  
                <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
                        <tr>
						<td>&nbsp;</td>
						<td></td>
						<td></td>
						</tr>
						<tr>
                          <td width="35%" height="30">&nbsp;</td>
                       <td height="30">用&nbsp;户&nbsp;ID：</td>
                      <td width="27%">
					   <html:text property="authorid" styleClass="logininput" size="25"/></td>
                      <td width="29%">&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="30">&nbsp;</td>
                      <td height="30">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                      <td><html:password property="pwd" styleClass="logininput" size="25"/></td>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="31">&nbsp;</td>
                      <td height="31" colspan="2" align="left"><html:submit styleClass="btn_grey" value="登录"/>
                        &nbsp;
						<html:reset value="重置" styleClass="btn_grey"/>
                        <html:button property="button" styleClass="btn_grey" value="注册" onclick="window.location.href='register.jsp'"/>
                        &nbsp;
                       <html:button property="button" styleClass="btn_grey" value="找回密码" onclick="window.location.href='seekPwd.jsp'"/></td>
                      <td>&nbsp;</td>
                    </tr>
                        <tr>
                          <td height="40">&nbsp;</td>
                          <td height="31" colspan="2" align="right" valign="bottom"><html:link page="/manage/login.jsp" styleClass="word_orange">进入后台</html:link></td>
                          <td>&nbsp;</td>
                        </tr>
						</html:form>
                    </table> 
		    </td>
  </tr>
</table>
<table width="778" height="196" border="0" align="center" cellpadding="0" cellspacing="0" background="Images/login_bottom.gif">
  <tr>
    <td height="182" background="Images/login_bottom.jpg">&nbsp;</td>
  </tr>
</table>
</body>
</html>
