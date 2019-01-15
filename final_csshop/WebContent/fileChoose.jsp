<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%>
    <%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBSubject"%><%@page import="java.io.File"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 제출하기 팝업창</title>
<link rel="stylesheet" href="common.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!-- 제이쿼리추가 -->
<script>
function fileCheck(obj){
	if(!obj.filename.value){
		document.getElementById("nofilename").innerHTML="파일을 추가해주세요";
		obj.filename.value="";
		return false;
	}
	
}
</script>
</head>
<body>
<%
	if(session.getAttribute("id")==null){//로그인 안하고 접근할때
		response.sendRedirect("main.jsp"); //메인창으로 돌려보냄
		
	}
request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	
%>

   <!-- enctype="multipart/form-data" 파일이나 대용량 데이터 보낼때 데이터 전송 방식 --> 
<div class="wrap">
	<img src="resource/과제제출.png">
	<div class="menu">
		<% if(session.getAttribute("nickname")==null){
				%><a href="homework.jsp" style="position:absolute; top:40px; left:100px; width:100px; height:50px;">과제제출</a><% 
			}%>
			<% if(session.getAttribute("nickname")!=null){
				%><a href="choose.jsp" style="position:absolute; top:40px; left:100px; width:100px; height:50px;">과제제출</a><%
			}%> 
		
		<a href=# style="position:absolute; top:40px; left:250px; width:100px; height:50px;">지식IN</a>
		<a href=# style="position:absolute; top:40px; left:400px; width:100px; height:50px;">&#10004;
		<% if(session.getAttribute("nickname")==null){
				%><%= session.getAttribute("pro_name") %>&nbsp;교수님</a><% 
			}%>
			<% if(session.getAttribute("nickname")!=null){
				%><%= session.getAttribute("nickname") %>&nbsp;님</a><%
			}%>
			<% if(session.getAttribute("nickname")==null){
				%><a href=# style="position:absolute; top:40px; left:550px; width:100px; height:50px;">마이페이지</a><% 
			}%>
			<% if(session.getAttribute("nickname")!=null){
				%><a href="mypage.jsp" style="position:absolute; top:40px; left:550px; width:100px; height:50px;">마이페이지</a><%
			}%> 
		
		<a href="logout.jsp" style="position:absolute; top:40px; left:700px; width:100px; height:50px;">LOGOUT</a>
	</div>
	
	<section class="section">
       <!-- enctype="multipart/form-data" 파일이나 대용량 데이터 보낼때 데이터 전송 방식 --> 
	<h1 style="color:red">파일 용량 : 10MB 이하</h1>
	<form name="fileForm" method="post" enctype="multipart/form-data" onsubmit="return fileCheck(this)"; action="hwprocess.jsp"> 
	
	 학번 : <%= session.getAttribute("id") %><br/>
	 학생이름 : <%= session.getAttribute("name") %><br/>
	
	 제목 : <%= session.getAttribute("title") %> <br><!-- 작성자랑 제목은 미리 입력시킨 양식이 있음 -->
	
	 파일명 : <input type="file" name="filename"><br/>
	 <p id="nofilename" style="color:red;"></p>
	
	 내용 : (추가할예정)</br>
	 <input type="submit" value="제출하기"><br/>
	
	</form>
	</section>

</div>

<footer class="footer">@copyright jung so yeong &nbsp; &nbsp; &nbsp; Tel) 010-5806-8955</footer>

</body>
</html>
   