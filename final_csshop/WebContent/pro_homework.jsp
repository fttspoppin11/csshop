<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%><%@ page import="java.util.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBSubject"%><%@ page import="java.io.*"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="common.css"/>
<title>:::서경대학교 소프트웨어학과 과제제출:::</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>

</head>
<body>
<div class="wrap">
	<img src="resource/과제제출.png">
	<div class="menu">
		<a href="pro_homework.jsp" style="position:absolute; top:40px; left:100px; width:100px; height:50px;">과제제출</a>
		<a href=# style="position:absolute; top:40px; left:250px; width:100px; height:50px;">지식IN</a>
		<a href=# style="position:absolute; top:40px; left:400px; width:100px; height:50px;">&#10004; <%= session.getAttribute("pro_name")%> &nbsp;교수님</a> 	
		<a href=# style="position:absolute; top:40px; left:550px; width:100px; height:50px;">마이페이지</a>
		<a href="logout.jsp" style="position:absolute; top:40px; left:700px; width:100px; height:50px;">LOGOUT</a>
	</div>
	
	<section class="section">
 
	<form action="saveSubjectSession.jsp" method="post">
	<div align="center" id="title" style="position:relative;">
	<h1>2018-2학기 과제 제출</h1>
	<h3><%= (String)session.getAttribute("pro_name")%> 교수님 과목</h3>
	</div>
	<% try{
		request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
		DBSubject Subject= new DBSubject();
		Connection conn = Subject.getMYSQLConnection();//db 연결
		
		String hrefname="";//src 조합할 변수
		String value="";//
		%>
		<div id="a" style="position: absolute; top:600px; left:750px; font-size:20px;">
		
		<% 
		
			
			String sql ="select * from subject where pro_name='"+(String)session.getAttribute("pro_name")+"';";
			PreparedStatement pstmt = conn.prepareStatement(sql); 
			ResultSet rs = pstmt.executeQuery();//쿼리 날려줌
			
	
			%>
		
			<!-- hw_rs.getString(0)_initia[i].jsp -->
			<% 
			while(rs.next()){
			
			
				hrefname="hw_"+rs.getString(1)+"_"+(String)session.getAttribute("pro_id")+".jsp";//주소 만들어서 출력
				value=rs.getString(1)+"."+rs.getString(4);// 코드 + 아이디
				
				%>
				<input type="radio" name="code" value="<%=value%>" /><%=rs.getString(2)%></br><!-- 과목출력 -->
				
				<% 
				
				}
			

		
		%></div>
		<input type="submit" value="과목선택" style="position: absolute; top:800px; right:850px;
		width:100px; height:50px; font-size:15px;"/><%
		Subject.close(conn);
		
		
	}catch(Exception e){
		e.printStackTrace();
	}%>
	
	</form>
	 
	</section>

</div>

<footer class="footer">@copyright jung so yeong &nbsp; &nbsp; &nbsp; Tel) 010-5806-8955</footer>

</body>
</html>
