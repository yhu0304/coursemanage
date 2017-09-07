<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.TeacherBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    <% TeacherBean tb = (TeacherBean) request.getAttribute("teainfo"); %>
    <title>教师信息</title>
    <style type="text/css">
    table{
    	margin-left:auto;
    	margin-right:auto;
    	font-size:16px;
    }
    .class1{
    	width:150px;
    	font-family:Microsoft YaHei;
    }
    .class2{
    	font-family:Microsoft YaHei;
    	width:300px;
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
    <table bgcolor="#cbe2e4" border="1px" cellspacing="0px"style="border-collapse:collapse">
    	<tr>
    		<td class="class1" style="text-align:center;">当前身份：</td>
    		<td class="class2">教师</td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">教师号：</td>
    		<td class="class2"><%=tb.getTid() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">职称：</td>
    		<td class="class2"><%=tb.getTjob() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">姓名：</td>
    		<td class="class2"><%=tb.getTname() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">性别：</td>
    		<td class="class2">
    			<% if(tb.getTsex() == null){ %>
    			<%="未填" %>
    			<% } else {%>
    			<%=tb.getTsex() %>
    			<% } %>
    		</td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">年龄：</td>
    		<td class="class2"><%=tb.getTage() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">出生日期：</td>
    		<td class="class2"><%=tb.getTbirth() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">联系方式：</td>
    		<td class="class2"><%=tb.getTtel() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">邮箱：</td>
    		<td class="class2"><%=tb.getTemail() %></td>
    	</tr>
    </table>
  </body>
</html>
