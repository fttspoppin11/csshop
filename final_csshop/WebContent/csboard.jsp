<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBSubject"%>  <%@ page import="final_csshop.DBBoard"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="main.css" type="text/css" rel="stylesheet">
<title>컴과지식인</title><!-- 카테고리는 c언어 java android 기타 -->
<!-- 질문 : 번호, 제목, 작성자(닉네임), 작성일, 조회수 -->
<!-- 답변 : 번호, 제목, 작성자(닉네임), 작성일, 조회수  질문과 같게, 
왜냐면 네이버처럼 질문글을 눌렀을 때 답변이 보이게 하니까-->
<!-- 디폴트 페이지 == c언어 -->
</head>
<body>

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
				<li><% if(session.getAttribute("nickname")==null){
				%><a href="homework.jsp">과제제출</a><% 
			}%>
			<% if(session.getAttribute("nickname")!=null){
				%><a href="choose.jsp">과제제출</a><%
			}%>
				</li>
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
				<li><% if(session.getAttribute("nickname")==null){
				%><a href="pro_mypage.jsp"><% }%>
			<% if(session.getAttribute("nickname")!=null){
				%><a href="mypage.jsp"><%
			}%>MYPAGE</a></li>
				<li><a href="logout.jsp">LOGOUT</a>
			</ul>
			
		</li>		
	</ul> 
   </header>
   </br> </br> </br> </br> </br> </br> </br> </br> 
   <div id="banner_cotainer">
   	<img id='banner' src='resource/지식IN.png' border='0'>
	</div>
   </br> </br> </br> </br> </br> </br> </br> </br> 
   
    <section class="section">
	모아 보기 : <a href=#>c언어</a>&nbsp;&nbsp;<a href=#>java</a>&nbsp;&nbsp;<a href=#>android</a>&nbsp;&nbsp;<a href=#>기타</a>&nbsp;
	</br></br></br></br></br></br>
	<div align="center" style="position: absolute; top:700px; left:450px; width:1000px; height:600px;">
	<%
	
	try{
		
		
		request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
		List<DBBoard> list = null;// 글 불러올 배열리스트

		DBBoard question= new DBBoard();
	
		list=question.selectAll();//글내용 다 가져옴
	
		int i=0;
		%><table border="1" style="width:800px; height:500px;">
			<tr>
				
				<td align="center">글번호</td>
				<td align="center">분류</td>
				<td align="center">글제목</td>
				<td align="center">작성자</td>
				<td align="center">작성시간</td>
				<td align="center">조회수</td>
				
				</tr><%
		
		System.out.println("불러온 글목록 : "+list.size());//리스트가 왜 안오지?
				
		for(i=0;i<list.size();i++){
			DBBoard b = list.get(i);
			
			%>	
				<tr>
				
				<td align="center"><%=b.getNum() %></td>
				<td align="center"><%=b.getCategory() %></td>
				<td align="center"><a href="showcontent.jsp?title=<%=b.getTitle()%>"><%=b.getTitle() %></a></td>
				<td align="center"><%=b.getUser() %></td>
				<td align="center"><%=b.getDate() %></td>
				<td align="center"><%=b.getCount() %></td>
				
				</tr>
			<% 
			
			
		}%></table>
		</div>
		<% 
	
	}catch(Exception e){
		
		e.printStackTrace();
	}
	
	%>
	<div style="position: absolute; top:1300px; left:700px; width:500px; height:100px;"><a href="write.html">질문하기</a></div>
	 
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


</body>
</html>