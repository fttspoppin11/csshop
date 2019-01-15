<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBBoard"%><%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 등록중...</title>
</head>
<body>
<%
try{
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	String nick = (String)session.getAttribute("nickname");//이름 가져오기(세션) 
	String title = request.getParameter("title");
	String con = request.getParameter("content");
	String category = request.getParameter("category");//월
	
	DBBoard question= new DBBoard();
	Connection conn = question.getMYSQLConnection();//db 연결
	
	int i =question.write(category, title, nick, con);//질문글 등록
	
	if(i==-1){
		
		System.out.println("에러에러");
	}
	
	response.sendRedirect("csboard.jsp");
	
}catch(Exception e){
	e.printStackTrace();
}


%>
</body>
</html>