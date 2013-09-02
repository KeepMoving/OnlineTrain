<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
//验证用户是否登录
if (session.getAttribute("manager")==null || "".equals(session.getAttribute("manager"))){
	response.sendRedirect("login.jsp");
	return;
}
%>
<table width="778" height="99" border="0" align="center" cellpadding="0" cellspacing="0" background="../Images/top_bg.jpg">
  <tr>
    <td>&nbsp;</td>
  <td height="100">
     <div align=center><font color=#ffd700 size=2></font>&nbsp;</div>
    <div align=center><font face=隶书 color=#ffd700 size=7>课程在线学习测评系统</font></div>
    <div align=center><font color=#ffd700 size=2></font>&nbsp;</div>
   </td>
  </tr>
</table>