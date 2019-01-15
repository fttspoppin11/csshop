<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%><%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생등록처리중</title>
</head>
<body>
<%

try{
	
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌

	DBStudent student= new DBStudent();
	Connection conn = student.getMYSQLConnection();//db 연결
	
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String name = request.getParameter("name");
	String nick = request.getParameter("nickname");
	String tel = request.getParameter("tel");
	String sex = request.getParameter("sex");
	String agree=request.getParameter("agree");
	
	int result=student.joinCheckId(id);
	
	if(agree==null){
		out.println("<script>");
		out.println("alert('개인정보이용동의에 체크해주세요')");
		out.println("history.back();");
		out.println("</script>");
	}
	
	else{ 
		if(result==-1){
			out.println("<script>");
			out.println("alert('이미 등록한 학번입니다')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			student.join(id, pw, name, nick, tel, sex); //insert
			out.println("<script>");
			out.println("alert('학생 등록 성공')");
			out.println("self.close();");
			out.println("</script>");
			
		}
	}

	student.close(conn);//연결 끊기
	
	
	}catch(Exception e){
		
		e.printStackTrace();
	}
%>
</body>
</html>