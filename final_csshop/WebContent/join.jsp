<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%><%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생등록</title>

<script type="text/javascript" src="js/formck.js"></script><!-- 폼 제약조건 체크 / 나중에 제이쿼리에서 간편하게 수정하기-->

</head>
<style>
body{
	width:600;
	height:800;
}
fieldset { 
   border: 3px dotted black; 
   text-align:center; 
   width:400px;
   height:400px;
   -webkit-border-radius: 30px 0px; 
   -ms-border-radius: 30px 0px;
    border-radius: 30px; 
} 
</style>
<body >
 <h2 align="center" style="font-family:배달의민족 한나는 열한살;">서경대학교 소프트웨어학과 학생등록</h2>
 <div align="center">
 <fieldset>
    <form action="joinprocess.jsp" method="post" onsubmit="return JoinCheck(this);">

        <!-- 패딩을 줘서 공간을 떨어트림-->
        <table align="center" width="400" cellpadding="7">
           <tr>
                <td align="right" width="100">
                     <label for="id" style="font-family:배달의민족 한나는 열한살;">학번</label>
                     <!-- id와 for가 같을 시 모바일에선 키보드가 그냥 올라옴-->
                </td>
                <td>
                    <input type="text" size="20" maxlength="10" name="id" placeholder="2000301000"/>
                    <!-- placeholder는 텍스트 입력시 사라짐-->
                </td>
                <td></td>
                
            </tr>
           
           <tr>
                <td align="right" width="100">
                     <label for="password" style="font-family:배달의민족 한나는 열한살;">비밀번호</label>
                </td>
                <td>
                    <input type="password" size="20" maxlength="20" name="password" placeholder="비밀번호 (20자 이내)"/>
                </td>
           </tr>
           
            
            <tr>
                <td align="right" width="100">
                     <label for="name" style="font-family:배달의민족 한나는 열한살;">이름</label>
                </td>
                <td>
                    <input type="text" size="20" name="name" maxlength="10" placeholder="이름"/>
                </td>
           </tr>
           
            <tr>
                <td align="right" width="100">
                     <label for="nickname" style="font-family:배달의민족 한나는 열한살;">닉네임</label>
                </td>
                <td>
                    <input type="text" size="20" name="nickname" maxlength="10" placeholder="닉네임"/>
                </td>
           </tr>
           
           <tr>
                <td align="right" width="100">
                     <label for="name" style="font-family:배달의민족 한나는 열한살;">전화번호</label>
                </td>
                <td>
                    <input type="tel" size="20" name="tel" maxlength="11" placeholder="01012345678"/>
                </td>
           </tr>
           
            <tr>
                <td align="center" width="100" colspan="2">
                  
                   <label for="sex" style="font-family:배달의민족 한나는 열한살;">성별</label>
                    <input type="radio" name="sex" checked="checked" value="m" >남자
                    <input type="radio" name="sex" checked="checked" value="w">여자
                   
                </td>
           </tr>
            <tr>
                <td><input type="checkbox" name="agree" value="agree"/></td>
                  <td width="100" style="font-family:배달의민족 한나는 열한살;"><a href="agree.html" 
                  onclick="goLink(this.href);return false;">개인정보 이용 동의서</a> 보기</td>
                  
           </tr>
           <tr></tr>
           <tr>
           	<td align="center" width="100" colspan="3">
                     <input type="submit" value="회원가입" style="font-family:배달의민족 한나는 열한살;"/><!--  insert 해줘야함 -->
                </td>
           </tr>
           
        </table>
    
    </form>
 </fieldset>
 </div>
</body>

</html>