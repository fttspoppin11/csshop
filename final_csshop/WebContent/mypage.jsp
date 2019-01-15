<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="common.css"/>
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!-- 제이쿼리추가 -->
<script type="text/javascript">
	function coffee(){
		window.name = "parentForm";//부모창 이름
		//window.open(url,name,option);
		window.open("coffee.jsp","coffee","width=550,height=500, left=100, top=50");//학생일 경우 이거 뜸
		
	}
	function myhwlist(){
		window.name = "parentForm";//부모창 이름
		//window.open(url,name,option);
		window.open("myhomeworklist.jsp","myhw","width=900,height=600, left=100, top=50");//학생일 경우 이거 뜸
		
	}
</script> 
</head>

<body>
<%
List<DBStudent> list = null;// 내정보 불러올 리스트

DBStudent mypage= new DBStudent();

String id = (String)session.getAttribute("id");//과제 리스트에 있는 db 뿌리기
list=mypage.mypage(id);


%>
<body>
<div class="wrap">
	<img src="resource/마이페이지.png">
	<div class="menu">
		<a href="choose.jsp" style="position:absolute; top:40px; left:100px; width:100px; height:50px;">과제제출</a>
		<a href=# style="position:absolute; top:40px; left:250px; width:100px; height:50px;">지식IN</a>
		<a href=# style="position:absolute; top:40px; left:400px; width:100px; height:50px;">&#10004;<%=session.getAttribute("nickname") %>님</a>
		<a href="mypage.jsp" style="position:absolute; top:40px; left:550px; width:100px; height:50px;">마이페이지</a>
		<a href="logout.jsp" style="position:absolute; top:40px; left:700px; width:100px; height:50px;">LOGOUT</a>
	</div>
	
	<section class="section1">
    
	 	 <!-- <img src='resource/마이페이지.png' border='0'></br> -->
	 	 <div>
	 	 <div style="position: absolute; top:700px; left:600px;">
	 	 <form action="updatemypage.jsp" method="post">
	 	 <%
	 	for(int i=0;i<list.size();i++){
			DBStudent stu = list.get(i);
			%>
			<table cellpadding="30" style="font-size:30px;">	
			<tr>
			<td align="center" style="font-family:배달의민족 한나는 열한살;">이름 : <%= stu.getName() %></td>
			</tr>
			<tr>
			<td align="center" style="font-family:배달의민족 한나는 열한살;">학번 :<%= id %></td>
			</tr>
			<tr>
			<td align="center" style="font-family:배달의민족 한나는 열한살;">비밀번호 :
			<input type="password" size="20" maxlength="20" name="password"/></td>
			</tr>
			<tr>
			<td align="center" style="font-family:배달의민족 한나는 열한살;">닉네임 :
			<input type="text" size="20" name="nickname" maxlength="10" placeholder="<%=stu.getNickname() %>"/></td>
			</tr>
			<tr>
			<td align="center" style="font-family:배달의민족 한나는 열한살;"> 전화번호 : <%= stu.getTel() %></td>
			</tr>
			<tr>
			<td><input type="submit" value="정보수정" style="font-family:배달의민족 한나는 열한살; width:100px; height:50px;"/></td>
			</tr>
			</table>
		<% 
	 	}
	 	 %>
	 	<a href="javascript:myhwlist();">제출한과제보기</a>&nbsp;&nbsp;<a href=#>질문글보기</a>&nbsp;&nbsp;<a href="javascript:coffee();">커피적립현황</a>
	 	</form>	
	 	 </div>
	 	 </div>
	 	
	</section>
</div>

<footer class="footer">@copyright jung so yeong &nbsp; &nbsp; &nbsp; Tel) 010-5806-8955</footer>

</body>

	
<!-- 학생일 경우와 교수일 경우 나타나는 팝업창이 달라야함, 교수는 과제 제출 list, 학생은 과제제출 팝업창 세션값을 받아와야 하나-->

</html>

