package final_csshop;

import java.util.HashMap;
import org.json.simple.JSONObject;
//import net.nurigo.java_sdk.api.GroupMessage;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class FindPW {
	 private String api_key = "NCSJBQ2Q7FTE1V2Q";
	 private String api_secret = "MUVBINGSX3WBYF9SGF4WLJV0ROPVYVEN";
	 private Coolsms coolsms = new Coolsms(api_key, api_secret);
     
	 public void SendToCode(String tel,String code){
		 Coolsms CS = getCoolsms();// coolsms 객체 가져옴
		 HashMap<String, String> set = new HashMap<String, String>();//to, from, notice, type=sms
		
		 set.put("to", tel); // 수신번호
	     set.put("from", "01058068955"); // 발신번호 제한 있음 (무조건 내 번호)
	     set.put("text", "과제 제출 웹 사이트 비밀번호 찾기!\n 인증번호 : "+code); // 문자내용(랜덤 코드)
	     set.put("type", "sms"); // 문자 타입
	     
	     JSONObject result = CS.send(set);//메세지 날리기
	     
	     if ((Boolean) result.get("status") == true) {
	            // 메시지 보내기 성공 및 전송결과 출력
	            System.out.println("성공");            
	            System.out.println(result.get("group_id")); // 그룹아이디
	            System.out.println(result.get("result_code")); // 결과코드
	            System.out.println(result.get("result_message"));  // 결과메시지
	            System.out.println(result.get("success_count")); // 성공갯수
	            System.out.println(result.get("error_count"));  // 발송실패 메시지 수
	        } else {
	            // 메시지 보내기 실패
	            System.out.println("실패");
	            System.out.println(result.get("code")); // REST API 에러코드
	            System.out.println(result.get("message")); // 에러메시지
	        }    
	 }
	 
	 
	 
	 public Coolsms getCoolsms(){
			
			return coolsms;
		}
}
