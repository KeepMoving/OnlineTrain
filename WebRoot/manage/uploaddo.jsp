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
<title>�ϴ��ļ�</title>
</head>
<body>
<%
	//����Ŀ��Ŀ¼	
	String destination ="/upload/courdel/";
	//��ʼ��
	mySmartUpload.initialize(pageContext);
	//�ļ��ϴ�
	mySmartUpload.upload();
	//��ȡ�ļ�����
	com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
	if (!myFile.isMissing()){
		String filename = myFile.getFileName();
		String path = destination + filename;
		CourDeDAO cddao =new CourDeDAO();
		if(cddao.fandbyname(filename)!=0){			
			%>
			<script language="javascript">
			alert("�ļ��Ѵ��ڣ������������ϴ�!");
			window.location.href="/OnlineTrain/manage/courses.do?action=coursesMan&srow=0";
			</script>	
			<%
		}else{
			myFile.saveAs(path);
			CourDeForm cd = new CourDeForm();
			CourseForm ctemp = (CourseForm)session.getAttribute("course");
			cd.setCid(ctemp.getId());
			cd.setCourse(ctemp.getCourse());
			cd.setFname(filename);
			cd.setTname(ctemp.getTname());			
			cd.setFtime(new ChStr().getDate());			
			cd.setUrl(path);
			cddao =new CourDeDAO();
			if(cddao.add(cd)!=1){
			%>
					<script language="javascript">
					alert("�ļ��ϴ�ʧ�ܣ��������ϴ�!");
					window.location.href="/OnlineTrain/manage/courses.do?action=coursesMan&srow=0";
					</script>	
			<%
			}else{%>
				<script language="javascript">
					alert("�ļ��ϴ��ɹ�!");
					window.location.href="/OnlineTrain/manage/courses.do?action=coursesMan&srow=0";
				</script>	
			<%}			
		}
	}else{%>
				<script language="javascript">
					alert("�ļ��ϴ�ʧ�ܣ����������ϴ�!");
					window.location.href="/OnlineTrain/manage/courses.do?action=coursesMan&srow=0";
				</script>	
			<%		
	}
%>
</body>
</html>