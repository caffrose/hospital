<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
<style>
	h1{
		text-align:center;
		margin:30px auto;
		padding-top:30px;
		font-size:60px;
		text-shadow: 2px 2px 5px #777;
	}
	#table{
		vertical-align:middle;
		margin:70px auto;
	}
	li{list-style:none; margin:7px auto;}
	td{
		padding:10px 15px;
		/* min-width:200px; */
		width: 170px;
	}
	#reservation {
		border-left: 2px solid #2f62a7;
		padding-left: 70px;
	}
	#i1{
		border-right: 1px solid #333;
	}
</style>
<script>
	function gobooking(){
		location.href="./selecttable";
		}
</script>
</head>
<body>
<%String part = (String)session.getAttribute("part"); %>
<h1>선택한 사항 및 예약</h1>
<table id="table">
<%@include file="../include/banner.jsp" %>	<!-- 배너....이상함요.... -->
	<tr>
		<td colspan="2"></td>
		<td rowspan="2" style="width:200px;padding-top:80px; padding-left:80px; id="reservation"><img style="width:350px;" src="resources/images/reserve.png" onclick="gobooking()" alt="예약하기"></td>
	</tr>
	<tr>
		<td id="i1"colspan="2"><img style="width:350px;" src="resources/images/hospital.png"></td>
	</tr>
	<tr>
	
	<td   style="width:200px;font-size:24px; font-weight:800; color:#2b5fa6;">선택한 부위 </td>
	<td id="i1"  style="width:200px;font-size:24px; font-weight:800; color:#2b5fa6;"><%=part %></td>
		</tr>
		<tr>
		<td style="font-size:24px; font-weight:800; color:#2b5fa6;">선택한 증상</td>
		<td id="i1">
			<ul>
				<c:forEach var="list" items="${list}">
					<li style="font-size:24px; font-weight:800; color:#2b5fa6;">${list}</li>
				</c:forEach>
			</ul>
		</td>
		<td style="text-align:center; font-size:24px; font-weight:800; color:#2b5fa6;">
			병원 및 의사 예약하기
		</td>
	</tr>
	<tr>
		<td style="width:150px; font-size:24px; font-weight:800; color:#2b5fa6;">연결되는 과</td>
		<td id="i1" style="width:250px; font-size:24px; font-weight:800; color:#2b5fa6;">${gethospital}</td>
	</tr>
</table>
	
<%@ include file="../include/footer.jsp" %>
</body>
</html>