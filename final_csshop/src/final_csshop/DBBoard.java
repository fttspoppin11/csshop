package final_csshop;

import java.sql.*;
import com.mysql.jdbc.exceptions.MySQLDataException;

import javax.servlet.*;
import java.util.*;

public class DBBoard {
	private Connection conn; // DB 접근을 위한
	private PreparedStatement pstmt; //쿼리문을 전달하기위해
	private ResultSet rs; // 정보를 담기 위한
	
	private int num;
	private String category;
	private String title;
	private String nick;
	private String content;
	private String date;
	private int count;
	
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
	
public int getNum(){
		
		return num;
	}
	public String getTitle(){
		
		return title;
	}
	public String getUser(){
	
	return nick;
}
	public String getDate(){
		
		return date;
	}
	public String getContent(){
		
		return content;
	}
public String getCategory(){
		
		return category;
	}
public int getCount(){
	
	return count;
}

public int setNum(int num){
	
	return this.num=num;
}
public String setTitle(String title){
	
	return this.title=title;
}
public String setUser(String nick){

return this.nick=nick;
}
public String setDate(String date){
	
	return this.date=date;
}
public String setContent(String content){
	
	return this.content=content;
}
public String setCategory(String category){
	
	return this.category=category;
}
public int setCount(int count){

return this.count=count;
}
	
	public int getCountRecord(){//레코드 갯수 셀때 
		int i=0;
		String SQL = "SELECT * FROM csquestion;";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				i++;

			}
			System.out.println("총 레코드 개수 :"+i);
			return i;

		} catch(Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류
		
		
	}
	
	public String getDateTime() { // 시간을 가져와 저장하기 위한 datetime형 시간 리턴

		String SQL = "SELECT NOW()"; // 현재 시간을 가져오는 MYSQL 구문

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();
			if(rs.next()) {

				return rs.getString(1);
			}

		} catch(Exception e) {

			e.printStackTrace();

		}

		return ""; // 데이터베이스 오류

	}
	
	public int getNextNum() { // 글번호를 매기기 위한 함수

		String SQL = "SELECT num FROM csquestion ORDER BY num DESC";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				return rs.getInt(1) + 1;

			}

			return 1;

		} catch(Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}
	
	
	
	//글 내용 보여주기(전부)
	
	public List<DBBoard> selectAll(){//저기 변수명을 class 이름 따라간다 ㅠㅠ 나중에 수정하자
		List<DBBoard> list = new ArrayList<DBBoard>();
		
		
		String SQL = "select * from csquestion where num<=? order by num desc";//게시판 리스트 검색
		
		
		try{
			
			DBBoard question= new DBBoard();
			conn = question.getMYSQLConnection();//db 연결
		
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getCountRecord());//레코드 개수 입력
			//System.out.println("pstmt : "+pstmt);
			rs=pstmt.executeQuery();
			//System.out.println("rs : "+rs);
			while(rs.next()){
				DBBoard db= new DBBoard();
				db.setNum(rs.getInt("num"));//글번호 불러옴
				db.setCategory(rs.getString("category"));//카테고리 불러옴
				db.setTitle(rs.getString("title"));//글제목 불러옴
				db.setUser(rs.getString("nickname"));//닉네임 불러옴
				db.setContent(rs.getString("content"));//글내용 불러옴
				db.setDate(rs.getString("date"));//작성날짜 불러옴
				db.setCount(rs.getInt("count"));//조회수 불러옴
				list.add(db);//리스트에 추가 
				
			}
				
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	// 각 a태그 눌럿을때 해당 카테고리 질문글만 보여주기
	
	//글내용 보기 눌렀을때 조회수 +1 (로그인한 닉넴==글쓴이 인지 식별부터 해야함, 그러면 조회수 변화 없음)
	
	//질문글 등록
	public int write(String category, String title, String nickname, String content) {

		String SQL = "INSERT INTO csquestion VALUES(?, ?, ?, ?, ?, NOW(), default, ?, ?, ?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1,  getNextNum());

			pstmt.setString(2, category);

			pstmt.setString(3, title);

			pstmt.setString(4, nickname);

			pstmt.setString(5, content);

			pstmt.setInt(6, 0);
			
			pstmt.setInt(7, 0);
			
			pstmt.setInt(8, 0);

			pstmt.executeUpdate();

			if(rs.next()) {

				return rs.getInt(1) + 1;

			}

			return 1;

		} catch(Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}
	
	//글내용 보여주기(답변글 있으면 같이, 함수 따로 구현)
	public List<DBBoard> showquestion(String title){//글제목 구분자로 넘겨 받아야 함
		List<DBBoard> list = new ArrayList<DBBoard>();
		
		String SQL = "select * from csquestion where title=?";//게시판 리스트 검색
		
		try{
			
			DBBoard question= new DBBoard();
			conn = question.getMYSQLConnection();//db 연결
		
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);//글제목가져옴
			
			//System.out.println("pstmt : "+pstmt);
			rs=pstmt.executeQuery();
			//System.out.println("rs : "+rs);
			while(rs.next()){
				DBBoard db= new DBBoard();
				db.setNum(rs.getInt("num"));//글번호 불러옴
				db.setCategory(rs.getString("category"));//카테고리 불러옴
				db.setTitle(rs.getString("title"));//글제목 불러옴
				db.setUser(rs.getString("nickname"));//닉네임 불러옴
				db.setContent(rs.getString("content"));//글내용 불러옴
				db.setDate(rs.getString("date"));//작성날짜 불러옴
				db.setCount(rs.getInt("count"));//조회수 불러옴
				list.add(db);//리스트에 추가 
				
			}
				
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	
	public void showanser(String title){//글제목 구분자로 넘겨 받아야 함
		
		
		
	}
	
	//질문글 수정
	//질문글 삭제
	
	//답변글 등록
	//답변글 수정
	//답변글 삭제
	
	//베스트 답변 채택(닉네임세션값==질문글글쓴이일 경우만)
	//답변글 글쓴이 != 질문글 글쓴이
	
}
