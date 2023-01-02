<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<style>
	h2 {margin : 80px auto; text-align:center;}
	#button {margin : 20px auto; text-align:center;}
	#btn_client {
		background-color:#2f62a7;
		border : none;
		width: 345px;
	    height: 45px;
	}
	#btn_doctor {
		margin-top: 30px;
		background-color:#fff;
		border : 1px solid #2f62a7;
		width: 345px;
	    height: 45px;
	}
	#client_a{text-decoration:none; color:#fff;}
	#doctor_a{text-decoration:none; color:#2f62a7;}
</style>
</head>
<body>
<h2>회원가입 선택</h2>
<div id="button">
	<button type="button" id="btn_client"><a href="${pageContext.request.contextPath}/clientRegister" id="client_a">일반 회원가입</a></button>
	<br/>
	<button type="button" id="btn_doctor"><a href="${pageContext.request.contextPath}/doctorRegister" id="doctor_a">의사 회원가입</button>
</div>
</body>
</html>