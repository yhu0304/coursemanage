<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.StudentBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>意见信箱</title>
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	table{
    	margin-left:auto;
    	margin-right:auto;
    	font-size:16px;
    }
    .class1{
    	font-family:Microsoft YaHei;
    	width:150px;
    }
    .class2{
    	font-family:Microsoft YaHei;
    	width:300px;
    }
    .class3{
    	font-family:Microsoft YaHei;
    	width:450px;
    	text-align:center;
    }
    .class4{
    	font-family:Microsoft YaHei;
    	
    }
    </style>
    
    <script type="text/javascript">
    	function check(){
		var obj1 = document.getElementById("sidwarn");
		var sid = document.getElementById("sid").value;
		var obj2 = document.getElementById("snamewarn");
		var sname = document.getElementById("sname").value;
		var obj3 = document.getElementById("warn");
		var spassword = document.getElementById("spassword").value;
		var choice = document.getElementById("stuaction").value;
		if(choice == "0"){
		if(sid == null || sid == ""){
			obj1.style.display = "inline";
			obj2.style.display = "none";
			obj3.style.display = "none";
			return false;
		} else if(sname == null || sname == ""){
			obj1.style.display = "none";
			obj2.style.display = "inline";
			obj3.style.display = "none";
			return false;
		} else if(spassword == null || spassword == ""){
			obj1.style.display = "none";
			obj2.style.display = "none";
			obj3.style.display = "inline";
			return false;
		}} else {
			if(sid == null || sid == ""){
			obj1.style.display = "inline";
			obj2.style.display = "none";
			obj3.style.display = "none";
			return false;
		}
		}
		return true;
	}
    function check1(){
    	if(confirm("确定提交？"))return true;
    	else return false;
    }
    function load(){
    	var res=document.getElementById("res").value;
    	var stuaction1=document.getElementById("stuaction1").value;
    	if(res=="success"){
    		alert(stuaction1+"成功！");
    	} else if(res=="lose") {
    		alert(stuaction1+"失败！");
    	} else {
    	}
    }
    </script>

  </head>
  
  <body onload="load()">
  <form action="/CourseManage/myStuServlet/AstuManage" method="post" onsubmit="return check1();">
    <select name="stuaction" id="stuaction">
		<option value="0" selected>录入</option>
		<option value="1">删除</option>
		<option value="2">更新</option>
		<option value="3">查询</option>
    </select>
    <%
    	StudentBean sb = (StudentBean) request.getAttribute("stinfo");
     	request.setAttribute("stinfo", null);
     	String str = "未填";
    %>
    <table bgcolor="#cbe2e4" border="1px" cellspacing="0px"style="border-collapse:collapse">
    	<tr>
			<td class="class1">学&nbsp;&nbsp;号:</td>
			<td class="class2"><input id="sid" type="text" name="sid" maxlength=10 
			value="<% if(sb != null){if(sb.getSid() == null){
			 %><%=str %><%
			  } else {
			  %><%=sb.getSid() %><%
			   } }%>"/>
			<span id="sidwarn" style="display:none;">*请输入学生号</span></td>
		</tr>
		
		<tr>
			<td class="class1">姓&nbsp;&nbsp;名:</td>
			<td class="class2"><input id="sname" type="text" name="sname" maxlength=10
			value="<% if(sb != null){
				if(sb.getSname() == null){
				 %><%=str %><%
				  } else {
				  %><%=sb.getSname() %><% } }%>"/>
			<span id="snamewarn" style="display:none;">*请输入学生姓名</span></td>
		</tr>
		<tr>
			<td class="class1">密&nbsp;&nbsp;码:</td>
			<td class="class2"><input id="spassword" type="text" name="spassword" maxlength=20
			value="<% if(sb != null){
				if(sb.getSpassword() == null){ %><%=str %><%
				 } else {%><%=sb.getSpassword() %><% } }%>"/>
			<span id="warn" style="display:none;">*请输入学生密码</span></td>
		</tr>
		<tr>
			<td class="class1">性&nbsp;&nbsp;别:</td>
			<td class="class2"><input id="ssex" type="text" name="ssex" maxlength=2
			value="<% if(sb != null){
				if(sb.getSsex() == null){ %><%=str %><% 
				} else {%><%=sb.getSsex() %><%
				 }} %>"
			/></td>
		</tr>
		<tr>
			<td class="class1">出生日期:</td>
			<td class="class2"><input id="sbirth" type="text" name="sbirth" maxlength=14
			value="<%if(sb != null){%><%=sb.getSbirth()%><%}%>"/></td>
		</tr>
		<tr>
			<td class="class1">专&nbsp;&nbsp;业:</td>
			<td class="class2"><input id="sprofession" type="text" name="sprofession" maxlength=10 
				value="<%if(sb != null){ 
				if(sb.getSprofession() == null){ %><%=str %><%
				 } else {%><%=sb.getSprofession() %><%
				  } }%>"/></td>
		</tr>
		<tr>
			<td class="class1">联系电话:</td>
			<td class="class2"><input id="stel" type="text" name="stel" maxlength=30 
			value="<% if(sb != null){
				if(sb.getStel() == null){ %><%=str %><%
				 } else {%><%=sb.getStel() %><%
				  } }%>"/></td>
		</tr>
		<tr>
			<td class="class1">邮&nbsp;&nbsp;箱:</td>
			<td class="class2"><input id="semail" type="text" name="semail" maxlength=20 
			value="<%if(sb != null){
				 if(sb.getSemail() == null){ %><%=str %><%
				  } else {%><%=sb.getSemail() %><%
				   } }%>"/></td>
		</tr>

		<tr>
			<td class="class3" colspan="2"><input align="middle" class="class4" type="submit" name="submit" value="提交" onclick="return check()"/></td>
		</tr>
    </table>
    </form>
    <%
  	String res=(String) session.getAttribute("stuactionres"); 
  	String stuaction1 = (String) session.getAttribute("stuaction1");
  	session.setAttribute("stuactionres", null);
  	session.setAttribute("stuaction1", null);
  	%>
    <input type="hidden" id="res" value="<%=res %>"/>
    <input type="hidden" id="stuaction1" value="<%=stuaction1 %>"/>
  </body>
</html>