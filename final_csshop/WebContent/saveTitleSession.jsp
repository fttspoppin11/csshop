<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBSubject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<% 
	try{
		request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
		
		
		String title = request.getParameter("title");
		if(title==null||title==""){
			System.out.println("과제가 없는데 어떻게 냄?");
			response.sendRedirect("main_ok.jsp"); 
		}
		
		
		String stu_id= (String)session.getAttribute("id");
		String pro_id= (String)session.getAttribute("pro_id");
		//System.out.println(title);
		session.setAttribute("title",title);
		
		if(stu_id==null){//교수는 학생들의 제출 list가 보여져야함
			response.sendRedirect("filelist.jsp"); 
		}
		else if(stu_id!=null){
			response.sendRedirect("fileChoose.jsp"); //학생일 경우 제출 페이지로 넘어가고 
		}
		
		
		
	
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
</body>
</html>