<%@ page contentType="text/html; charset=gb2312" language="java" import="com.wgh.actionForm.*" errorPage="" %>
<html>
<head>
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%  PaResultForm prf = (PaResultForm)session.getAttribute("prf");%>
		<script language="javascript">		
		alert("考试结果提交成功！\n单选得分：<%=prf.getSscore() %>\n多选得分：<%=prf.getMscore() %>");
		window.location.href="papers.do?action=papersQuery&srow=0";
		</script>	
</body>
</html>