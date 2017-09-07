<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>The navigation of Admin manage</title>
    
	<style type="text/css">
    body{
    	background-color:#85B931;
    }
    ul{
    	font-size:0.9em;
    	color:#00458c;
    	list-style-type:none;
    }
    li{
    	
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
    当前身份：管理员<br/>
    <strong>个人信息</strong>
    <ul>
    <li><a href="/CourseManage/showInfoServlet/AShowInfo" target="destination">自然信息</a></li>
    <li><a href="/CourseManage/changeInfoServlet/AChangeInfo1" target="destination">修改信息</a></li>
    </ul>
    <strong>学生管理</strong>
    <ul>
    <li><a href="/CourseManage/AdminManage/AStudentInfo.jsp" target="destination">学生信息管理</a></li>
    <li><a href="#" target="destination">学生课程管理</a></li>
    </ul>
    <strong>教师管理</strong>
    <ul>
    <li><a href="/CourseManage/AdminManage/ATeacherInfo.jsp" target="destination">教师信息管理</a></li>
    <li><a href="#" target="destination">教师课程管理</a></li>
    </ul>
    <strong>课程管理</strong>
    <ul>
    <li><a href="/CourseManage/AdminManage/ACourseInfo.jsp" target="destination">课程信息管理</a></li>
    </ul>
    <strong>汲取意见</strong>
    <ul>
    <li><a href="/CourseManage/opinionServlet/AShowOpinionInfo" target="destination">查看信箱</a></li>
    </ul>
    </div>
  </body>
</html>
