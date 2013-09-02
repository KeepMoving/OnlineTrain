<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<jsp:useBean id="taoTi" class="com.wgh.dao.QuestionsDAO" scope="page"/>
<html>
<head>
<title>�γ�����ѧϰ����ϵͳ</title>
<link href="../CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function checkForm(form){
	if(form.title.value==""){
		alert("�����뿼����Ŀ����!");form.title.focus();return false;
	}
	if(form.optionA.value==""){
		alert("������ѡ��A!");form.optionA.focus();return false;
	}
	if(form.optionB.value==""){
		alert("������ѡ��B!");form.optionB.focus();return false;
	}
	if(form.optionC.value==""){
		alert("������ѡ��C!");form.optionC.focus();return false;
	}
	if(form.optionD.value==""){
		alert("������ѡ��D!");form.optionD.focus();return false;
	}
}
function show(val){
		if(val=="��ѡ��"){
		sOption.style.display="";
		mOption.style.display="none";
	}else if(val=="��ѡ��"){
		sOption.style.display="none";
		mOption.style.display="";		
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
               <td width="40%" class="word_grey">&nbsp;��ǰλ�ã�<span class="word_darkGrey">��ѧ����鿴</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;��ǰ�û���<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >�˳�ϵͳ</html:link>&nbsp;</td>
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
<html:form action="/manage/questions.do?action=questionsModify" method="post" onsubmit="return checkForm(questionsForm)">
	<bean:define id="defaultOption" name="questionsModifyQuery" property="type" type="String"/>
	<table width="85%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
	<tr align="center">
      <td width="15%" height="30" align="left" style="padding:5px;">������Ŀ��</td>
      <td width="85%" align="left"><html:text property="title" size="60" name="questionsModifyQuery"/>
	  <html:hidden property="ID" name="questionsModifyQuery"/>
	   * </td>
    <tr>
    <tr>
      <td height="30" align="left" style="padding:5px;">�������ͣ�</td>
      <td align="left"><html:select property="type" onchange="show(this.value)" name="questionsModifyQuery">
          <html:option value="��ѡ��">��ѡ��</html:option>
          <html:option value="��ѡ��" >��ѡ��</html:option>
        </html:select>      </td>
    </tr>
    <tr align="center">
      <td width="15%" height="30" align="left" style="padding:5px;">ѡ��A��</td>
      <td width="85%" align="left"><html:text property="optionA" size="60" name="questionsModifyQuery"/>
        * </td>
    </tr>
    <tr align="center">
      <td width="15%" height="30" align="left" style="padding:5px;">ѡ��B��</td>
      <td width="85%" align="left"><html:text property="optionB" size="60" name="questionsModifyQuery"/>
        * </td>
    </tr>
    <tr align="center">
      <td width="15%" height="30" align="left" style="padding:5px;">ѡ��C��</td>
      <td width="85%" align="left"><html:text property="optionC" size="60" name="questionsModifyQuery"/>
        * </td>
    </tr>
    <tr align="center">
      <td width="15%" height="30" align="left" style="padding:5px;">ѡ��D��</td>
      <td width="85%" align="left"><html:text property="optionD" size="60" name="questionsModifyQuery"/>
        * </td>
    </tr>
    <tr align="center">
      <td width="15%" height="30" align="left" style="padding:5px;">��ȷ�𰸣�</td>
      <td width="85%" align="left" id="sOption"><html:select property="answer" name="questionsModifyQuery">
          <html:option value="A">A </html:option>
          <html:option value="B">B </html:option>
          <html:option value="C">C </html:option>
          <html:option value="D">D </html:option>
        </html:select>      </td>
      <td width="85%" align="left" id="mOption" style="display:none">
	  <html:multibox property="answerArr" styleClass="noborder" name="questionsModifyQuery">A</html:multibox>
        A
        <html:multibox property="answerArr" styleClass="noborder" name="questionsModifyQuery">B</html:multibox>
        B
        <html:multibox property="answerArr" styleClass="noborder" name="questionsModifyQuery">C</html:multibox>
        C
        <html:multibox property="answerArr" styleClass="noborder" name="questionsModifyQuery">D</html:multibox>
        D </td>
    </tr>
    <tr align="center">
      <td width="15%" height="30" align="left" style="padding:5px;">��ע��</td>
      <td width="85%" align="left"><html:text property="note" size="60" name="questionsModifyQuery"/>      </td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>
        <html:button property="button" styleClass="btn_grey" value="����" onclick="history.back(-1)"/></td>
    </tr>
  </table>
  <script language="javascript">
show("<%=defaultOption%>");
</script>
</html:form></td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>