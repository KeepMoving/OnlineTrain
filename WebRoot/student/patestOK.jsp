<%@ page contentType="text/html; charset=gb2312" language="java" import="com.wgh.actionForm.*" errorPage="" %>
<html>
<head>
<title>�����ɹ�!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%  PaResultForm prf = (PaResultForm)session.getAttribute("prf");%>
		<script language="javascript">		
		alert("���Խ���ύ�ɹ���\n��ѡ�÷֣�<%=prf.getSscore() %>\n��ѡ�÷֣�<%=prf.getMscore() %>");
		window.location.href="papers.do?action=papersQuery&srow=0";
		</script>	
</body>
</html>