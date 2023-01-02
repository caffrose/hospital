<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
	body {font-family: "Noto Sans KR", sans-serif important!; }
	body div#divMain{ width:900px; margin: 0px auto;}
	ul {overflow: hidden; margin:0; padding:0;}
	li#head1 {float: right; list-style: none; width: 12%; position: relative;}
	li#head1>a {padding: 5px 15px; display: block; text-align: center; color: #000; text-decoration: none;}
	li#head1>a::before {content:""; width: 1px; height: 15px; border-left: 1px solid #000; position: absolute; top: 9px; left: -1px; }
</style>
</head>
<body>
<%
	if(session.getAttribute("name")==null){%>
		<ul>
			<li id="head1"><a href="${pageContext.request.contextPath}/register">회원가입</a></li>
			<li id="head1"><a href="${pageContext.request.contextPath}/login">로그인</a></li>
		</ul>
		
		
	<%}else{
		String name =(String)session.getAttribute("name");%>
		
		<ul>
			
			<li id="head1"><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
			<li id="head1"><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
			<li id="head1">"<%=name %>"님 반갑습니다.</li>
		</ul>
		
	<%}
%>

</body>
</html>