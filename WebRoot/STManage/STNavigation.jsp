<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>The navigation of student manage</title>
    
	<style type="text/css">
    body{
    	background-color:#85B931;
    }
    ul{
    	font-size:0.9em;
    	color:#00458c;
    	list-style-type:none;
    }
    a{
    	text-decoration:none;
    	color:blue;
    }
    a:hover{
    	color:#c00;
    	background:#069;
    }
    a:visited{
    	color:sliver;
    }
    div{
    	padding-left:15px;
    	float:left;
    	width:150px;
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
  <div>欢迎您：<%out.print(session.getAttribute("username")); %><br/>
    当前身份：学生<br/>
    <strong>个人信息</strong>
    <ul>
    <li><a href="/CourseManage/showInfoServlet/STShowInfo" target="destination">自然信息</a></li>
    <li><a href="/CourseManage/changeInfoServlet/STChangeInfo1" target="destination">修改信息</a></li>
    </ul>
    <strong>选课信息</strong>
    <ul>
    <li><a href="/CourseManage/Course/STCourse" target="destination">我的课表</a></li>
    <li><a href="/CourseManage/Course/STGetOptionalCourse" target="destination">选择课程</a></li>
    <li><a href="/CourseManage/DropCourse/STGetMyOptCourse" target="destination">已选课程</a></li>
    </ul>
    <strong>成绩一览</strong>
    <ul>
    <li><a href="/CourseManage/Grade/STGrade" target="destination">我的成绩</a></li>
    </ul>
    <strong>评价我们</strong>
    <ul>
    <li><a href="/CourseManage/STManage/STOpinion.jsp" target="destination">意见信箱</a></li>
    </ul>
    </div>
  </body>
</html>