<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
	body {font-family: "Noto Sans KR", sans-serif; }
	.serchlist_boxwrap > li {
		list-style:none;
	}
	.serchlist_boxwrap > li .doctor_photo img.d_photo{
	    float: left;
	    width: 180px;
	    margin-right: 40px;
	    padding-top:30px;
	}
	.serchlist_boxwrap > li .doctor_info {
	    position: relative;
	    margin-left: 220px;
	    padding-top: 9px;
	    width:70%;
	}
	.serchlist_boxwrap > li .doctor_info .doctor_name {
	    padding-bottom: 20px;
	    border-bottom: 1px solid #ccc;
	    color: #111;
	    font-size: 24px;
	    font-weight: bold;
	    line-height: 24px;
	}
	.serchlist_boxwrap > li .doctor_info .professionally_wrap {
	    padding: 14px 0 20px 0;
	    border-bottom: 1px solid #ccc;
	}
	.serchlist_boxwrap > li .doctor_info .professionally_wrap .professionally_info {
	    width: 100%;
	}
	table {
	    border-collapse: collapse;
	    border-spacing: 0;
	}
	.serchlist_boxwrap > li .doctor_info .professionally_info td {
	  	padding-bottom: 10px;
	    text-align: left !important;
	}
	#fieldimg{
		width:80%;
		margin:50px auto;
		display:flex;
	}
	p.motto{
		width:80%;
		margin:20px auto;
	}
	h1{
		width:80%;
		margin:20px auto;
		color:#2F62A7;
	}
</style>
</head>
<body>
<h1>${vo.mottohead}</h1>
<p class="motto">${vo.motto}</p>
<img src="resources/images/${vo.image}" id="fieldimg">
<h2 style="padding:10px 10px 20px 50px; color:#2F62A7;">의료진 소개</h2>
<hr size="2px" color="#2F62A7" width="90%" align="center">
<ul class="serchlist_boxwrap">
<c:forEach var="list" items="${list}">
	<li>
		<div class="doctor_photo">
			<img src="resources/images/${list.doctorimg}" class="d_photo">
		</div>
		<div class="doctor_info">
			<p class="doctor_name">${list.name}</p>
			<div class="professionally_wrap">
				<table class="professionally_info">
					<tr>
						<th>병원이름</th>
						<td>${list.hospitalname}</td>
					</tr>
					<tr>
						<th>진료과</th>
						<td>${list.field}</td>
					</tr>
					<tr>
						<th>병원주소</th>
						<td>${list.address} ${list.detailaddress}</td>
					</tr>
					<tr>
						<th>병원전화번호</th>
						<td>${list.tel}</td>
					</tr>
				</table>
			</div>
		</div>
	</li>
</c:forEach>
</ul>
</body>
</html>