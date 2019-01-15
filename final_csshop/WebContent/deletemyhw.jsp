<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 과제 삭제중</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌

String []droplist = request.getParameterValues("myhw");// 삭제 선택한 타이틀 가져옴

try{
	
	String pro_id = (String)session.getAttribute("pro_id");//교수 아이디임
	String subject = (String)session.getAttribute("subject");
	
		DBStudent drop= new DBStudent();
		Connection conn = drop.getMYSQLConnection();//db 연결
		String sql = "delete from homework where filename=?"; //과목코드로 된 타이틀 검색
		PreparedStatement pstmt = conn.prepareStatement(sql);
	
		for(int i=0;i<droplist.length;i++){
			System.out.println(droplist[i]);
			pstmt.setString(1, droplist[i]);
			pstmt.executeUpdate();
		
			}
		drop.close(pstmt);
		drop.close(conn);
		
		%>
		<script>
			history.go(-1);
		</script>
		<% 
		//response.sendRedirect("hw_"+subject+"_"+pro_id+".jsp"); 
		
}catch(Exception e){
	e.printStackTrace();
	
} %>
</body>
</html>