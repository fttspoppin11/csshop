<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.io.File" %>
    <%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %> <%@ page import="java.util.*"%>
    <%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBSubject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>숙제제출db저장프로세스</title>
</head>
<body>
<%

String uploadPath=request.getRealPath("/")+"upload"; //경로 설정해주기
String directory = application.getRealPath("/")+"upload";//이건 localhost8080 url

int size = 10*1024*1024;//최대 10MB 가능
String file="";//업로드한 파일 이름 읽어올 변수


try{
	
request.setCharacterEncoding("UTF-8");

MultipartRequest multi=new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());

//name=multi.getParameter("name");
//subject=multi.getParameter("subject");

//hw table
String id =(String)session.getAttribute("id");//학번 받아오기(fk)
file=multi.getFilesystemName("filename");//실제로 업도르 된/filename받아오기 null일경우 업로드 X
String title=(String)session.getAttribute("title");//title
String subject = (String)session.getAttribute("subject");//subject 과목 코드 임의로 입력
String pro_id=(String)session.getAttribute("pro_id");//pro_id
//path == uploadPath
//datetime
//filename 중복 없애야함!!!! 똑같은 이름 저장하면 옆에 1이 붙어 버림
DBSubject hwprocess= new DBSubject();
Connection conn = hwprocess.getMYSQLConnection(); //DB연결
String SQL = "INSERT INTO homework VALUES(?, ?, ?, ?, ?, ?, NOW(), ?)";
PreparedStatement pstmt =conn.prepareStatement(SQL);




boolean tf=hwprocess.sameFilename(file);//파일이름 존재하면 true 아니면 false

if(tf==false){
	
	%>
	<script>alter('파일이름중복! 다시 수정해서 내세요:(');</script>
	<%
}
else if(tf==true){
	pstmt.setString(1, id);
	pstmt.setString(2, file);
	pstmt.setString(3, title);
	pstmt.setString(4, subject);
	pstmt.setString(5, pro_id);
	pstmt.setString(6, uploadPath+"\\"+file);
	pstmt.setString(7, null); 
	
	
	pstmt.executeUpdate();
	
	hwprocess.close(pstmt);
	hwprocess.close(conn);
}
else if(file==""){//파일 없을 때
	System.out.println("파일 존재 XXXXX");
	%>
	<script>
	alert('과제제출성공!');
	history.go(-1);
	</script>
	<% 
	
}
%>
<script>
	alert('과제제출성공!');
	history.go(-1);
</script>
<% 


System.out.print("제출 성공 ! 저장된 path : "+uploadPath);



}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>