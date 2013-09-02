<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.wgh.actionForm.*"%>
<html>
<head>
<title>课程在线学习测评系统</title>
</head>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>    
    <td width="778" valign="top" bgcolor="#FFFFFF"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
               <td width="40%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">课程测试考试 &gt;&gt;&gt;考试</span></td>
              <td width="30%" align="center"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;当前用户：<%=session.getAttribute("manager")%>&nbsp;</td>
              <td width="30%" align="right"><img src="../Images/m_ico1.gif" width="5" height="9">&nbsp;&nbsp;</td>
            </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
<%	PaperForm pf = (PaperForm)session.getAttribute("pf");	 %>
<html:form action="/student/papers.do?action=testPa" method="post">
 <table width="770" height="100%" border="0" cellpadding="0" cellspacing="0">   
  <tr>
    <td width="50">&nbsp;</td>
    <td  colspan="2" width="60%" height="50" align="center"><font color="Blue" size="15"><%=pf.getTitle() %></font></td>	
    <td width="50">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right">开始时间:<font color="red"><%=pf.getStime() %> </font>&nbsp;&nbsp; </td>
    <td align="left" >考试用时:<font color="red"><%=pf.getAlltime() %></font> </td>	
    <td >&nbsp;</td>
  </tr>
  <tr width="720">
    <td  colspan="4">
    <table id="single" border="0" cellspacing="0" cellpadding="0" align=center>
	  <tr>
	    <td colspan="4" height=23 align="left" style="font-size:11pt;">一. 单项选择试题</td>
	  </tr>	 
	   <%	   
				int i=0;
				List spl = (List) session.getAttribute("spl");	
				Iterator it = spl.iterator();
				while (it.hasNext()) {
   			    QuestionsForm temps = (QuestionsForm) it.next(); 			   		
	   %>
	   <tr>
	    <td height=60 colspan="4" nowrap>
		  <table  border="0" cellspacing="0" cellpadding="0">
	        <tr height="60">
	          <td width="60" align=right>[<%=i+1 %>]</td>
			  <td width="20">&nbsp;</td>
			  <td width="600" align=left nowrap style="font-size:11pt;"><%=temps.getTitle() %>			 			 		 
			  </td>
	        </tr>
	      </table>
		</td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="radio" name="answerArrS<%=i %>" border="no" value="A"/></td>
	    <td width="20" align=center nowrap>A.</td>
	    <td width="600" align=left nowrap><%=temps.getOptionA() %></td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="radio" name="answerArrS<%=i %>" border="no" value="B"/></td>
	    <td width="20" align=center nowrap>B.</td>
	    <td width="600" align=left nowrap><%=temps.getOptionB() %></td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="radio" name="answerArrS<%=i %>" border="no" value="C"/></td>
	    <td width="20" align=center nowrap>C.</td>
	    <td width="600" align=left nowrap><%=temps.getOptionC() %></td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="radio" name="answerArrS<%=i %>" border="no" value="D"/></td>
	    <td width="20" align=center nowrap>D.</td>
	    <td width="600" align=left nowrap><%=temps.getOptionD() %></td>
	  </tr>	
 <%  i=i+1; }	  
	  %>	
    </table>
    </td>    
  </tr>
  
   <tr width="720">
    <td  colspan="4">
    <table id="more" border="0" cellspacing="0" cellpadding="0" align=center>
	  <tr>
	    <td colspan="4" height=23 align="left" style="font-size:11pt;">二. 多项选择试题</td>
	  </tr>	 
	   <%	   	
	   			i=0;
	   			List mpl = (List) session.getAttribute("mpl");	
				it = mpl.iterator();
				while (it.hasNext()) {
   			    QuestionsForm temps = (QuestionsForm) it.next(); 			   		
	   %>
	   <tr height=60>
	    <td height=60 colspan="4" nowrap>
		  <table  border="0" cellspacing="0" cellpadding="0">
	        <tr height="60">
	          <td width="60" align=right>[<%=i+1 %>]</td>
			  <td width="20">&nbsp;</td>
			  <td width="600" align=left nowrap style="font-size:11pt;"><%=temps.getTitle() %>			 			 		 
			  </td>
	        </tr>
	      </table>
		</td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="checkbox" name="answerArrM<%=i %>" border="no" value="A"/></td>
	    <td width="20" align=center nowrap>A.</td>
	    <td width="600" align=left nowrap><%=temps.getOptionA() %></td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="checkbox" name="answerArrM<%=i %>" border="no" value="B"/></td>
	    <td width="20" align=center nowrap>B.</td>
	    <td width="600" align=left nowrap><%=temps.getOptionB() %></td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="checkbox" name="answerArrM<%=i %>" border="no" value="C"/></td>
	    <td width="20" align=center nowrap>C.</td>
	    <td width="600" align=left nowrap><%=temps.getOptionC() %></td>
	  </tr>
	  <tr>
	    <td width="60" height=23 nowrap>&nbsp;</td>
	    <td width="20" align=center nowrap><input type="checkbox" name="answerArrM<%=i %>" border="no" value="D"/></td>
	    <td width="20" align=center nowrap>D.</td>
	    <td width="600" align=left nowrap><%=temps.getOptionD() %></td>
	  </tr>	
<%  i=i+1; }	  
	  %>	
    </table>
    
  <tr>
    <td>&nbsp;</td>
    <td align="center" valign="top" colspan="2">
    <html:submit property="button" styleClass="btn_grey" value="提交"/>	
	<html:button property="button" styleClass="btn_grey" value="返回" onclick="history.back(-1)"/></td>
    <td width="10%">&nbsp;</td>
  </tr>  
   <tr>
    <td height="20" colspan="3" align="center" class="word_orange1">&nbsp;</td>
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
