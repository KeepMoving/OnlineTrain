<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%
//��֤�û��Ƿ��¼
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
    <div align=center><font face=���� color=#ffd700 size=7>�γ�����ѧϰ����ϵͳ</font></div>
    <div align=center><font color=#ffd700 size=2></font>&nbsp;</div>
   </td>
  </tr>
</table>