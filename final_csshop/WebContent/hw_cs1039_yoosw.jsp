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
<script type="text/javascript">
	function fileChoose(){
		window.name = "parentForm";//부모창 이름
		//window.open(url,name,option);
		window.open("fileChoose.jsp","login","width=500,height=500, left=100, top=50");//학생일 경우 이거 뜸
		
	}
	function fileList(){
		window.name = "parentForm";//부모창 이름
		//window.open(url,name,option);
		window.open("fileList.jsp","login","width=500,height=500, left=100, top=50");//교수일 경우 이거 뜸
	}
	function check(obj){
		if(!obj.title.value || obj.title.value.trim().length==0){
			document.getElementById("nofilename").innerHTML="과제를 선택하세요";
			return false;
		}
</script> 
<form action="saveTitleSession.jsp" method="post">
<body>
<%

String id = (String)session.getAttribute("id");//과제 리스트에 있는 db 뿌리기
%>
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
	<h1 align="center">2018-2학기 과제 제출(류석원 교수님)</h1><!-- 전달사항도 같이 띄움 -->
	<div align="center" >
	<h2>컴퓨터그래픽스</h2><br/>
	<%

	DBSubject list= new DBSubject();
	Connection conn = list.getMYSQLConnection();//db 연결
	List<String> hwtitle=new ArrayList<String>();//가변배열 타이틀리스트 생성
	List<String> hwtime=new ArrayList<String>();//가변배열 타이틀리스트 생성
	
	
	int count=0;
	
	try{
		String sql = "select * from hw_list where subject='cs1039' and pro_id='yoosw' order by limitdate asc;"; 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			
			hwtitle.add(rs.getString(3)); // 타이틀 저장
			hwtime.add(rs.getString(4)); //마감시간
			
			
			// 리스트 뿌려주기
		}
		
		
	if(id!=null){//학생일 경우
		session.setAttribute("pro_id","jkrho"); 
		
		
		for(int i=0;i<hwtitle.size();i++){
		%> 
		<input type="radio" name="title" value="<%=hwtitle.get(i)%>" /><%=hwtitle.get(i)%>&nbsp;(~<%=hwtime.get(i)%>까지)
		</br> 
		
		<%}%>
		<input type="submit" value="과제선택"/>

		<% 	}// 세션값이 2로 시작할 경우 -> 학생
	else{

		for(int i=0;i<hwtitle.size();i++){//hwtitle.get(i) = 과목 타이틀, 과목 리미트
		%> 
		<input type="radio" name="title" value="<%=hwtitle.get(i)%>" /><%=hwtitle.get(i)%>&nbsp;(~<%=hwtime.get(i)%>까지)
		</br> 
		
		<%}%>
		<input type="submit" value="과제선택"/>
		<p id="nofilename" style="color:red;"></p>
		</br></br><a href="addhw.jsp">과제 추가</a>
		<a href="drophw.jsp">과제 삭제</a>
		<%
		
			}
	
	list.close(conn);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	
		%>
		</div>
	 
	</section>

</div>

<footer class="footer">@copyright jung so yeong &nbsp; &nbsp; &nbsp; Tel) 010-5806-8955</footer>

</body>
</html>