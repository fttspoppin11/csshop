<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%>
    <%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBSubject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>점수저장중...</title>
</head>
<body>

<%

try{
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	
	String title = (String)session.getAttribute("title");
	//String id = request.getParameter("id");//학생 아이디 
	String filename = request.getParameter("filename");//파일이름받아옴 (공백 섞여서 sql오류남)
	String score = request.getParameter("score");//
	
	

	DBSubject sc= new DBSubject();
	Connection conn =sc.getMYSQLConnection();//db 연결
	//conn.setAutoCommit(false);
	String sql="update homework set score=? where filename='"+filename+"';";
	//String sql1="update homework set score='B' where filename='S_52.jpg';";//이것도 됨;;
	//String sql="update homework set score='C';";//됨
	PreparedStatement pstmt = conn.prepareStatement(sql);
	

	pstmt.setString(1,score);
	//pstmt.setString(1,filename);
	
	int i=pstmt.executeUpdate();// update 실행 왜안됨?
	System.out.println(sql+" : "+sql);
	//System.out.println("파일이름="+filename+"의 점수를 "+score+"로 변경하라");
	System.out.println("psmtm="+i);
	//sc.score(title, filename, score);
	response.sendRedirect("filelist.jsp");
	
	
}catch(Exception e){
	
	e.printStackTrace();
}
	
	%>
</body>
</html>