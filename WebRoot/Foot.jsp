<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <title>The foot of all manage page.</title>
    <style type="text/css">
    div{
    	margin-top:5px;
    	margin-left:0px;
    	margin-right:0px;
    	margin-bottom:0px;
    	padding-top:0px;
    	padding-left:0px;
    	padding-right:0px;
    	padding-bottom:0px;
    	height:18px;
    	width:100%;
    }
    center{
    	font-size:12px;
    }
    </style>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
  <div>
    <center>胡杨 J2EE作业</center>
    <center>Copyright&copy;2017. All Rights Reserved.</center>
  </div>
  </body>
</html>
