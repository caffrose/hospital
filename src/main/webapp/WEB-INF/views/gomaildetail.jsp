<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
i {
	color: #2F62A7;
}
#mailpage{
	min-height:700px;
}
#table{
	vertical-align:middle;
	margin:20px auto;
}
th{
	padding:20px 20px 20px 20px;
	text-align:right;
}
td.not(.envelop){
	padding:20px 20px 20px 20px;
	text-align:left;
}
h2{
	text-align:center;
	color: #2F62A7;
	padding-left:20px;
	padding-top:20px;
}
</style>
</head>
<body>
<div id="mailpage">
<table id="table">
	<tr>
		<td colspan="2"><h2>수신 이메일</h2></td>
	</tr>
	<tr>
		<td></td>
		<td style="padding:40px 0px 5px 0px;"><i class="fas fa-envelope-open-text fa-10x"></i></td>
	</tr>
	<tr>
		<th>To</th>
		<td>${memberid}&nbsp;(ID : ${vo.memberid })</td>
	</tr>
	<tr>
		<th>From</th>
		<td>${doctorid}&nbsp;(ID : ${vo.doctorid })</td>
	</tr>
	<tr>
		<th>보낸시각</th>
		<td>${vo.datetime }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><a href="${vo.content }">클릭시 해당 페이지로 이동합니다.</a></td>
	</tr>
</table>
</div>
</body>
<%@ include file="../include/footer.jsp" %>
</html>