<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.TeacherBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% TeacherBean tb = (TeacherBean) request.getAttribute("teainfo"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    <title>修改信息</title>
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
    	if(confirm("确定修改？"))return true;
    	else return false;
    }
    function check1(tel,email){
    	var te=document.getElementById("tel").value;
    	var em=document.getElementById("email").value;
    	if(tel==te&&email==em){
    		alert("未做修改");
    		return false;
    	} else return true;
    }
    function load(){
    	var res=document.getElementById("res").value;
    	if(res=="success"){
    		alert("修改信息成功！");
    		
    	} else if(res=="lose") {
    		alert("修改信息失败！");
    	} else {
    	
    	}
    }
    </script>

  </head>
  
  <body onload="load()">
  <form action="/CourseManage/changeInfoServlet/TChangeInfo2" method="post" onsubmit="return check();">
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
    		<td class="class2"><input id="tel" class="class4" name="telephone" type="text" value="<%=tb.getTtel()%>"/></td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">邮箱：</td>
    		<td class="class2"><input id="email" class="class4" name="email" type="text" value="<%=tb.getTemail()%>"/></td>
    	</tr>
    	<tr><td class="class3" colspan="2"><input class="class4" type="submit" name="submit" value="提交修改" align="middle" onclick="return check1('<%=tb.getTtel() %>','<%=tb.getTemail() %>')"/></td></tr>
    </table>
    </form>
    <%
  	String res=(String) session.getAttribute("changeinfores"); 
  	session.setAttribute("changeinfores", null);
  	%>
    <input type="hidden" id="res" value="<%=res %>"/>
  </body>
</html>
