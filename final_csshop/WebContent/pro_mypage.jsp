<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link href="mypage.css" type="text/css" rel="stylesheet"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!-- 제이쿼리추가 -->

</head>

<body>
<%
List<DBStudent> list = null;// 내정보 불러올 리스트

DBStudent mypage= new DBStudent();

String pro_id = (String)session.getAttribute("pro_id");//과제 리스트에 있는 db 뿌리기
//list=mypage.mypage(id);


%>
<div class="wrap">
    <header class="header">
    	<a href="main_ok.jsp"><img src="resource/로고.png"/></a>
    	 </br> 
    	
    	<ul class="m">
		<li>
			<a href=#>ABOUT</a>
		</li>	
		<li>
			<a href=#>MENU</a>
			<ul class="s">
				<li><a href="homework.jsp">과제제출</a></li>
				<li><a href="csboard.jsp">지식IN</a>
			</ul>
		</li>	
		<li>
			<a href=#>&#10004;&nbsp;
			
			<% if(session.getAttribute("nickname")==null){
				%><%= session.getAttribute("pro_name") %>&nbsp;교수님</a><% 
			}%>
			<% if(session.getAttribute("nickname")!=null){
				%><%= session.getAttribute("nickname") %>&nbsp;님</a><%
			}%>
				
			<ul class="s">
				<li><a href="mypage.jsp">MYPAGE</a></li>
				<li><a href="logout.jsp">LOGOUT</a>
			</ul>
			
		</li>		
	</ul> 
   </header>
   </br> </br> </br> </br> </br> </br> </br> </br> 
   <div id="banner_cotainer">
   	<img id='banner' src='resource/마페.png' border='0'>
	</div>
   </br> </br> </br> </br> </br> </br> </br> </br> 
    <section class="section">
    
	 	 <!-- <img src='resource/마이페이지.png' border='0'></br> -->
	 	 <div id="mypage"><img src='resource/마이페이지.png' border='0'>
	 	 <div style="position: absolute; top:970px; left:780px;">
	 	 <form action=# method="post">
	 	<p align="center" style="font-family:배달의민족 한나는 열한살; font-size:70px; ">준비중입니다</h1>
		
	 	</form>	
	 	 </div>
	 	 </div>
	 	
	</section>
</div>
<footer class="footer">@copyright jung so yeong &nbsp; &nbsp; &nbsp; Tel) 010-5806-8955</footer>


<script>
 $(".s").hide();
 $(".m>li").hover(function(){
	 $(this).find(".s").stop().slideDown();
 },function(){
	 $(this).find(".s").stop().slideUp();
 });
</script>
</form>
</body>

	
<!-- 학생일 경우와 교수일 경우 나타나는 팝업창이 달라야함, 교수는 과제 제출 list, 학생은 과제제출 팝업창 세션값을 받아와야 하나-->

</html>
