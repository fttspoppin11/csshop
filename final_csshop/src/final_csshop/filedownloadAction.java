package final_csshop;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/filedownloadAction")
public class filedownloadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 /*유튜브 참고*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String filename=request.getParameter("file");
		
		String directory = this.getServletContext().getRealPath("/upload/");
		File file = new File(directory+"/"+filename); // 파일 불러오기
		
		String mimeType=getServletContext().getMimeType(file.toString());


		if(mimeType==null){
			response.setContentType("application/octet-stream");//이진데이터형식 파일 데이터 전달 응답신호
		}
		String downloadname =null;
		
		if(request.getHeader("user-agent").indexOf("MSIE")==-1){//에러
			downloadname=new String(filename.getBytes("EUC-KR"),"8859_1");//익스플로러에서 안돼서 일단 EUC-KR로 바꿈
		}
		else{
			downloadname=new String(filename.getBytes("EUC-KR"),"8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=\""+downloadname+"\";");
	
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b[] = new byte[1024]; // 파일 보낼땐 쪼개서 보냄
		int data=0;
		
		while((data=(fileInputStream.read(b,0,b.length)))!=-1){
			 servletOutputStream.write(b,0,data);//데이터 전달 받음
		}
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
		
	}

}