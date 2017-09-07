<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("GBK"); %>
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
		var obj2 = document.getElementById("cidwarn");
		var cid = document.getElementById("cid").value;
		var obj3 = document.getElementById("warn");
		var score = document.getElementById("score").value;
		if(sid == null || sid == ""){
			obj1.style.display = "inline";
			obj2.style.display = "none";
			obj3.style.display = "none";
			return false;
		} else if(cid == null || cid == ""){
			obj1.style.display = "none";
			obj2.style.display = "inline";
			obj3.style.display = "none";
			return false;
		} else if(score == null || score == ""){
			obj1.style.display = "none";
			obj2.style.display = "none";
			obj3.style.display = "inline";
			return false;
		}
		return true;
	}
    function check1(){
    	if(confirm("确定提交修改？"))return true;
    	else return false;
    }
    function load(){
    	var res=document.getElementById("res").value;
    	if(res=="success"){
    		alert("修改成功！");
    		
    	} else if(res=="lose") {
    		alert("修改失败！");
    	} else {
    	}
    }
    </script>

  </head>
  
  <body onload="load()">
  <form action="/CourseManage/ScoreServlet/TChangeScore" method="post" onsubmit="return check1();">
    <table bgcolor="#cbe2e4" border="1px" cellspacing="0px"style="border-collapse:collapse">
    	<tr>
			<td class="class1">学&nbsp;&nbsp;号:</td>
			<td class="class2"><input id="sid" type="text" name="sid" maxlength=30 />
			<span id="sidwarn" style="display:none;">*请输入学生号</span></td>
		</tr>
		
		<tr>
			<td class="class1">课&nbsp;程&nbsp;号:</td>
			<td class="class2"><input id="cid" type="text" name="cid" maxlength=30 />
			<span id="cidwarn" style="display:none;">*请输入课程号</span></td>
		</tr>
		<tr>
			<td class="class1">成&nbsp;&nbsp;绩:</td>
			<td class="class2"><input id="score" type="text" name="score" maxlength=30 />
			<span id="warn" style="display:none;">*请输入成绩</span></td>
		</tr>
		<tr>
			<td class="class3" colspan="2"><input align="middle" class="class4" type="submit" name="submit" value="提交修改" onclick="return check()"/></td>
		</tr>
    </table>
    </form>
    <%
  	String res=(String) session.getAttribute("changescoreres"); 
  	session.setAttribute("changescoreres", null);
  	%>
    <input type="hidden" id="res" value="<%=res %>"/>
  </body>
</html>