<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="myBean.OpinionBean" %>
<%@ page import="java.util.ArrayList"%>
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
	

  </head>
  
  <body>
  <%
   ArrayList<OpinionBean> opinion = (ArrayList<OpinionBean>) request.getAttribute("opinioninfo");
    %>
  <table cellspacing="0px" style="border-collapse:collapse">
  	<tr style="height: 35px; color: #000333; background-color: rgb(232, 242, 251);">
  		<td width="180px"><nobr>来源</nobr></td>
  		<td width="800px"><nobr>内容</nobr></td>
  </tr>
  <%
  	OpinionBean ob = new OpinionBean();
   for(int i=0; i<opinion.size(); i++){ 
  		ob = opinion.get(i);
  %>
  <tr>
  	<td><nobr><%=ob.getFrom() %></nobr></td>
  	<td><nobr><%=ob.getTxt() %></nobr></td>
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
