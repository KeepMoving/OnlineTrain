<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.wgh.dao.*"%>
<%  
	int id = Integer.parseInt(request.getParameter("upid"));
	String url=request.getParameter("url");
	url=new String(url.getBytes("iso-8859-1"),"GB2312");
	try{		
		java.io.File delFile=new java.io.File(application.getRealPath("/")+url.substring(1,url.length()));
		if(delFile.exists()){
			delFile.delete();
			TasksDAO tdao =new TasksDAO();	
			if(tdao.delete(id)==1){
			%>
			<script language="javascript">
			alert("�ļ�ɾ���ɹ�");
			window.location.href="/OnlineTrain/student/course.do?action=tasksMan&srow=0";
			</script>	
			<%
			}else{
			%>
			<script language="javascript">
			alert("�ļ�ɾ��ʧ��!");
			window.location.href="/OnlineTrain/student/course.do?action=tasksMan&srow=0";
			</script>	
			<%
			
			}			
		}else{
		%>
			<script language="javascript">
			alert("�ļ��Ѳ����ڣ����ݿⲻͬ����");
			window.location.href="/OnlineTrain/student/course.do?action=tasksMan&srow=0";
			</script>	
			<%			
		}		
			
	}catch(Exception e){
		e.printStackTrace();
		out.println(e.getMessage().toString());
	}	
	
%>