<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style>
   i {
      color: #2F62A7;
      
   }
   
   #tablebox{
      text-align:center;
      margin-top: 100px;
      margin-bottom:150px;
   }
   
   #tablebox a{
      text-decoration:none;
      color:#2F62A7;
   }
   
   #tablebox table{
      margin:auto;
   }
   
   #tablebox td{
      padding: 0px 40px 15px 40px;
   }
   
   #mypagebox p{
      margin-top: 50px;
      text-align:center;
      font-size:20px;
      color:#2F62A7;
      font-family: sans-serif;
      font-weight: bold;
   }
   {
   	
   }
</style>
</head>
<body>
<div id="mypagebox">
	
	<div id="tablebox">
	
	<table>
<%String id = (String)session.getAttribute("id"); %>
<%String who = (String)session.getAttribute("who");
   if(who.equals("client")){
	   %><p>Mypage</p><%
      int count=(int)request.getAttribute("new");
      if(count>0){	//새로운 혹은 아직 안 읽은 쪽지가 있다%>
  		<tr>	
  			<td><a href="./gomymail" ><i id="red"style="color:#ff1a1a;" class="far fa-envelope fa-4x"></i></a></td>
  			<td><a href="./showclientreport"><i class="fas fa-history fa-4x"></i></a></td>
  			<td><a href="./clientUpdate"><i class="fas fa-cog fa-4x"></i></a></td>
  		</tr>
  		<tr>
  			<td><a href="./gomymail">쪽지함</a></td>
  			<td><a href="./showclientreport">예약 내역</a></td>
  			<td><a href="./clientUpdate">개인정보수정</a></td>
  		</tr>
  			
  	<% 	} else {%>
  		<tr>	
  			<td><a href="./gomymail"><i class="far fa-envelope fa-4x"></i></a></td>
  			<td><a href="./showclientreport"><i class="fas fa-history fa-4x"></i></a></td>
  			<td><a href="./clientUpdate"><i class="fas fa-cog fa-4x"></i></a></td>
  		</tr>
  		<tr>
  			<td><a href="./gomymail">쪽지함</a></td>
  			<td><a href="./showclientreport">예약 내역</a></td>
  			<td><a href="./clientUpdate">개인정보수정</a></td>
  		</tr>
  	<% 	}%>
   <%}else{%>
      <div id="mypagebox">
         <p>Mypage</p>
         <div id="tablebox">
         <table>
            <tr>
               <td><a href="./showdoctorcalendar"><i class="far fa-calendar-alt fa-4x"></i></a></td>
               <td><a href="./updatedoctortime"><i class="far fa-clock fa-4x"></i></a></td>
               <td><a href="./updatedoctorinfo"><i class="fas fa-cog fa-4x"></i></a></td>
            </tr>
            <tr>
               <td><a href="./showdoctorcalendar">의사 달력</a></td>
               <td><a href="./updatedoctortime">시간 변경</a></td>
               <td><a href="./updatedoctorinfo">정보수정</a></td>
            </tr>
         
         </table>
         </div>
      </div>   
   <%}
   
%></table>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>