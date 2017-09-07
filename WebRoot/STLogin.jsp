<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>大学生课务管理系统-学生平台</title>
    <script type="text/javascript">
	function check(){
		var obj1 = document.getElementById("namewarn");
		var userID = document.getElementById("userID").value;
		var obj2 = document.getElementById("passwordwarn");
		var password = document.getElementById("password").value;
		if((userID == null || userID == "") && (password == null || password == "")){
			obj1.style.display = "inline";
			obj2.style.display = "inline";
			return false;
		} else if((userID != null && userID != "") && (password == null || password == ""))
			{
				obj1.style.display = "none";
				obj2.style.display = "inline";
				return false;
			}
			else if((userID == null || userID == "") && (password != null && password != "")){
				obj1.style.display = "inline";
				obj2.style.display = "none";
				return false;
			}
		
		return true;
	}
	
	function load(){
    	var res=document.getElementById("res").value;
		if(res=="lose") {
    		alert("用户名或密码错误!");
    	} else {
    	
    	}
    }
</script>
    <style type="text/css">
body {
	background-repeat:no-repeat;
	background-position:0px 0px;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
form {
	float:center;
	background-attachment:scroll;
	padding-bottom:175px;
	padding-left:500px;
	padding-right:60px;
	padding-top:210px;
	margin-left:auto;
	margin-right:auto;
	margin-bottom:0px;
	margin-top:0px;
	width:365px;
	height:215px;
}
.class1{
	font-family:Microsoft YaHei;
	font-size:12px;
	text-align:right;
	width:60px;
	height:17px;
}
.class2{
	width:170px;
	height:17px;
	font-family:Microsoft YaHei;
	font-size:12px;
}
.class3{
	width:100px;
	height:17px;
	background-color:#D0CC73;
	font-size:18px;
}
.class4{
	font-family:Microsoft YaHei;
}
</style>
</head>

<body background="images/bgd.jpg" onload="load()">

<form id="form1" action="/CourseManage/loginServlet/StudentLoginServlet" method="post" onsubmit="return check();">
	<table>
		<tr>
			<td class="class1">用&nbsp;户&nbsp;名:</td>
			<td class="class2"><input id="userID" type="text" name="userID" maxlength=30 /></td>
		</tr>
		<tr>
			<td class="class1"></td>
			<td class="class2"><span id="namewarn" style="display:none;">*请输入用户名</span></td>
		</tr>
		
		<tr>
			<td class="class1">密&nbsp;码:</td>
			<td class="class2"><input id="password" type="password" name="password" maxlength=30 /></td>
		</tr>
		<tr>
			<td class="class1"></td>
			<td class="class2"><span id="passwordwarn" style="display:none;">*请输入密码</span></td>
		</tr>
		<tr>
			<td class="class1"></td>
			<td class="class2"><input class="class4" type="submit" name="submit" value="提交"/></td>
		</tr>
	</table>
</form>
<%String res= (String) session.getAttribute("loginres");
	session.setAttribute("loginres", null);
 %>
<input type="hidden" id="res" value="<%=res%>"/>
</body>
</html>