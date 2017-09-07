<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>The head of student manage</title>
    <style type="text/css">
    body{
    	background-image:url("images/stu.jpg");
    	background-repeat:no-repeat;
    	width:100%;
    	heigth:100%;
    }
    p{
    	font-size:15px;
    	color:orange;
    	letter-spacing:6px;
    	text-decoration:blink;
    	font-weight:bold;
    	font-family:Microsoft YaHei;
    }
    div{
    	margin-right:20px;
    	height:50px;
    	float:right;
    	width:210px;
    	position:relative;
    	top:18px;
    	left:5px;
    	
    }
    a{
    	color:rgb(100,100,100);
    	font-size:17px;
    	text-decoration:none;
    	font-weight:bold;
    }
    a:hover{
    	font-size:17px;
    	text-decoration:underline;
    	color:blue;
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
    <div ><span><a href="/CourseManage/STManage/STChangePassword.jsp" target="destination">修改密码</a></span>&nbsp;
    |&nbsp;<span><a href="/CourseManage/servlet/Logout" target="_parent">注&nbsp;&nbsp;销</a></span>
    </div>
  </body>
</html>
