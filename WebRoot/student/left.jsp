<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="29" bgcolor="#5898C8"><span class="word_white">&nbsp;系统前台功能</span></td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
    <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td width="75%" align="left" class="tableBorder_B"><html:link page="/manage/student.do?action=modifyQuery">修改用户信息</html:link></td>
  </tr>
  
  <!--  
	  <tr>
	    <td width="25%" height="32" align="right" class="tableBorder_B">
	    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
	    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/student/course.do?action=courQuery&srow=0">培训课程学习</html:link></td>
	  </tr>
  -->
  
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/questions.do?action=csQuery&srow=0">课程试题练习</html:link></td>
  </tr>     
  <tr>
      <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/paperm.do?action=csQuery&srow=0">培训课程测试</html:link></td>
  </tr>
  <tr>
    <td width="25%" height="32" align="right" class="tableBorder_B">
    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/paResultIf.do?action=paResultsQuery&srow=0">课程测试查询</html:link></td>
  </tr> 
   
  <!--  
	  <tr>
	    <td width="25%" height="32" align="right" class="tableBorder_B">
	    <img src="../Images/m_ico.gif" width="11" height="11" />&nbsp;</td>
	    <td height="32" colspan="2" align="left" class="tableBorder_B"><html:link page="/manage/data.do?action=datasQuery&srow=0">课程资料查询</html:link></td>
	  </tr>   
  --> 
  
  <tr>
    <td height="217" align="right">&nbsp;</td>
    <td height="217" colspan="2" align="left">&nbsp;</td>
  </tr>
</table>
