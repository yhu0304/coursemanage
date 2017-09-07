<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="myBean.StuTeaCourseBean"%>
<%@ page import="dao.ShowCourse" %>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>个人课表</title>
    <style type="text/css">
    td{
    	text-align:center;
    }
    .class1{
    	width:135px;
    	height:30px;
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
  
  <body>
  <%
  	@SuppressWarnings("unchecked")
  	ArrayList<StuTeaCourseBean> myCourse = (ArrayList<StuTeaCourseBean>) request.getAttribute("courseinfo");
  %>
  <table border="1px" cellspacing="0px" style="border-collapse:collapse">
  	<tr style="height: 50px; color: #000333; font-weight: bold; background-color: rgb(232, 242, 251);">
  		<td width="45px"><nobr>周次</nobr>
  		<nobr>/星期</nobr></td>
  		<td class="class1"><nobr>星期一</nobr></td>
  		<td class="class1"><nobr>星期二</nobr></td>
  		<td class="class1"><nobr>星期三</nobr></td>
  		<td class="class1"><nobr>星期四</nobr></td>
  		<td class="class1"><nobr>星期五</nobr></td>
  		<td class="class1"><nobr>星期六</nobr></td>
  		<td class="class1"><nobr>星期日</nobr></td>
  	</tr>
  	<%
  		for(int i = 1; i <13 ; i++)
  	  	  	{
  	%>
  	<tr style="height:120px;">
  		<td><%=i%></td>
  		<%
  			for(int j=1; j<8; j++)
  		  		  			{
  		%>
  		 <td><nobr>
  		 <%=ShowCourse.show(myCourse, j, i, "cname")%>
  		 </nobr>
  		 <br/>
  		 <nobr>
  		 <%=ShowCourse.show(myCourse, j, i, "property")%>
  		 </nobr>
  		 <br />
  		 <nobr>
  		 <%=ShowCourse.show(myCourse, j, i, "location")%>
  		 </nobr>
  		 </td>
  		 <%}%>
  	</tr>
  	<%} %>
  </table>
  
  </body>
</html>
