<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%><%@ page import="java.util.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%><%@ page import="java.io.*"%>
    <%@ page import="final_csshop.DBProfessor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="common.css"/>
<title>:::서경대학교 소프트웨어학과 과제제출:::</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>

<%
if(session.getAttribute("nickname")==null){
	response.sendRedirect("main.jsp");
}

%>
</head>
<body>
<div class="wrap">
	<img src="resource/과제제출.png">
	<div class="menu">
		<a href="choose.jsp" style="position:absolute; top:40px; left:100px; width:100px; height:50px;">과제제출</a>
		<a href=# style="position:absolute; top:40px; left:250px; width:100px; height:50px;">지식IN</a>
		<a href=# style="position:absolute; top:40px; left:400px; width:100px; height:50px;">&#10004;<%=session.getAttribute("nickname") %>님</a>
		<a href="mypage.jsp" style="position:absolute; top:40px; left:550px; width:100px; height:50px;">마이페이지</a>
		<a href="logout.jsp" style="position:absolute; top:40px; left:700px; width:100px; height:50px;">LOGOUT</a>
	</div>
	
	<section class="section1">
	    <h1 align="center">STEP 1. 교수님을 선택하세요</h1></br>
	    <h3>장문수, 정태의 교수님 부분은 구현 중입니다. 다른 교수님을 선택하세요</h3>
	    <form action="chooseprofessor.jsp" method="post" name="choose" style="font-size:30px;">
			<input type="radio" name="pro_name" value="곽재창" />곽재창
			<input type="radio" name="pro_name" value="김치용" />김치용
			<input type="radio" name="pro_name" value="노정규" />노정규
			<input type="radio" name="pro_name" value="류귀열" />류귀열
			<input type="radio" name="pro_name" value="류석원" />류석원</br></br>
			<input type="radio" name="pro_name" value="민미경" />민미경
			<input type="radio" name="pro_name" value="박종준" />박종준
			<input type="radio" name="pro_name" value="신우창" />신우창
			<input type="radio" name="pro_name" value="장문수" />장문수
			<input type="radio" name="pro_name" value="정태의" />정태의</br>
		</br></br>
		
		<input type="submit" value="선택" style="width:100px; height:50px; font-size:20px;"/>
	 
	</form>
		 
		</section>
</div>

<footer class="footer">@copyright jung so yeong &nbsp; &nbsp; &nbsp; Tel) 010-5806-8955</footer>

</body>
</html>
