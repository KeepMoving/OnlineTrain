<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>�����ɹ�!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("��ѵ�γ���ӳɹ�!");
		window.location.href="courses.do?action=coursesQuery&srow=0";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("��ѵ�γ��޸ĳɹ�!");
		window.location.href="courses.do?action=coursesQuery&srow=0";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("��ѵ�γ�ɾ���ɹ�!");
		window.location.href="courses.do?action=coursesQuery&srow=0";
		</script>		
	<%	break;
}
%>
</body>
</html>