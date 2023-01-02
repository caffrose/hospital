<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원로그인</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
	body {
		font-family: "Noto Sans KR", sans-serif !important;
		font-size:16px !important;
		min-height:462px;
	}
	h2{
		margin: 20px auto;
		text-align: center;
	}
	table{
		margin: 50px auto;
		width:340px;
		height: 296px;
		padding: 0px 40px 100px 40px;
	}
	td > input#log {
		font:"Noto Sans KR", sans-serif;
		font-size:14px;
		width:302px;
		height:42px;
		text-align: left;
		padding-right:14px;
		padding-left:14px;
		border:1px solid #cccccc;
	}
	ul{
		list-style: none;
	}
	.find li{
		/* display: inline-block;*/
		font-size: 12px;
		float: right;
		padding: 10px;
		list-style:none;
	}
	h2{
		margin: 20px auto;
		text-align: center;
	}
/*	.gnb_kurly {font-size:16px;}	*/
	#text_btn_login {
	    background-color: #2F62A7;
	    font-size:14px;
	    border: none;
	    color: #fff;
	    width: 345px;
	    height: 45px;
	    margin-bottom: 5px;
	}
	#text_btn_join {
	    background: none;
	    font-size:14px;
	    border: 1px solid #2F62A7;
	    color: #2F62A7;
	    width: 345px;
	    height: 45px;
	    margin-bottom: 5px;
	}
	#kakao_login{
		background: #F0D641;
	    font-size:14px;
	    border: none;
	    color: #000;
	    width: 345px;
	    height: 45px;
	    margin-bottom: 5px;
	}
	#naver_login{
		background: #19CE60;
	    font-size:14px;
	    border: none;
	    color: #fff;
	    width: 345px;
	    height: 45px;
	    margin-bottom: 5px;
	}
	a {text-decoration:none; color:#636363;}
</style>
<script>
<% String option = (String)session.getAttribute("option");
   String approve = (String)session.getAttribute("approve");
   if("n".equals(option)){%>
      alert("옵션을 선택해주세요");
   <%} session.removeAttribute("option");
   if("대기중".equals(approve)){%>
      alert("관리자 승인 후 로그인이 가능합니다");
   <%} session.removeAttribute("approve");%>
   
</script>
</head>
<body>
<div class = "container">
	<form action="loginAction" method="post">
	<table id="table">
	<h2> 로그인  </h2>
	<div id="option" style="text-align:center;">
	<span class="o_radio"><input type="radio" name="loginoption" value="client" checked/>일반회원</span>
	<span class="o_radio"><input type="radio" name="loginoption" value="doctor"/>의사회원</span>
	</div>
		<tr><td> <input type="text" name ="id" id="log" placeholder="아이디를 입력해주세요"/></td></tr>
		<tr><td><input type="password" name ="pw" id="log" placeholder="비밀번호를 입력해주세요"/></td></tr>
		<tr><td class="find"> 
			<li><a href="updateClientPw">비밀번호 찾기</a></li>
			<li><a href="findClientId">아이디 찾기</a></li>
		</td></tr>
		<tr style="text-align: center">
			<td colspan="2" ><input type="submit" id="text_btn_login" value="로그인"/></td>
		</tr>
		<tr style="text-align: center" id="btn">	
			<td colspan="2"><input type="button" id="kakao_login" value="카카오로 로그인 " onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=e2b2416baf76b7ae31b2abdc88385453&redirect_uri=http://192.168.6.88:8080/project3/kakaologin&response_type=code'"/></a></td>
		</tr>
		<tr style="text-align: center" id="btn">	
			<td colspan="2"><input type="button" id="naver_login" value="네이버로 로그인" onclick="location.href='${url}'"/></a></td>
		</tr>
		<tr style="text-align: center" id="btn">	
			<td colspan="2"><input type="button" id="text_btn_join" value="회원가입" onclick="location.href='register'"/></a></td>
		</tr>
	</table>
	</form>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>