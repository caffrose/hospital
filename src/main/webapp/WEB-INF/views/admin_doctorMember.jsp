<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	table {
	    border-collapse: collapse;
	    text-align: left;
	    line-height: 1.5;
		width:80%;
		margin:30px 30px 30px 30px;
	}
	table thead th {
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	table tbody th {
	    width: 150px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	table td {
	    width: 350px;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
</style>
</head>
<body>
<table class="table">
	<thead>
		<tr>
			<th>이름</th>
			<th>과</th>
			<th>병원</th>
			<th>주소</th>
			<th>전화번호</th>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list2}">
			<tr>
				<td><a href="${pageContext.request.contextPath}/admin_doctor_detail?name=${vo.name}">${vo.name}</a></td>
				<td>${vo.field}</td>
				<td>${vo.hospitalname}</td>
				<td>${vo.address}</td>
				<td>${vo.tel}</td>
			</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>