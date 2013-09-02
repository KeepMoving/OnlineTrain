<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="com.wgh.dao.*"%>
<%@ page import="com.wgh.actionForm.*"%>
<%@ page import="com.jspsmart.upload.*" %>
<%@page import="com.wgh.core.ChStr"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>上传文件</title>
</head>
<body>
<%
	//定义目标目录	
	String destination ="/upload/tasks/";
	//初始化
	mySmartUpload.initialize(pageContext);
	//文件上传
	mySmartUpload.upload();
	//获取文件对象
	com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
	if (!myFile.isMissing()){
		String filename = myFile.getFileName();
		String path = destination + filename;
		TasksDAO tdao =new TasksDAO();
		if(tdao.fandbyname(filename)!=0){		
			%>
			<script language="javascript">
			alert("文件已存在，请重命名后上传!");
			window.location.href="/OnlineTrain/student/course.do?action=tasksMan&srow=0";
			</script>	
			<%
		}else{
			myFile.saveAs(path);
			TaskForm tf = new TaskForm();
			CourseForm ctemp = (CourseForm)session.getAttribute("course");
			tf.setCid(ctemp.getId());
			tf.setStudent((String)session.getAttribute("manager"));
			tf.setTeacher(ctemp.getTname());
			tf.setName(filename);
			tf.setUrl(path);			
			tf.setTime(new ChStr().getDate());		
			tdao =new TasksDAO();
			if(tdao.insert(tf)!=1){
			%>
					<script language="javascript">
					alert("文件上传失败，请重新上传!");
					window.location.href="/OnlineTrain/student/course.do?action=tasksMan&srow=0";
					</script>	
			<%
			}else{%>
				<script language="javascript">
					alert("文件上传成功!");
					window.location.href="/OnlineTrain/student/course.do?action=tasksMan&srow=0";
				</script>	
			<%}			
		}
	}else{%>
				<script language="javascript">
					alert("文件上传失败，，请重新上传!");
					window.location.href="/OnlineTrain/student/course.do?action=tasksMan&srow=0";
				</script>	
			<%		
	}
%>
</body>
</html>
