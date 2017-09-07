<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="myBean.OptionalCourseBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    <style type="text/css">
    table{
    	margin-left:auto;
    	margin-right:auto;
    	font-size:16px;
    }
    .class1{
    	width:150px;
    	font-family:Microsoft YaHei;
    }
    .class2{
    	font-family:Microsoft YaHei;
    	width:300px;
    }
    a.show{
    	font-size:25px;
    	text-decoration:none;
    	paddig-left:20px;
    }
    td{
    	border:1px;
    }
    </style>
    <title>已选课程</title>
    
    <script type="text/javascript">
    function ensure(cname){
    if(confirm("是否选择"+cname+"课？")) return true;
    else return false;
    }
    function load(){
    	var res=document.getElementById("res").value;
    	if(res=="success"){
    		alert("选课成功！");
    		
    	} else if(res=="lose") {
    		alert("选择失败！");
    	} else {
    	
    	}
    }
    </script>
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
  	ArrayList<OptionalCourseBean> myCourse = (ArrayList<OptionalCourseBean>) session.getAttribute("optionalcourse");
  	
  	OptionalCourseBean ocb = new OptionalCourseBean();
  	String str = (String)request.getParameter("Page");//当前页
   	if(str==null){
    	str="1";
   	}
   	int pagesize=10;//定义每页显示记录数
   	int recordcount = myCourse.size();
   	int maxpage=0;//定义页数
   	maxpage=(recordcount%pagesize==0)?(recordcount/pagesize):(recordcount/pagesize+1);
   	int Page=Integer.parseInt(str);
   	if(Page<1){
    	Page=1;
   	}else{
    	if (Page>maxpage)
      		Page=maxpage;
   	}
  %>
  <table cellspacing="0px" style="border-collapse:collapse">
  <tr style="height: 35px; color: #000333; background-color: rgb(232, 242, 251);">
  		<td width="180px"><nobr>课程号</nobr></td>
  		<td width="160px"><nobr>课程名</nobr></td>
  		<td width="200px"><nobr>任课老师</nobr></td>
  		<td width="220px"><nobr>上课时间</nobr></td>
  		<td width="200px"><nobr>上课地点</nobr></td>
  		<td width="140px"><nobr>总人数</nobr></td>
  		<td width="140px"><nobr>剩余</nobr></td>
  		<td width="150px"><nobr>操作</nobr></td>
  </tr>
  <%if(myCourse != null){
   for(int i=0; i<pagesize; i++){ 
  		int currentrecord = (Page-1)*pagesize+i;
  		if(currentrecord > (recordcount-1))
  			break;
  		ocb = myCourse.get(currentrecord);
  %>
  <tr>
  	<td><nobr><%=ocb.getCid() %></nobr></td>
  	<td><nobr><%=ocb.getCname() %></nobr></td>
  	<td><nobr><%=ocb.getTname() %></nobr></td>
  	<td><nobr>星期<%=ocb.getWeek() %>,第<%=ocb.getStartlesson() %>节-第<%=ocb.getEndlesson() %>节</nobr></td>
  	<td><nobr><%=ocb.getLocation() %></nobr></td>
  	<td><nobr><%=ocb.getTotal() %></nobr></td>
  	<td><nobr><%=ocb.getRest() %></nobr></td>
  	<td><nobr>
  	<%if(0==ocb.getRest()){	%>
	<%="已满" %>
	<%} else {
		if(ocb.isChoosed()){
	 %>  	
	 <%="已选" %>
	 <%} else {
	 %>
	 <a href="/CourseManage/Course/STChooseCourse?cid=<%=ocb.getCid() %>" onclick="return ensure('<%=ocb.getCname() %>');" class="choose">选择</a>
	 <%} %>
  	</nobr></td>
  </tr>
  <%}
  }
  }
   %>
  </table>
  <div>
  <span>
  <span><a class="show" href="/CourseManage/STManage/STOptionalCourse.jsp?Page=1">首页</a></span>&nbsp;&nbsp;
  <span><a class="show" href="/CourseManage/STManage/STOptionalCourse.jsp?Page=<%=Page-1 %>">上一页</a></span>
  <span><a class="show" href="/CourseManage/STManage/STOptionalCourse.jsp?Page=<%=Page+1 %>">下一页</a></span>
  </span>
  </div>
  <%
  	String res=(String) session.getAttribute("choosecourseresult"); 
  	session.setAttribute("choosecourseresult", null);
  %>
  <input type="hidden" id="res" value="<%=res %>"/>
  </body>
</html>
