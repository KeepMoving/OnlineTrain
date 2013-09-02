<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" errorPage="" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.wgh.actionForm.QuestionsForm"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>课程在线学习测评系统</title>
<link href="../CSS/style.css" rel="stylesheet">
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
              <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">课程试题练习  &gt;&gt;&gt;</span></td>
              <td width="35%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="25%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/logout.jsp" >退出系统</html:link>&nbsp;</td>
             </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
	<table width="602" height="10" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
</table>
<%String[] ans=null;int i=0; %> 	
<%	
	List lists = (List) session.getAttribute("singleQue");	
	Iterator it = lists.iterator();	
	if(it.hasNext()){
 %>	
	<html:form action="/manage/questions.do?action=submitExercise" method="post">
	<table id="single" width="580"  border="0" cellspacing="0" cellpadding="0" align=center>
	  <tr>
	    <td colspan="4" height=23 style="font-size:11pt;">&nbsp;&nbsp;&nbsp;&nbsp; 单项选择试题练习</td>
	  </tr>	 
	   <%	   	while (it.hasNext()) {
   			    QuestionsForm temps = (QuestionsForm) it.next(); 			   		
	   %>
	   <tr>
	    <td height="60" colspan="4" align=center nowrap>
		  <table  border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td width="60" align=right height=23>[<%=i+1 %>]</td>
			  <td width="20">&nbsp;</td>
			  <td width="500" align=left nowrap style="font-size:11pt;"><%=temps.getTitle() %>			 			 		 
			  </td>
	        </tr>
	      </table>
		</td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="radio" name="answerArrS<%=i %>" border="no" value="A"/></td>
	    <td width="20" align=center nowrap>A.</td>
	    <td width="480" align=left nowrap><%=temps.getOptionA() %></td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="radio" name="answerArrS<%=i %>" border="no" value="B"/></td>
	    <td width="20" align=center nowrap>B.</td>
	    <td width="480" align=left nowrap><%=temps.getOptionB() %></td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="radio" name="answerArrS<%=i %>" border="no" value="C"/></td>
	    <td width="20" align=center nowrap>C.</td>
	    <td width="480" align=left nowrap><%=temps.getOptionC() %></td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="radio" name="answerArrS<%=i %>" border="no" value="D"/></td>
	    <td width="20" align=center nowrap>D.</td>
	    <td width="480" align=left nowrap><%=temps.getOptionD() %></td>
	  </tr>	
<logic:present name="sinAns" scope="request"> 
		<%	
		QuestionsForm answerSin = (QuestionsForm)request.getAttribute("sinAns");
		 ans = answerSin.getAnswerArrS();	
		 %>
	  <tr>
		  <td colspan="4" height=30 align="center" nowrap>
		    <%if(ans[i].equals(temps.getAnswer())){%><font color="green">答案正确</font><%}else{ %><font color="red">答案错误</font><%} %>&nbsp;
		    &nbsp;正确答案：<%=temps.getAnswer() %>&nbsp;&nbsp;你的答案：<%=ans[i] %>&nbsp;&nbsp;提示信息：<%=temps.getNote() %>
		  </td>
	  </tr>
</logic:present> 
 <% i++;} 	  
	  %>	
	  <tr>
	  <%   String tsrow =(String)request.getAttribute("srow").toString();
  		int srow = Integer.valueOf(tsrow);
		 String tallrow =(String)request.getAttribute("allrow").toString();
		 int allrow = Integer.valueOf(tallrow);			
		 java.util.HashMap newValues = new java.util.HashMap(); 
		 newValues.put("type",1); 		 
	%>
	  	<td colspan="4" align="center">
	  	 <input type="hidden" name="optionA" value="1" />
	  	 <input type="hidden" name="optionB" value="<%=srow %>" />
	  	<html:submit property="submit" styleClass="btn_grey" value="提交"/>
        &nbsp;
        <html:reset property="reset" styleClass="btn_grey" value="重置"/>
		&nbsp;
		<html:button property="button" styleClass="btn_grey" value="返回" onclick="history.back(-1)"/>
	  	</td>
	  </tr>	  
	  <tr>
	  	<td colspan="4" align="center">	  	
 	共<%=allrow/5+1 %>页/<%=allrow %>条记录&nbsp;&nbsp;当前第<%=srow/5+1 %>页&nbsp;&nbsp;
	<html:link page="/manage/questions.do?action=selectList&srow=0&type=1">首页</html:link>&nbsp;<%
		if((srow-5)>=0){				 
		  newValues.put("srow",srow-5);  		  
		  pageContext.setAttribute("newValues",newValues);   
  %><html:link page="/manage/questions.do?action=selectList" name="newValues">上一页</html:link>&nbsp;
	 <%}else{ %>上一页&nbsp;<%}
	   if((srow+5)<=allrow){
	   newValues.put("srow",srow+5);  		  
		  pageContext.setAttribute("newValues",newValues); 
	  %><html:link page="/manage/questions.do?action=selectList" name="newValues">下一页</html:link>&nbsp;
	 <%}else{%>下一页&nbsp;<%} newValues.put("srow",(allrow/5)*5);pageContext.setAttribute("newValues",newValues); 
	 %><html:link page="/manage/questions.do?action=selectList" name="newValues">尾页</html:link>&nbsp;	
  <br>
	  	</td>
	  </tr>
	</table>	
	</html:form>
	<%} %>
</td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>