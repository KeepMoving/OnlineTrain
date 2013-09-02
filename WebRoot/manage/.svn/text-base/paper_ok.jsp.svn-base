<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("教学试卷添加成功!");
		window.location.href="paperm.do?action=paperQuery&srow=0";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("教学试卷修改成功!");
		window.location.href="paperm.do?action=paperQuery&srow=0";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("教学试卷删除成功!");
		window.location.href="paperm.do?action=paperQuery&srow=0";
		</script>		
	<%	break;
}
%>
</body>
</html>