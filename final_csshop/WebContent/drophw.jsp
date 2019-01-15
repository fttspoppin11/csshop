<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBSubject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="common.css"/>
<title>:::서경대학교 소프트웨어학과 과제제출:::</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>

</head>
<form action="drophwprocess.jsp" method="post">
<body>
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
		<a href=# style="position:absolute; top:40px; left:550px; width:100px; height:50px;">마이페이지</a>
		<a href="logout.jsp" style="position:absolute; top:40px; left:700px; width:100px; height:50px;">LOGOUT</a>
	</div>
	
	<section class="section">
   <div>
     <%

	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	String pro_id =(String)session.getAttribute("pro_id");
	String subject = (String)session.getAttribute("subject");
	//디비 연동해서 과제 목록 뿌려야함
	DBSubject list= new DBSubject();
	Connection conn = list.getMYSQLConnection();//db 연결
	List<String> hwtitle=new ArrayList<String>();//가변배열 타이틀리스트 생성
	List<String> hwtime=new ArrayList<String>();//가변배열 타이틀리스트 생성
	%>
	
	<h1>삭제할 과제를 선택하세요</h1>
	<% 
	try{
		
		String sql="select * from hw_list where subject='"+subject+"' and pro_id='"+pro_id+"' order by limitdate asc;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			
			hwtitle.add(rs.getString(3)); // 타이틀 저장
			hwtime.add(rs.getString(4)); //마감시간
			
			// 리스트 뿌려주기
		}
		
		for(int i=0;i<hwtitle.size();i++){
			String str=hwtitle.get(i)+"  "+hwtime.get(i);
			%>
			
			<%= str %><input type="checkbox" name="hwlist" value="<%=hwtitle.get(i) %>"/></br><!-- 삭제 프로세스 jsp 생성해야하나? -->
			<% 		} %>
	
	<input type="submit" value="삭제하기"/>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
	
		%>
		</form>
		</div>
	</section>
</div>

<footer class="footer">@copyright jung so yeong &nbsp; &nbsp; &nbsp; Tel) 010-5806-8955</footer>

</body>
</html>
