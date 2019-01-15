<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%><%@ page import="java.util.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%><%@ page import="java.io.*"%><%@ page import="final_csshop.FindPW"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
%>
<div align="center" style="font-family:배달의민족 한나는 열한살;"><h1><%= id%></h1></div>
<div align="center"><img src="resource/커피쿠폰.png"/></div></br>
<div align="center"><input type="button" value="발행하기" style="font-family:배달의민족 한나는 열한살; font-size:20px; width:100px; height:50px;">를 누르면 문자로 커피 쿠폰 발송</div>
</body>
</html>