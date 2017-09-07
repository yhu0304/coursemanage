<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>大学生课务管理系统</title>
  <style type="text/css">
    #myFrame()
    frame{ 
    	border:2px;
    	border-color:red;
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
  
  <frameset id="myFrame" rows="13%,79%,8%" cols="," framespacing=1>
  	<frame src="AdminManage/AdminHeader.jsp" name="" border="0" frameborder="no" scrolling="no" noresize/>
  	<frameset rows="," cols="18%,*" framspacing=2>
  		<frame src="AdminManage/AdminNavigation.jsp" name="" frameborder="no" noresize/>
  		<frame src="AdminManage/AdminContent.jsp" name="destination" frameborder="no" noresize/>
  	</frameset>
  	<frame src="Foot.jsp" name="" frameborder="no" scrolling="no" noresize/>
  </frameset>
</html>