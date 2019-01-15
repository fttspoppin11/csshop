package final_csshop;

import java.sql.*;
import com.mysql.jdbc.exceptions.MySQLDataException;
import javax.servlet.*;
import java.util.*;

public class DBProfessor {
	private Connection conn; // DB 접근을 위한
	private PreparedStatement pstmt; //쿼리문을 전달하기위해
	private ResultSet rs; // 정보를 담기 위한
	
	private String pro_id;
	private String subject;
	private String limitdate;
	private String title;
	
	public Connection getMYSQLConnection(){
		conn = null;
		
		try{
			 Class.forName("com.mysql.jdbc.Driver"); 
			 String url="jdbc:mysql://localhost:3306/csshop";
			 String id = "admin"; 
             String pw = "ad0120"; //csshop DB 사용자
             conn=DriverManager.getConnection(url,id,pw); 
             System.out.println("연결성공");
             
		}catch(ClassNotFoundException e){
			System.out.println("MYSQL 드라이버가 없음<br/>");
		}catch(MySQLDataException e){
			System.out.println("데이터베이스가 없음<br/>");
		}catch(SQLException e){
			System.out.println("사용자 계정 또는 비밀번호 불일치<br/>");
		}
		return conn;
		
	
	
	}
	public String getPro_id(){
		
		return pro_id;
	}
	
	public String getSubject(){
		
		return subject;
	}
	public String getLimitdate(){
		
		return limitdate;
	}
	public String getTitle(){
		
		return title;
	}

	public String setPro_id(String pro_id){
		
		return this.pro_id=pro_id;
	}
	
	public String setSubject(String subject){
		
		return this.subject=subject;
	}
	public String setLimitdate(String limitdate){
		
		return this.limitdate=limitdate;
	}
	public String setTitle(String title){
		
		return this.title=title;
	}
	
	public static void close(Connection conn){
		try{if(conn!=null){conn.close();}}catch(Exception e){e.printStackTrace();}
	}
	public static void close(Statement stmt){
		try{if(stmt!=null){stmt.close();}}catch(Exception e){e.printStackTrace();}
	}
	public static void close(PreparedStatement pstmt){
		try{if(pstmt!=null){pstmt.close();}}catch(Exception e){e.printStackTrace();}
	}
	public static void close(ResultSet rs){
		try{if(rs!=null){rs.close();}}catch(Exception e){e.printStackTrace();}
	}
	

	public String compare(String id){ // 해당 id의 교수 이름을 리턴하여 로그인된 세션 값이랑 비교 > 불일치 할 시 다음 페이지로 못 넘어감
		try{
			
			Connection conn = getMYSQLConnection();//db 연결
			
			String sql = "select pro_name from professor where pro_id='"+id+"';" ; //아이디를 검색
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				
			return (String)rs.getString(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "";
	}
	
	public List<DBProfessor> subjectInfo(){ // 과제 리스트 전부 출력
		List<DBProfessor> list = new ArrayList<DBProfessor>();
		try{
			DBProfessor pro= new DBProfessor();
			conn = pro.getMYSQLConnection();//db 연결
			
			String sql = "select * from hw_list order by limitdate;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				DBProfessor db= new DBProfessor();
				
				db.setPro_id(rs.getString("pro_id"));//교수 아이디
				db.setSubject(rs.getString("subject"));//과목코드
				db.setTitle(rs.getString("title"));//과목코드
				db.setLimitdate(rs.getString("limitdate"));//마감날짜
				
				System.out.println(rs.getString("pro_id")+rs.getString("subject")+rs.getString("title")+rs.getString("limitdate"));
				
				list.add(db);
				
			}
		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public String sub_name(String subject, String pro_id){//교수가 맡은 특정 과목 이름 return
		String sub=null;
		try{
		Connection conn = getMYSQLConnection();//db 연결
		
		String sql = "select sub_name from subject where subject='"+subject+"' and pro_id=?;" ; //아이디를 검색
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pro_id);
		
		ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				sub=rs.getString(1);
			return sub;
			
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return sub;
	}
	
	public String pro_name(String subject, String pro_id){ //교수 이름 받아옴
		String pro=null;
		try{
		Connection conn = getMYSQLConnection();//db 연결
		
		String sql = "select pro_name from subject where subject='"+subject+"' and pro_id=?;" ; //아이디를 검색
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pro_id);
		
		ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				pro=rs.getString(1);
			return pro;
			
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return pro;
	}
	
}
