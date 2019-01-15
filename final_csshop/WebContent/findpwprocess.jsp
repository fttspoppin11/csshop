<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%><%@ page import="java.util.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%><%@ page import="java.io.*"%><%@ page import="final_csshop.FindPW"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인증번호</title>
</head>
<body>
<%
try{
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	String name = request.getParameter("name");//이름 가져옴
	String tel = request.getParameter("tel");//전화번호 가져옴
	
	FindPW find = new FindPW();// 인증번호 보낼 객체 생성
	Random ran = new Random();//랜덤 인증번호 생성할 객체
	
	DBStudent st = new DBStudent();// 데베 연결을 위한 객체 생성
	Connection conn = st.getMYSQLConnection();//db 연결
	
	String result=st.findpw(tel, name);
	String code=null;
	int tmp= ran.nextInt(99998)+10000;// 5자리 숫자 10000~99999
	
	System.out.println("result : "+result);
	
	if(result==null){
		out.println("<script>");
		out.println("alert('이름과 전화번호를 정확하게 기입해주세요')");
		out.println("history.back();");
		out.println("</script>");
	}
	
	else if(result.equals(name)){
		
		session.setAttribute("findtel",tel);//전화번호 임시적으로 세션 부여, 바로 해제할거임
		
		code=Integer.toString(tmp);// string형으로 변환
		System.out.println(tel+"/"+tmp);
		System.out.println(result+"/"+name);
		
		find.SendToCode(tel,code);//인증문자 보내기
		%>

		<script>
			var co = "<%=code %>"; 
			var prom= prompt("인증번호를 입력하세요");
			//document.write(co+prom);
			if(co==prom){
				location.href="authentication.jsp";
				//window.location.href("authentication.jsp"); 크롬에서 에러남
			}
			
		</script>
		<% 
		
	}
	
	
	
	
}catch(Exception e){
	e.printStackTrace();
	
}

%>
</body>
</html>