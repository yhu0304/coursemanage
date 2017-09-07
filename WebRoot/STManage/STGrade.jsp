<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.GradeBean" %>
<%@ page import="java.util.ArrayList"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>我的成绩</title>
    
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
  <table cellspacing="0px" style="border-collapse:collapse">
  <tr style="height: 35px; color: #000333; background-color: rgb(232, 242, 251);">
  		<td width="200px"><nobr>课程号</nobr></td>
  		<td width="200px"><nobr>课程名</nobr></td>
  		<td width="200px"><nobr>任课老师</nobr></td>
  		<td width="200px"><nobr>成绩</nobr></td>
  		<td width="200px"><nobr>课程性质</nobr></td>
  </tr>
  <% 
  GradeBean gb =null;
  ArrayList<GradeBean> grade =(ArrayList<GradeBean>) session.getAttribute("grade");
  if(grade != null){
  for(int i=0; i<grade.size(); i++){
  	gb = grade.get(i); 
   %>
  <tr>
  	<td><%=gb.getCid() %></td>
  	<td><%=gb.getCname() %></td>
  	<td><%=gb.getTname() %></td>
  	<td><%=gb.getGrade() %></td>
  	<td><%=gb.getProperty() %></td>
  </tr>
  <%}
  	}
   %>
  </table>
  </body>
</html>
