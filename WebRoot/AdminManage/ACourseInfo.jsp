<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.CourseBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>课程管理</title>
    
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
		var obj1 = document.getElementById("cidwarn");
		var cid = document.getElementById("cid").value;
		var obj2 = document.getElementById("cnamewarn");
		var cname = document.getElementById("cname").value;
		var choice = document.getElementById("couaction").value;
		if(choice == "0"){
		if(cid == null || cid == ""){
			obj1.style.display = "inline";
			obj2.style.display = "none";
			return false;
		} else if(cname == null || cname == ""){
			obj1.style.display = "none";
			obj2.style.display = "inline";
			return false;
		}} else {
			if(cid == null || cid == ""){
			obj1.style.display = "inline";
			obj2.style.display = "none";
			return false;
		}
		}
		return true;
	}
    function check1(){
    	if(confirm("确认提交？"))return true;
    	else return false;
    }
    function load(){
    	var res=document.getElementById("res").value;
    	var couaction1=document.getElementById("couaction1").value;
    	if(res=="success"){
    		alert(couaction1+"成功！");
    	} else if(res=="lose") {
    		alert(couaction1+"失败！");
    	} else {
    	}
    }
    </script>

  </head>
  
  <body onload="load()">
  <form action="/CourseManage/myCouServlet/AcouManage" method="post" onsubmit="return check1();">
    <select name="couaction" id="couaction">
		<option value="0" selected>录入</option>
		<option value="1">删除</option>
		<option value="2">更新</option>
		<option value="3">查询</option>
    </select>
    <%
    	CourseBean cb = (CourseBean) request.getAttribute("couinfo");
     	request.setAttribute("couinfo", null);
     	String str = "未填";
    %>
    <table bgcolor="#cbe2e4" border="1px" cellspacing="0px"style="border-collapse:collapse">
    	<tr>
			<td class="class1">课&nbsp;程&nbsp;号:</td>
			<td class="class2"><input id="cid" type="text" name="cid" maxlength=10 
			value="<% if(cb != null){if(cb.getCid() == null){
			 %><%=str %><%
			  } else {
			  %><%=cb.getCid() %><%
			   } }%>"/>
			<span id="cidwarn" style="display:none;">*请输入课程号</span></td>
		</tr>
		
		<tr>
			<td class="class1">课&nbsp;程&nbsp;名:</td>
			<td class="class2"><input id="cname" type="text" name="cname" maxlength=10
			value="<% if(cb != null){
				if(cb.getCname() == null){
				 %><%=str %><%
				  } else {
				  %><%=cb.getCname() %><% } }%>"/>
			<span id="cnamewarn" style="display:none;">*请输入课程名</span></td>
		</tr>
		<tr>
			<td class="class1">课&nbsp;程&nbsp;性&nbsp;质:</td>
			<td class="class2"><input id="cproperty" type="text" name="cproperty" maxlength=20
			value="<% if(cb != null){
				if(cb.getProperty() == null){ %><%=str %><%
				 } else {%><%=cb.getProperty() %><% } }%>"/>
			</td>
		</tr>
		<tr>
			<td class="class3" colspan="2"><input align="middle" class="class4" type="submit" name="submit" value="提交" onclick="return check()"/></td>
		</tr>
    </table>
    </form>
    <%
  	String res = (String) session.getAttribute("couactionres"); 
  	String couaction1 = (String) session.getAttribute("couaction1");
  	session.setAttribute("couactionres", null);
  	session.setAttribute("couaction1", null);
  	%>
    <input type="hidden" id="res" value="<%=res %>"/>
    <input type="hidden" id="couaction1" value="<%=couaction1 %>"/>
  </body>
</html>