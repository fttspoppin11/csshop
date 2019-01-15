<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.sql.*"%><%@ page import="java.util.*"%> <%@ page import="javax.servlet.*"%>
    <%@ page import="final_csshop.DBStudent"%><%@ page import="java.io.*"%>
    <%@ page import="final_csshop.DBProfessor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="common.css"/>
<link rel="stylesheet" href="unit.css"/>
<title>:::서경대학교 소프트웨어학과 과제제출:::</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/controller.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>

<!--  <script>
if (history.pushState !== undefined)
{
    history.pushState(null, "main", "main.jsp");// data, title, URL 형식
    window.onpopstate = function (event)//뒤로가기 누르면 다시 앞으로 가기 == 뒤로가기 막음
    {
        history.go(1);
    };
}
else//이 스크립트는 http://nephrolepis.tistory.com/85 참조하였습니다.
{
    var storedHash = window.location.hash;
    function changeHashOnLoad()
    {
        window.location.href += "#";
        setTimeout("changeHashAgain()", "50");
    }
 
    function changeHashAgain()
    {
        window.location.href += "1";
    }
 
    function restoreHash()
    {
        if (window.location.hash != storedHash)
        {
            window.location.hash = storedHash;
        }
    }
 
    if (window.addEventListener)
    {
        window.addEventListener("hashchange", function ()
        {
            restoreHash();
        }, false);
    }
    else if (window.attachEvent)
    {
        window.attachEvent("onhashchange", function ()
        {
            restoreHash();
        });
    }
    $(window).load(function () { changeHashOnLoad(); });
}

</script>-->
<script type="text/javascript" >
function joinpop(){
	//window.open(url,name,option);
	window.open("join.jsp","join","width=500,height=500, left=100, top=50");
}
function logout(){
	
	window.location.href("logout.jsp");
} 


</script>
</head>
<body>
<div class="wrap">
	<img src="resource/메인.png">
	<div class="menu">
		<a href="pro_homework.jsp" style="position:absolute; top:40px; left:100px; width:100px; height:50px;">과제제출</a>
		<a href=# style="position:absolute; top:40px; left:250px; width:100px; height:50px;">지식IN</a>
		<a href=# style="position:absolute; top:40px; left:400px; width:100px; height:50px;">&#10004;<%=session.getAttribute("pro_name") %>교수님</a>
		<a href=# style="position:absolute; top:40px; left:550px; width:100px; height:50px;">마이페이지</a>
		<a href="logout.jsp" style="position:absolute; top:40px; left:700px; width:100px; height:50px;">LOGOUT</a>
	</div>
	<div class="con" style="position:absolute; top:100px; left:400px;">
		<div class="slide">
				<button class="prev" type="button"><img src="resource/왼쪽.png" alt=""></button>
				<ul>
					<li><img src="resource/배너1.png" alt=""></li>
					<li><img src="resource/배너2.png" alt=""></li>
				</ul>
				<button class="next" type="button"><img src="resource/오른쪽.png" alt=""></button>
		</div></div>
	<section class="section">
	
		<div class="banner">
			
			<div class="list">
			<p style="font-size:20px; font-weight:bold;">과제 리스트</p>
				  <%
			   List<DBProfessor> list = null;// 내정보 불러올 리스트
		
			   DBProfessor subject= new DBProfessor();
			   list=subject.subjectInfo();
			   
			   for(int i=0;i<list.size();i++){
					DBProfessor pro = list.get(i);
					String proname= subject.pro_name(pro.getSubject(), pro.getPro_id());
					String subname= subject.sub_name(pro.getSubject(), pro.getPro_id());
					%>
					<p>&nbsp;&nbsp;[<%= proname %>교수/<%= subname%>] <%= pro.getTitle()%> <p style="color:blue;"><%= pro.getLimitdate()%>까지</p></p>
					
				
				<% 
				
				}
		   
		   %>
			</div>
		</div>
	
	</section>
</div>

<footer class="footer">@copyright jung so yeong &nbsp; &nbsp; &nbsp; Tel) 010-5806-8955</footer>

</body>
</html>
