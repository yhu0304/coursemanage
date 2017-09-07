<%@ page language="java" import="java.util.*" import="myBean.StudentBean" pageEncoding="utf-8"%>
<%@ page import="java.sql.Date" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    <% StudentBean sb = (StudentBean) request.getAttribute("stinfo"); %>
    <title>学生信息</title>
    
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
    		<td class="class2">学生</td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">学号：</td>
    		<td class="class2"><%=sb.getSid() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">姓名：</td>
    		<td class="class2"><%=sb.getSname() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">性别：</td>
    		<td class="class2">
    			<% if(sb.getSsex() == null){ %>
    			<%="未填" %>
    			<% } else {%>
    			<%=sb.getSsex() %>
    			<% } %>
    		</td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">年龄：</td>
    		<td class="class2"><%=sb.getSage() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">出生日期：</td>
    		<td class="class2"><%=sb.getSbirth() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">专业：</td>
    		<td class="class2"><%=sb.getSprofession() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">联系方式：</td>
    		<td class="class2"><%=sb.getStel() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">邮箱：</td>
    		<td class="class2"><%=sb.getSemail() %></td>
    	</tr>
    </table>
  </body>
</html>
