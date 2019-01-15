<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정</title>
</head>
<body>
<%
try {
	request.setCharacterEncoding("UTF-8");
	String id =(String)session.getAttribute("id");

	String pw = request.getParameter("password");
	String nick = request.getParameter("nickname");
	
	System.out.println("pw:"+pw+" nick:"+nick);
	
	
	if(pw==""&&nick!=""){//닉네임만 변경할때
		String sql="update student set nickname=? where id='"+id+"';";
		DBStudent mypage= new DBStudent();
		Connection conn = mypage.getMYSQLConnection(); //DB연결
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,nick);
		pstmt.executeUpdate();// update 
		session.setAttribute("nickname",nick);//닉네임세션갱신
		System.out.println("변경됨");
		%>
		<script>
		alert('수정되었습니다!');
		history.go(-1);
		</script>
		<% 
	}
	else if(pw!=""&&nick==""){//pw만 변경할때
		String sql="update student set password=? where id='"+id+"';";
		DBStudent mypage= new DBStudent();
		Connection conn = mypage.getMYSQLConnection(); //DB연결
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,pw);
		pstmt.executeUpdate();// update
		System.out.println("변경됨");
		%>
		<script>
		alert('수정되었습니다!');
		history.go(-1);
		</script>
		<% 
	}
	else if(pw!=""&&nick!=""){
		String sql="update student set password=?, nickname=? where id='"+id+"';";
		DBStudent mypage= new DBStudent();
		Connection conn = mypage.getMYSQLConnection(); //DB연결
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,pw);
		pstmt.setString(2,nick);
		pstmt.executeUpdate();// update 
		session.setAttribute("nickname",nick);//닉네임세션갱신
		System.out.println("변경됨");
		%>
		<script>
		alert('수정되었습니다!');
		history.go(-1);
		</script>
		<% 
	}
	else if(pw==""&&nick==""){
		System.out.println("입력안됨");
		%>
		<script>
		alert('입력안됨');
		history.go(-1);
		</script>
		<% 
	}
}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>