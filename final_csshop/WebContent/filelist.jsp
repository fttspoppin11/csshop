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
	
	<section class="section1">
    <div>

	 <%


	try{
		request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
		
		
		String title = (String)session.getAttribute("title");
		String pro_id= (String)session.getAttribute("pro_id");
		//System.out.println(title);
		
		DBSubject filelist= new DBSubject();	
		Connection conn = filelist.getMYSQLConnection();//db 연결
		
		List<String> hwstu_id=new ArrayList<String>();//가변배열 타이틀리스트 생성
		List<String> hwfilename=new ArrayList<String>();//가변배열 타이틀리스트 생성
		List<String> hwtime=new ArrayList<String>();//가변배열 타이틀리스트 생성
		List<String> hwpath=new ArrayList<String>();//가변배열 타이틀리스트 생성
		List<String> hwscore=new ArrayList<String>();//가변배열 타이틀리스트 생성
			
		String sql = "select * from homework where title='"+title+"' order by stu_id asc;" ; //제출한 학생
		PreparedStatement pstmt = conn.prepareStatement(sql);
				
		ResultSet rs = pstmt.executeQuery();
		
		%><h1><%= title%> 제출 학생 리스트</h1>
		
		<%
				
	 		while(rs.next()){
				hwstu_id.add(rs.getString(1)); // 학번
				hwfilename.add(rs.getString(2)); //파일명
				hwtime.add(rs.getString(7)); // 마감시간
				hwpath.add(rs.getString(6)+"\\"+rs.getString(2)); //파일저장경로
				hwscore.add(rs.getString(8));//점수
				}
		
		
		for(int i=0;i<hwstu_id.size();i++){
			%> 
			<p><form action="scoreprocess.jsp">
			<%=i+1 %>. 학번 : <%= hwstu_id.get(i)%>
		 파일명 : <input type="text" name="filename" value="<%= hwfilename.get(i)%>" readonly="readonly">
			
			 <%
			
			out.write("<a href=\""+request.getContextPath()+"/filedownloadAction?file="+
			java.net.URLEncoder.encode(hwfilename.get(i), "UTF-8")+"\">"+hwfilename.get(i)+"</a>");
			//파일 다운 서블렛 구현%>
			제출시간 : <%= hwtime.get(i)%> 점수 : <%= hwscore.get(i)%>
			<select name="score">
			<option value="A">A</option>
			<option value="B">B</option>
			<option value="C">C</option>	
			</select>
		
			<input type="submit" value="점수매기기"/></form></p>
			</br> 
			
			<%}%>
				<%
			
			
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