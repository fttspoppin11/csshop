package final_csshop;

import java.sql.*;
import com.mysql.jdbc.exceptions.MySQLDataException;
import javax.servlet.*;

import org.apache.catalina.Session;

import java.util.*;

public class DBSubject {
	private Connection conn; // DB 접근을 위한
	private PreparedStatement pstmt; //쿼리문을 전달하기위해
	private ResultSet rs; // 정보를 담기 위한
	
	
	
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
	
	public void addhw(String pro_id, String subject, String title, String limit, String content){
		String sql = "insert into hw_list(pro_id, subject, title, limitdate, content) values(?, ?, ?, ?, ?)";
		
		try {


			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,  pro_id);

			pstmt.setString(2, subject);

			pstmt.setString(3, title);

			pstmt.setString(4, limit);

			pstmt.setString(5, content);
			
			
			pstmt.executeUpdate();// insert 실행
			

			System.out.println("과제등록성공");

	}catch(Exception e){
		e.printStackTrace();
	}
		//close(pstmt);
		//close(conn);
	}

	public boolean sameFilename(String filename){
		
		try {

			String sql="select filename from homework where filename='"+filename+"';";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getString(0).equals(filename)){//이미 존재하는 파일이름일 경우
					System.out.println("기본키로 파일 이름이 존재!!");
					return false;
				}
				else if(!rs.getString(0).equals(filename)){
				return true;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			
			
		}
		return true;
		
	}
	
	
	public String Proname(String pro_id){
		String name=null;
		try {

			String sql="select pro_name from professor where pro_id='"+pro_id+"';";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				name=rs.getString(1);
				return rs.getString(1);
					
			}
		

	}catch(Exception e){
		e.printStackTrace();
	}
		//close(pstmt);
		//close(conn);
		
		return name;
	}
	
	public void score(String title, String filename, String score){
		int i;
		try {
			//과제 점수 매기기
			
				String sql="update homework set score=? where filename='"+filename+"';";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,score);
				
				i=pstmt.executeUpdate();// update 
				
				System.out.println(i+"  "+filename+" | "+score+"점수저장됨");
				
			
			
			
		
	}catch(Exception e){
		e.printStackTrace();
		
		}
	}
	
}
