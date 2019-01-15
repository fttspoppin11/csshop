<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBSubject"%><%@ page import="final_csshop.SendHomework"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% try{
	// 교수 subject에 해당 과목코드 있나 검사?
	
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	
	String pro_id = (String)session.getAttribute("pro_id");//교수 아이디임
	String subject = (String)session.getAttribute("subject");
	String addtitle = request.getParameter("addtitle");
	String content = request.getParameter("content");
	
	String month = request.getParameter("month");//월
	String day = request.getParameter("days");//일
	String hour = request.getParameter("hour");//시
	String limit ="2018-"+month+"-"+day+"-"+" "+hour+":00:00"; //ex) 2018-11-13 23:00:00 까지
	
	
	DBSubject hw_list= new DBSubject();
	Connection conn = hw_list.getMYSQLConnection();//db 연결
	
	
	hw_list.addhw(pro_id, subject, addtitle, limit,content);//과제 리스트 등록insert
	
	String pro_name= hw_list.Proname(pro_id);//교수 이름 받아옴
	//System.out.println("교수이름:"+pro_name);
	SendHomework sms = new SendHomework();
	
	String notice = pro_name+"교수님의 새로운 과제가 등록되었습니다!"+"\n"+
	"과제명 : "+addtitle+"\n";
	
	String sql="select tel from student;";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
		
		sms.SendToStudent(rs.getString(1), notice);//실제로 모든 학생에게 문자 보내짐
		System.out.println("전번 : "+rs.getString(1));
	}
	
	
	
	
	response.sendRedirect("hw_"+subject+"_"+pro_id+".jsp");
	
	
	hw_list.close(conn);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>