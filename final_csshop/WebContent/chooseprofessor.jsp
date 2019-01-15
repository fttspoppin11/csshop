<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBProfessor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교수를 선택해라 처리 과정</title>
</head>
<form>
<body>
<%

	request.setCharacterEncoding("UTF-8");
	String pro_name = request.getParameter("pro_name");// 누른 교수 이름  받아옴
	session.setAttribute("pro_name",pro_name); //누른 교수 이름 세션 값 가짐(학생만)
	System.out.println(pro_name);
	response.sendRedirect("homework.jsp"); 	
	
	%>
	</form>
</body>
</html>