<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBProfessor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% try{
	request.setCharacterEncoding("UTF-8");//출력을 위해 인코딩 해줌
	//String []initia = {"jkrho", "mk", "gy"};
	
	String sub = request.getParameter("code");// 누른 과목 코드+교수아이디 받아옴
	String pro_id =(String)session.getAttribute("pro_id");
	String stu_id =(String)session.getAttribute("id");
	String name=(String)session.getAttribute("pro_name");//앞에서 선택해 온 교수 이름
	String sublist="";
	String href="";
	String i="";
	
	DBProfessor subcode= new DBProfessor();
	Connection conn = subcode.getMYSQLConnection();//db 연결
	 
	String []sub_id= sub.split("\\.");// 분리
	
	String code = sub_id[0];// 코드 분리
	String id = sub_id[1];
	System.out.println("받아온거 : "+sub+" 코드:"+code+"아이디 :"+id);
	i=subcode.compare(id);//지금 누룬 교수 이름
	System.out.println("선택한 교수 이름 :"+name+"지금 누른 교수  이름: "+i);
	
	if(stu_id==null){//교수일경우
	
		if(!i.equals(name)){
			
			%>
			<script>
			alert("교수불일치");
			history.back();</script>
			<%
		}
		else if(i.equals(name)&&stu_id==null){ 
			String sql = "select subject from professor where pro_id='"+pro_id+"';" ; //아이디를 검색
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				sublist=rs.getString(1);//cs0102.cs1147.cs1149.cs1136
			
			}
			
			
			String []result = sublist.split("\\.");// 분리
			

			
			for(int j=0;j<result.length;j++){
				//System.out.println(result[j]+"   "+sub);
					if(result[j].equals(code)){
						session.setAttribute("subject",result[j]); // csll36==cs1136
						//System.out.println("교수아이디 : "+pro_id);	
						href=result[j]+"_"+pro_id;
						String subject = (String)session.getAttribute("subject");
						//System.out.println("과목코드는"+sub);
						//response.sendRedirect("hw_"+href+".jsp"); 
						
						
					}
					
				}

			System.out.println("주소 : "+href+"  과목 코드 세션 : "+(String)session.getAttribute("subject"));
			response.sendRedirect("hw_"+href+".jsp"); 
			
			

			}
	
		
		
	}
	
	else if(stu_id!=null&&i.equals(name)){//학생인경우 
	
		session.setAttribute("subject",code);
		href=code+"_"+id;
		response.sendRedirect("hw_"+href+".jsp"); 
			
	}
	else if(stu_id!=null&&!i.equals(name)){//학생인경우 
		
		%>
		<script>
			alert("담당교수 과목을 선택하세요!");
			history.go(-1);
		</script>
		<% 
	}
	
	
	
	
	subcode.close(conn);
	
}catch(Exception e){
	e.printStackTrace();
}
	
	%>
</body>
</html>