<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.TeacherBean" %>
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
		var obj1 = document.getElementById("tidwarn");
		var tid = document.getElementById("tid").value;
		var obj2 = document.getElementById("tnamewarn");
		var tname = document.getElementById("tname").value;
		var obj3 = document.getElementById("warn");
		var tpassword = document.getElementById("tpassword").value;
		var choice = document.getElementById("teaaction").value;
		if(choice == "0"){
		if(tid == null || tid == ""){
			obj1.style.display = "inline";
			obj2.style.display = "none";
			obj3.style.display = "none";
			return false;
		} else if(tname == null || tname == ""){
			obj1.style.display = "none";
			obj2.style.display = "inline";
			obj3.style.display = "none";
			return false;
		} else if(tpassword == null || tpassword == ""){
			obj1.style.display = "none";
			obj2.style.display = "none";
			obj3.style.display = "inline";
			return false;
		}} else {
			if(tid == null || tid == ""){
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
    	var teaaction1=document.getElementById("teaaction1").value;
    	if(res=="success"){
    		alert(teaaction1+"成功！");
    	} else if(res=="lose") {
    		alert(teaaction1+"失败！");
    	} else {
    	}
    }
    </script>

  </head>
  
  <body onload="load()">
  <form action="/CourseManage/myTeaServlet/AteaManage" method="post" onsubmit="return check1();">
    <select name="teaaction" id="teaaction">
		<option value="0" selected>录入</option>
		<option value="1">删除</option>
		<option value="2">更新</option>
		<option value="3">查询</option>
    </select>
    <%
    	TeacherBean tb = (TeacherBean) request.getAttribute("teainfo");
     	request.setAttribute("teainfo", null);
     	String str = "未填";
    %>
    <table bgcolor="#cbe2e4" border="1px" cellspacing="0px"style="border-collapse:collapse">
    	<tr>
			<td class="class1">教&nbsp;师&nbsp;号:</td>
			<td class="class2"><input id="tid" type="text" name="tid" maxlength=10 
			value="<% if(tb != null){if(tb.getTid() == null){
			 %><%=str %><%
			  } else {
			  %><%=tb.getTid() %><%
			   } }%>"/>
			<span id="tidwarn" style="display:none;">*请输入教师号</span></td>
		</tr>
		
		<tr>
			<td class="class1">姓&nbsp;&nbsp;名:</td>
			<td class="class2"><input id="tname" type="text" name="tname" maxlength=10
			value="<% if(tb != null){
				if(tb.getTname() == null){
				 %><%=str %><%
				  } else {
				  %><%=tb.getTname() %><% } }%>"/>
			<span id="tnamewarn" style="display:none;">*请输入教师姓名</span></td>
		</tr>
		<tr>
			<td class="class1">密&nbsp;&nbsp;码:</td>
			<td class="class2"><input id="tpassword" type="text" name="tpassword" maxlength=20
			value="<% if(tb != null){
				if(tb.getTpassword() == null){ %><%=str %><%
				 } else {%><%=tb.getTpassword() %><% } }%>"/>
			<span id="warn" style="display:none;">*请输入教师密码</span></td>
		</tr>
		<tr>
			<td class="class1">性&nbsp;&nbsp;别:</td>
			<td class="class2"><input id="tsex" type="text" name="tsex" maxlength=2
			value="<% if(tb != null){
				if(tb.getTsex() == null){ %><%=str %><% 
				} else {%><%=tb.getTsex() %><%
				 }} %>"
			/></td>
		</tr>
		<tr>
			<td class="class1">出生日期:</td>
			<td class="class2"><input id="tbirth" type="text" name="tbirth" maxlength=14
			value="<%if(tb != null){%><%=tb.getTbirth()%><%}%>"/></td>
		</tr>
		<tr>
			<td class="class1">职&nbsp;&nbsp;称:</td>
			<td class="class2"><input id="tjob" type="text" name="tjob" maxlength=10 
				value="<%if(tb != null){ 
				if(tb.getTjob() == null){ %><%=str %><%
				 } else {%><%=tb.getTjob() %><%
				  } }%>"/></td>
		</tr>
		<tr>
			<td class="class1">联系电话:</td>
			<td class="class2"><input id="ttel" type="text" name="ttel" maxlength=30 
			value="<% if(tb != null){
				if(tb.getTtel() == null){ %><%=str %><%
				 } else {%><%=tb.getTtel() %><%
				  } }%>"/></td>
		</tr>
		<tr>
			<td class="class1">邮&nbsp;&nbsp;箱:</td>
			<td class="class2"><input id="temail" type="text" name="temail" maxlength=20 
			value="<%if(tb != null){
				 if(tb.getTemail() == null){ %><%=str %><%
				  } else {%><%=tb.getTemail() %><%
				   } }%>"/></td>
		</tr>

		<tr>
			<td class="class3" colspan="2"><input align="middle" class="class4" type="submit" name="submit" value="提交" onclick="return check()"/></td>
		</tr>
    </table>
    </form>
    <%
  	String res=(String) session.getAttribute("teaactionres"); 
  	String teaaction1 = (String) session.getAttribute("teaaction1");
  	session.setAttribute("teaactionres", null);
  	session.setAttribute("teaaction1", null);
  	%>
    <input type="hidden" id="res" value="<%=res %>"/>
    <input type="hidden" id="teaaction1" value="<%=teaaction1 %>"/>
  </body>
</html>