<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%><%@ page import="java.util.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%><%@ page import="java.io.*"%><%@ page import="final_csshop.FindPW"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인증번호일치</title>

</head>
<body>
<% 

String password=null;

try{
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	String tel = (String)session.getAttribute("findtel");
	
	DBStudent st = new DBStudent();// 데베 연결을 위한 객체 생성
	Connection conn = st.getMYSQLConnection();//db 연결

	String sql = "select password from student where tel=?" ; 
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,tel);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		
		password= (String)rs.getString(1);//비번 가져옴
	
		System.out.println(password);
		session.invalidate();// 쓸데없는 세션 없애줌
		
		
	}
	
	
	st.close(rs);
	st.close(pstmt);
	st.close(conn);
	

	
}catch(Exception e){
	e.printStackTrace();
	
}

%>

<h1 style="font-family:배달의민족 한나는 열한살;">비밀번호 : <%= password %></h1>
</body>
</html>