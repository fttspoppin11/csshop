<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%><%@ page import="java.util.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%><%@ page import="java.io.*"%><%@ page import="final_csshop.FindPW"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script>
function timer(){
	var min=0;
	var sec=59;
	var time=setInterval(function(){
		
			document.getElementById("p").innerHTML="인증번호 제한시간 카운트 "+min+":"+sec;
			sec--;
			if(min!=0&&sec==0){
				min--;
				sec=59;
			}
			else if(min==0&&sec==-1){
				document.getElementById("p").innerHTML="타임오버";
				clearInterval(time);
			}
			
	},1000)
}
</script>
<script>
function formCheck(obj){
	if(!obj.name.value || obj.name.value.trim().length==0){
		document.getElementById("noname").innerHTML="이름을 입력해주세요";
		obj.name.value="";
		obj.name.focus();
		return false;
	}
	else if(obj.name.value||obj.name.value.trim().length>0){
		document.getElementById("noname").innerHTML="";
	}
	
	if(!obj.tel.value || obj.tel.value.trim().length==0){
		document.getElementById("notel").innerHTML="전화번호를입력해주세요";
		obj.tel.value="";
		obj.tel.focus();
		return false;
	}
	else if(obj.tel.value||obj.tel.value.trim().length>0){
		document.getElementById("notel").innerHTML="";
	}
}
</script>
</head>
<style>
h1, label, p{
font-family:"배달의민족 한나는 열한살";
}



</style>
<body>
<h1 style="font-size:20px;">이름과 전화번호가 일치하면 비밀번호를 알려줍니다</h1>
<img src='resource/비번찾기.png'>
<div style="position: absolute; top:0; left:300;">
</br></br></br>
<form action="findpwprocess.jsp" method="post" onsubmit="return formCheck(this);">
	<table align="center" cellpadding="7">
	<tr>
		<td><label for="name">이름</label></td>
		<td colspan="2"><input type="text" name="name"></td>
	</tr>
	<tr>
		<td colspan="3"><p id="noname" style="color:red;"></p></td>
	</tr>
	<tr>
		<td><label for="tel">전화번호</label></td>
		<td><input type="text" name="tel" maxlength="11" placeholder="01012345678"></td>
		<td><input type="submit" value="인증번호" style="font-family:배달의민족 한나는 열한살;"/></td>
	</tr>
	<tr>
		<td colspan="3"><p id="notel" style="color:red;"></p></td>
	</tr>
	<!-- <tr>
		<td colspan="3"><p id="p" style="color:red;">제한시간:</p></td>
	</tr> -->
	
	
	</table>
	
</form>
</div>
</body>
</html>