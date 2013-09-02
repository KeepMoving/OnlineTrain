<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%	
	// Initialization
	mySmartUpload.initialize(pageContext);	
	// Download file
	String url=request.getParameter("url");
	url=new String(url.getBytes("iso-8859-1"),"GB2312");
	System.out.println(url);
	try{
			mySmartUpload.downloadFile(url);		
		}catch(Exception e){
			e.printStackTrace();			
		}	
%>