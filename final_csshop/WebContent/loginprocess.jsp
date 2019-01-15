<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ page import="java.util.*"%><%@ page import="java.sql.*"%>
    <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생로그인프로세스</title>
</head>
<body>

<% 	

try{
	
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String pass = null; //비번 비교하기 위해 담아 둘 변수~
	
	
	DBStudent student= new DBStudent();
	Connection conn = student.getMYSQLConnection();//db 연결
	
	String sql = "select * from student where id=?" ; //아이디를 검색
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,id);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){// rs.next()==true는 아이디 존재한다는 뜻
		pass=rs.getString("password");//아이디가 존재하면 비번 입력받음
		
		
			if(pw.equals(pass)){//로그인 된 경우
				session.setAttribute("id",rs.getString(1));//아이디를 pk로 사용하기 때문에 일단 받아옴
				session.setAttribute("name",rs.getString(3));
				session.setAttribute("nickname", rs.getString(4));//이름 가져오기(세션) 
				response.sendRedirect("main_ok.jsp"); 
			}
			else if(!pw.equals(pass)){
				%>
				<script>
				alert("비밀번호가 일치하지 않습니다");
				history.back();</script>
				<%
			}
		}
	
	else if(!rs.next()){
		%>
		<script>
		alert("등록되지 않은 학번입니다");
		history.back();</script>
		<%
		
	}
	

	student.close(rs);
	student.close(pstmt);
	student.close(conn);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

</body>

</html>