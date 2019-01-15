<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBProfessor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교수로그인프로세스</title>
</head>
<body>

<% 	

try{
	
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	String pro_id = request.getParameter("pro_id");
	String pro_pw = request.getParameter("pro_password");
	String pass = null; //비번 비교하기 위해 담아 둘 변수~
	
	
	DBProfessor pro= new DBProfessor();
	Connection conn = pro.getMYSQLConnection();//db 연결
	
	String sql = "select * from professor where pro_id=?" ; //아이디를 검색
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,pro_id);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){// rs.next()==true는 아이디 존재한다는 뜻
		pass=rs.getString("pro_password");//아이디가 존재하면 비번 입력받음
		
		
			if(pro_pw.equals(pass)){//로그인 된 경우
				session.setAttribute("pro_id",rs.getString(1));//아이디를 pk로 사용하기 때문에 일단 받아옴 id변수로통일시킴
				session.setAttribute("pro_name", rs.getString(3));//이름 가져오기(세션) 
				response.sendRedirect("pro_main_ok.jsp"); 
			}
			else if(!pro_pw.equals(pass)){
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
		alert("등록되지 않은 아이디입니다");
		history.back();</script>
		<%
		
	}
	

	pro.close(rs);
	pro.close(pstmt);
	pro.close(conn);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

</body>

</html>