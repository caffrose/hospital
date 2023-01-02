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
	#resultbox{
		text-align:center;
		vertical-align:middle;
	}
	h2{
		text-align:center;
		padding-top:30px;
		padding-bottom:20px;
	}
	table{
		max-width:50% important!;
		margin:10px auto;
	}
	td{
		min-width:200px;
		height:30px;
		padding:15px 10px 15px 30px;
	}
	btn{
		display:flex;
	}
	#btn_main{
		background-color: #2F62A7;
	    font-size:14px;
	    border: none;
	    color: #fff;
	    width: 230px;
	    height: 45px;
	    margin-bottom: 5px;
	}
	#btn_update{
		background-color: #fff;
	    font-size:14px;
	    border: 1px solid #2F62A7;
	    color: #2F62A7;
	    width: 230px;
	    height: 45px;
	    margin-bottom: 5px;
	}
</style>
</head>
<body>
<div id="resultbox">
<h2>회원정보</h2>
<table>
	<tr>
		<th>이름</th>
		<td>${vo.name}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${vo.id}</td>
	</tr>
	<tr>
		<th>거주지 주소</th>
		<td>${vo.address} ${vo.detailaddress} ${vo.extraaddress}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${vo.tel}</td>
	</tr>
</table>
<div id="btn">
	<a href="${pageContext.request.contextPath}/"><button type="button"id="btn_main">메인화면으로</button></a>
	<a href="${pageContext.request.contextPath}/clientUpdate"><button type="button" id="btn_update">회원정보수정</button></a>
</div>
</div>
</body>
<%@ include file="../include/footer.jsp" %>
</html>