<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.wgh.dao.*"%>
<%  
	String id = request.getParameter("upid");
	String url=request.getParameter("url");
	url=new String(url.getBytes("iso-8859-1"),"GB2312");
	try{		
		java.io.File delFile=new java.io.File(application.getRealPath("/")+url.substring(1,url.length()));
		if(delFile.exists()){
			delFile.delete();
			CourDeDAO cddao =new CourDeDAO();	
			if(cddao.delete(id)==1){
			%>
			<script language="javascript">
			alert("文件删除成功");
			window.location.href="/OnlineTrain/manage/courses.do?action=coursesMan&srow=0";
			</script>	
			<%
			}else{
			%>
			<script language="javascript">
			alert("文件删除失败!");
			window.location.href="/OnlineTrain/manage/courses.do?action=coursesMan&srow=0";
			</script>	
			<%
			
			}			
		}else{
		%>
			<script language="javascript">
			alert("文件已不存在，数据库不同步！");
			window.location.href="/OnlineTrain/manage/courses.do?action=coursesMan&srow=0";
			</script>	
			<%			
		}		
			
	}catch(Exception e){
		e.printStackTrace();
		out.println(e.getMessage().toString());
	}	
	
%>