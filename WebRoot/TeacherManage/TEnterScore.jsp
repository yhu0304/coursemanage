<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.CourseBean" %>
<%@ page import="myBean.StuTeaCourseBean" %>
<%@ page import="java.util.ArrayList"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>录入成绩</title>
    
   	<script type="text/javascript">
   	function check(){
   		var te=document.getElementById("cid").value;
    	if(te=="0"){
    		alert("没有选择任何课程");
    		return false;
    	} else return true;
   	}
   	 function load(){
    	var res=document.getElementById("res").value;
    	if(res=="success"){
    		alert("录入成绩成功！");
    		
    	} else if(res=="lose") {
    		alert("录入成绩失败，请重新录入！");
    	} else {
    	
    	}
    }
   	</script>
   	<style type="text/css">
   	 .class3{
    	font-family:Microsoft YaHei;
    	width:450px;
    	text-align:center;
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
  
  <body onload="load()">
  <%
  	 CourseBean cb = null;
  ArrayList<CourseBean> mycb = (ArrayList<CourseBean>) session.getAttribute("allcourse"); %>
  <form action="/CourseManage/ScoreServlet/TEnterScore" method="post" onsubmit="return check()">
  	课程：<select name="cid">
  	<%

  	if(mycb!=null&&mycb.size()>0) {
  		for(int i=0;i<mycb.size();i++){
  			cb = mycb.get(i);
  	%>
	    	<option value="<%=cb.getCid() %>" selected><%=cb.getCname() %></option>
	    	<%} }
	    	else {
	    	 %>
	    	 <option value="0" selected>无</option>
	    	 <%}
	    	 %>
	    </select>
	    <input type="submit" id="search" name="search" value="查询"/>
  </form>
  <form action="/CourseManage/ScoreServlet/TAddScore" method="post">
  	<table cellspacing="0px" style="border-collapse:collapse">
  	<%if(session.getAttribute("mystudent") != null && session.getAttribute("mystudent") != null){ %>
  	<tr style="height: 35px; color: #000333; background-color: rgb(232, 242, 251);">
  		<td width="200px"><nobr>学号</nobr></td>
  		<td width="200px"><nobr>姓名</nobr></td>
  		<td width="200px"><nobr>成绩</nobr></td>
  	</tr>
  	<% 
 		StuTeaCourseBean stcb =null;
 		@SuppressWarnings("unchecked")
 		ArrayList<StuTeaCourseBean> mycourse =(ArrayList<StuTeaCourseBean>) session.getAttribute("mystudent");
  		if(mycourse != null){
  		for(int i=0; i<mycourse.size(); i++){
  			stcb = mycourse.get(i); 
  	 %>
 	 <tr>
  		<td><%=stcb.getSid() %></td>
  		<td><%=stcb.getSname() %></td>
  		<td><input type="text" name="<%=stcb.getSid()%>"/><input type="hidden" /></td>
  	</tr>
  	<%}
  		}
  	 %>
  	 <tr><td class="class3" colspan="2"><input class="class4" type="submit" name="submit" value="提交" align="middle"/></td></tr>
	<%} %>
  </table>
  <input type="hidden" name="curcid" value="<%=session.getAttribute("curcid") %>"/>
  </form>
  <%String res=(String) session.getAttribute("addscoreres");
    	session.setAttribute("addscoreres", null);
     %>
    <input type="hidden" id="res" value="<%=res %>"/>
  </body>
</html>
