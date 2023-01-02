<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul {overflow: hidden; margin:0; padding:0;}
	li#head2 {float: left; list-style: none; width: 20%; position: relative;}
	li#head2>a {padding: 5px 15px; display: block; text-align: center; color: #000; text-decoration: none;}
	li#head2>a::before {content:""; width: 1px; height: 15px; border-left: 1px solid #000; position: absolute; top: 9px; left: -1px; }
	/*  img{width:160px;}*/
</style>
</head>
<body>
<ul>
	<li id="head2"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/DoctorYGLogo.png"width="160"></a></li>
	<li id="head2"><a href="${pageContext.request.contextPath}/select">진단체크</a></li>
	<li id="head2"><a href="${pageContext.request.contextPath}/findhospital">내주변 병원찾기</a></li>
	<li id="head2"><a href="${pageContext.request.contextPath}/BoardList">공지사항</a></li>
	<li id="head2"><a href="${pageContext.request.contextPath}/doctorRank">의사랭킹</a></li>
</ul>
</body>
</html>