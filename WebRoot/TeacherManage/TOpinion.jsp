<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    	if(confirm("确定提交？"))return true;
    	else return false;
    }
    function check1(){
    	var txt=document.getElementById("txt").value;
    	if(txt==null||txt==""){
    		alert("内容不能为空");
    		return false;
    	} else return true;
    }
    function load(){
    	var res=document.getElementById("res").value;
    	if(res=="success"){
    		alert("提交成功！");
    		
    	} else if(res=="lose") {
    		alert("提交失败！");
    	} else {
    	}
    }
    </script>

  </head>
  
  <body onload="load()">
  <form action="/CourseManage/Opinion/TOpinion" method="post" onsubmit="return check();">
    <table bgcolor="#cbe2e4" border="1px" cellspacing="0px"style="border-collapse:collapse">
    	<tr><td class="class2" style="text-align:center;">您的意见：</td></tr>
    	<tr>
    		<td class="class2"><textarea id="txt" name="txt" rows="4" cols="50"></textarea></td>
    	</tr>
    	<tr><td class="class3" colspan="1"><input class="class4" type="submit" name="submit" value="提交" align="middle" onclick="return check1()"/></td></tr>
    </table>
    </form>
    <%
  	String res=(String) session.getAttribute("opinionres"); 
  	session.setAttribute("opinionres", null);
  	%>
    <input type="hidden" id="res" value="<%=res %>"/>
  </body>
</html>