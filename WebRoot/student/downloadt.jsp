<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.io.File"%>
<%@ page import="com.wgh.dao.TasksDAO"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����ļ�</title>
</head>
<body>
<%	
	String path=new java.io.File(application.getRealPath(request.getContextPath())).getParent();
	System.out.println("basePath�ǣ�"+path);
	// Initialization
	mySmartUpload.initialize(pageContext);	
	// Download file
	String url=request.getParameter("url");
	String[] ft = url.split("/");
	String fname=ft[2];
	url=new String(url.getBytes("iso-8859-1"),"GB2312");
	System.out.println(url);
	try{
		File file = new File(path+"\\upload\\tasks\\"+fname);
		if(file.exists()){
			mySmartUpload.downloadFile(url);
		}else{
			TasksDAO tdao = new TasksDAO();
			int flag=tdao.delByUrl(url);
			if(flag!=1){
				System.out.println("ɾ�����ݿ��¼ʧ�ܣ�");
			}
		%>
			<script language="javascript">
			alert("�ļ��Ѿ�������!");
			window.location.href="/OnlineTrain/student/course.do?action=tasksMan&srow=0";
			</script>	
		<%
		}			
	}catch(Exception e){
		e.printStackTrace();			
	}	
%>
</body>
</html>
