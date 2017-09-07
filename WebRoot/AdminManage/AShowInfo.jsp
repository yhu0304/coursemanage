<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.AdministratorBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    <% AdministratorBean ab = (AdministratorBean) request.getAttribute("admininfo"); %>
    <title>管理员信息</title>
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
    		<td class="class2">管理员</td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">管理员号：</td>
    		<td class="class2"><%=ab.getAid() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">姓名：</td>
    		<td class="class2"><%=ab.getAname() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">性别：</td>
    		<td class="class2">
    			<% if(ab.getAsex() == null){ %>
    			<%="未填" %>
    			<% } else {%>
    			<%=ab.getAsex() %>
    			<% } %>
    		</td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">年龄：</td>
    		<td class="class2"><%=ab.getAage() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">出生日期：</td>
    		<td class="class2"><%=ab.getAbirth() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">联系方式：</td>
    		<td class="class2"><%=ab.getAtel() %></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">邮箱：</td>
    		<td class="class2"><%=ab.getAemail() %></td>
    	</tr>
    </table>
  </body>
</html>
