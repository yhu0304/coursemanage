<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.OptionalCourseBean" %>
<%@ page import="java.util.ArrayList"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>已选课程</title>
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
    function ensure(cname){
    if(confirm("是否退选"+cname+"课？")) return true;
    else return false;
    }
    function load(){
    	var res=document.getElementById("res").value;
    	if(res=="success"){
    		alert("退选课程成功！");
    		
    	} else if(res=="lose") {
    		alert("退选课程失败！");
    	} else {
    	
    	}
    }
    </script>

  </head>
  
  <body onload="load()">
  <%
   ArrayList<OptionalCourseBean> myCourse = (ArrayList<OptionalCourseBean>) session.getAttribute("mychoosedcourse");
    
    %>
  <table cellspacing="0px" style="border-collapse:collapse">
  	<tr style="height: 35px; color: #000333; background-color: rgb(232, 242, 251);">
  		<td width="180px"><nobr>课程号</nobr></td>
  		<td width="160px"><nobr>课程名</nobr></td>
  		<td width="200px"><nobr>任课老师</nobr></td>
  		<td width="220px"><nobr>上课时间</nobr></td>
  		<td width="200px"><nobr>上课地点</nobr></td>
  		<td width="150px"><nobr>操作</nobr></td>
  </tr>
  <%
  	OptionalCourseBean ocb = new OptionalCourseBean();
   for(int i=0; i<myCourse.size(); i++){ 
  		ocb = myCourse.get(i);
  %>
  <tr>
  	<td><nobr><%=ocb.getCid() %></nobr></td>
  	<td><nobr><%=ocb.getCname() %></nobr></td>
  	<td><nobr><%=ocb.getTname() %></nobr></td>
  	<td><nobr>星期<%=ocb.getWeek() %>,第<%=ocb.getStartlesson() %>节-第<%=ocb.getEndlesson() %>节</nobr></td>
  	<td><nobr><%=ocb.getLocation() %></nobr></td>
  	<td><nobr>
	 <a href="/CourseManage/DropCourse/STDropOptCourse?cid=<%=ocb.getCid() %>" onclick="return ensure('<%=ocb.getCname() %>');" class="choose">退选</a>
  	</nobr></td>
  </tr>
  <%} %>
  </table>
  <%
  	String res=(String) session.getAttribute("dropcourseresult"); 
  	session.setAttribute("dropcourseresult", null);
  %>
  <input type="hidden" id="res" value="<%=res %>"/>
  </body>
</html>
