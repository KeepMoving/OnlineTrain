<%@ page contentType="text/html; charset=gb2312" language="java" import="com.wgh.actionForm.*,java.util.*"  errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html>
<head>
<title>�γ�����ѧϰ����ϵͳ</title>
<link href="../CSS/style.css" rel="stylesheet">
<script language="javascript" src="../JS/AjaxRequest.js">
</script>
</head>
<script language="javascript">
function checkForm(form){
	if(form.course.value==""){
		alert("������γ̱���!");form.course.focus();return false;
	}
	if(form.start.value==""){
		alert("�����뿪��ʱ��!");form.start.focus();return false;
	}
	if(form.end.value==""){
		alert("��������ʱ��!");form.end.focus();return false;
	}
	if(form.infor.value==""){
		alert("������γ�������Ϣ!");form.infor.focus();return false;
	}	
	if(confirm("��ȷ���������Ϣ׼ȷ��"))
	{
		return true;
	}else{
		return false;
	}	
}
</script>
<body><%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF"><%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="40%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">��ѵ�γ̹���>>�γ��޸�</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;��ǰ�û���<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >�˳�ϵͳ</html:link>&nbsp;</td>
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
<html:form action="/manage/courses.do?action=courAdd" method="post" onsubmit="return checkForm(this)">
  <table width="98%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
   <tr align="center">
    <td width="20%" height="30" align="right" style="padding:5px;">�γ̱��⣺</td>
    <td width="80%" align="left">
      <input type="text" name="course" size="40" /> *
	  </td>
    </tr>
   <tr align="center">
    <td width="20%" height="30" align="right" style="padding:5px;">�ڿ���ʦ��</td>
    <td width="80%" align="left"><%String tname =(String)session.getAttribute("manager");  %>
     <input type="text" name="tname" size="40" value="<%=tname %>" readonly="true" /> *
	  </td>
    </tr>
    <tr align="center">
    <td width="15%" height="30" align="right" style="padding:5px;">����ʱ�䣺</td>
    <td width="85%" align="left">
     <input type="text" name="start" size="40"/> *&nbsp;��ʽ�磺2010-11-13 *
	  </td>
    </tr>	
    <tr align="center">
    <td width="15%" height="30" align="right" style="padding:5px;">���ʱ�䣺</td>
    <td width="85%" align="left">
      <input type="text" name="end" size="40"/> *&nbsp;��ʽ�磺2010-11-13 *
	  </td>
    </tr>
    <tr>
    <td width="15%" height="190" style="padding:5px;" valign="top" align="right">�γ�������</td>
    <td class="altbg2" >
					<textarea name="infor" style="width : 98%; height : 99%"></textarea>*</td>	 
    </tr>    
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><html:submit property="submit" styleClass="btn_grey" value="����"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="����"/>
		&nbsp;
		<html:button property="button" styleClass="btn_grey" value="����" onclick="history.back(-1)"/></td>
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
