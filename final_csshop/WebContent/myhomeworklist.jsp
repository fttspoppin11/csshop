<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제출한 과제 보기</title>
</head>
<body>
<form action="deletemyhw.jsp" method="post">
<% 

try{
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	//select * from homework where stu_id=?
	String stu_id= (String)session.getAttribute("id");

	DBStudent filelist= new DBStudent();	
	Connection conn = filelist.getMYSQLConnection();//db 연결
	
	String sql="select * from homework where stu_id='"+stu_id+"' order by date;";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	%>
	<div style="position: relative;">
	<img src="resource/제출과제목록.png"/>
	<div style="position: absolute; top:100px; left:100px; font-family:배달의민족 한나는 열한살;">
	<% 
	while(rs.next()){
		%>
		
		<p><input type="checkbox" name="myhw" value="<%= rs.getString(2)%>">과제명 : <%= rs.getString(3)%> 파일명 : <%= rs.getString(2)%> 제출일 : <%= rs.getString(7)%></p>
		
		<% 
		
	}
	%>
		</div>
		</div>
		<input type="submit" value="과제 삭제" style="position:relative; bottom:10px; left:350px; font-family:배달의민족 한나는 열한살;">
	<% 
	
}catch(Exception e){
	e.printStackTrace();
}

%>
</form>
</body>
</html>