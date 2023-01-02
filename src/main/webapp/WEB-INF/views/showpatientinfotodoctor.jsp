<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<style>
	h2{
		text-align:center;
		margin:30px auto;
		padding-top:30px;
	}
	#table{
		text-align:center;
		vertical-align:middle;
		margin:20px auto;
	}
	th{padding:10px 15px;}
	td{padding:10px 15px;}
	#gotocalendar{
		border:0 solid #fff;
		width:300px;
		height:50px;
		background-color:#2f62a7;
		color:#fff;
	}
</style>
</head>
<body>
<table id="table">
	<h2>환자 및 질환정보</h2>
	<tr>
		<td rowspan="8"><img style="width:160px;" src="resources/images/prescriptionB.png" id="prescription"  style="width:160px;"></td>
	</tr>
	<tr>
		<th>환자 이름</th>
		<td>${name}</td>
	</tr>
	<tr>
		<th>예약 시작 시간</th>
		<td>${vo.startDate}</td>
	</tr>
	<tr>
		<th>예약 종료 시간</th>
		<td>${vo.endDate}</td>
	</tr>
	<tr>
		<th>예상 병명</th>
		<td>${vo.diseaseName}</td>
	</tr>
	<tr>
		<th>관련질환</th>
		<td>${vo.related}</td>
	</tr>
	<tr>
		<th>연결방법</th>
		<td>${vo.type}</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<td><a href="./showdoctorcalendar"><button id="gotocalendar">일정페이지로</button></a></td>
	</tr>
</table>
</body>
<%@ include file="../include/footer.jsp" %>
</html>