package final_csshop;

import java.sql.*;
import com.mysql.jdbc.exceptions.MySQLDataException;
import javax.servlet.*;
import java.util.*;


public class DBStudent {
	private Connection conn; // DB 접근을 위한
	private PreparedStatement pstmt; //쿼리문을 전달하기위해
	private ResultSet rs; // 정보를 담기 위한
	
	private String id;
	private String name;
	private String nickname;
	private String tel;
	
	
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
	public String getId(){
		
		return id;
	}
	public String getName(){
		
		return name;
	}
	public String getNickname(){
		
		return nickname;
	}
	public String getTel(){
		
		return tel;
	}

	public String setId(String id){
		
		return this.id=id;
	}
	public String setName(String name){
		
		return this.name=name;
	}
	public String setNickname(String nickname){
		
		return this.nickname=nickname;
	}
	public String setTel(String tel){
		
		return this.tel=tel;
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
	public int joinCheckId(String id){
		
		String sql ="select id from student where id="+id+";";
		
		try{
			
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){//이미 존재하는 아이디일 경우
				
				return -1;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return 1;
	}
	
	public void join(String id, String pw, String name, String nick, String tel, String sex){
		
		String sql = "insert into student(id, password, name, nickname, tel, sex, certify) values(?, ?, ?, ?, ?, ?, ?)";
		
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,  id);

			pstmt.setString(2, pw);

			pstmt.setString(3, name);

			pstmt.setString(4, nick);

			pstmt.setString(5, tel);
			
			pstmt.setString(6, sex);
			
			pstmt.setString(7, "n");//처음 가입하면 인증이 안됐으므로 n 값 부여
			
			pstmt.executeUpdate();// insert 실행
			

			System.out.println("학생등록성공");

		
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(conn);
		}
		
		
		
	}
	
	public String findpw(String tel, String name){//전번 찾기
		String sql ="select name from student where tel='"+tel+"';";
		
		try{
			
			pstmt = conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){//name 등록된 경우
				return (String)rs.getString(1);//해당 네임 리턴
				}
			else{
				return null;
				
			}
			

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public List<DBStudent> mypage(String id){
		List<DBStudent> list = new ArrayList<DBStudent>();
		String sql ="select * from student where id=?;";
		
		try{//내 정보 모두 뿌려줌
			DBStudent stu= new DBStudent();
			conn = stu.getMYSQLConnection();//db 연결
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				DBStudent db= new DBStudent();
				db.setName(rs.getString("name"));//이름
				db.setNickname(rs.getString("nickname"));//닉네임
				db.setTel(rs.getString("tel"));//전화번호 불러옴
				list.add(db);
			}
			

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	
}

