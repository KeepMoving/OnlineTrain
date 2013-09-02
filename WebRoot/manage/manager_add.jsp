<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>添加管理员信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function check(form){
	if(form.name.value==""){
		alert("请输入管理员名称!");form.name.focus();return;
	}
	if(form.password1.value==""){
		alert("请输入管理员密码!");form.password1.focus();return;
	}
	if(form.password2.value==""){
		alert("请确认管理员密码!");form.password2.focus();return;
	}		
	if(form.password1.value!=form.password2.value){
		alert("您两次输入的管理员密码不一致，请重新输入!");form.password1.focus();return;
	}
	form.submit();
}
</script>
<body><center>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEEEEE">
  <tr>
    <td align="center" >    
       <table width="290" border="0" cellpadding="0" cellspacing="0" height="180" background="../Images/subBG.jpg">
      <tr>
        <td width="15%" height="55">&nbsp;</td>
        <td width="85%"  height="55"valign="bottom">
        	<table width="86%" height="55" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="word_white">添加管理员</td>
          </tr>
        </table></td>
        <td width="3%"height="2">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="90" align="center" valign="top">
				<html:form action="/manage/manager.do?action=managerAdd" method="post" focus="name">
				<table  border="0" cellpadding="0" cellspacing="0">
			      <tr>
			        <td width="81" height="25" align="center">管理员名称：</td>
			        <td width="167"><html:text property="name"/></td>
			      </tr>
			      <tr>
			        <td height="25" align="center">管理员密码：</td>
			        <td><html:password styleId="password1" property="pwd"/></td>
			      </tr>
			      <tr>
			        <td height="25" align="center">确认&nbsp;&nbsp;密码：</td>
			        <td><html:password styleId="password2" property="pwd"/></td>
			      </tr>
			      <tr>
			        <td height="25" align="center">&nbsp;</td>
			        <td><html:button property="button" styleClass="btn_grey" value="保存" onclick="check(managerForm)"/>
			&nbsp;
			<html:button property="button" styleClass="btn_grey" value="关闭" onclick="window.close();"/></td>
			      </tr>
			    </table>
				</html:form>
	</td>
          </tr>
        </table></td>
        
      </tr>
      
    </table>
    </td>
  </tr>
</table>
</center>
</body>
</html>
