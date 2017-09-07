<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>修改密码</title>
    
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
    	if(confirm("确定修改为新密码？")) return true;
    	else return false;
    }
    function check1(){
    	var oldpass=document.getElementById("oldpass").value;
    	var newpass=document.getElementById("newpass").value;
    	var confirm=document.getElementById("confirm").value;
    	var oldpasswarn=document.getElementById("oldpasswarn");
    	var newpasswarn=document.getElementById("newpasswarn");
    	var confirmwarn=document.getElementById("confirmwarn");
    	if(oldpass==null||oldpass==""){
    		oldpasswarn.style.display="inline";
    	 	newpasswarn.style.display="none";
    		confirmwarn.style.display="none";
    	 	return false;
    	}else if(newpass==null||newpass==""){
    		oldpasswarn.style.display="none";
    		newpasswarn.style.display="inline";
    		confirmwarn.style.display="none";
    		return false;
    	}else if(confirm==null||confirm==""){
    		oldpasswarn.style.display="none";
    		newpasswarn.style.display="none";
    		confirmwarn.style.display="inline";
    		return false;
    	}else if(confirm!=newpass){
    		oldpasswarn.style.display="none";
    		newpasswarn.style.display="none";
    		confirmwarn.style.display="none";
    		newpass.value="";
    		confirm.value="";
    		alert("新密码与确认密码不一致！");
    		return false;
    	}
    	return true;
    }
    function load(){
    	var res=document.getElementById("res").value;
    	if(res=="success"){
    		alert("修改密码成功！");
    		
    	} else if(res=="lose") {
    		alert("修改密码失败,请检查原密码是否正确！");
    	} else {
    	
    	}
    }
    
    </script>

  </head>
  
  <body onload="load()">
  <form action="/CourseManage/ChPassword/TChangePassword" method="post" onsubmit="return check();">
    <table bgcolor="#cbe2e4" border="1px" cellspacing="0px"style="border-collapse:collapse">
    	<tr>
    		<td class="class1" style="text-align:center;">原密码：</td>
    		<td class="class2"><input type="password" name="oldpass" id="oldpass"/>
    		<span id="oldpasswarn" style="display:none;">*请输入原密码</span>
    		</td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">新密码：</td>
    		<td class="class2"><input type="password" name="newpass" id="newpass"/>
    		<span id="newpasswarn" style="display:none;">*请输入新密码</span>
    		</td>
    	</tr>
    	<tr>
    		<td class="class1" style="text-align:center;">确认密码：</td>
    		<td class="class2"><input type="password" name="confirm" id="confirm"/>
    		<span id="confirmwarn" style="display:none;">*请确认密码</span>
    		</td>
    	</tr>
    	<tr><td class="class3" colspan="2"><input class="class4" type="submit" name="submit" value="提交修改" align="middle" onclick="return check1()"/></td></tr>
    </table>
    </form>
    <%String res=(String) session.getAttribute("changepasswordres");
    	session.setAttribute("changepasswordres", null);
     %>
    <input type="hidden" id="res" value="<%=res %>"/>
    </body>
</html>
