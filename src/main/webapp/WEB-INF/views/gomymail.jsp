<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<style>
	#mailbox{
		min-height:600px;
		text-align:center;
		vertical-align:middle;
		font-weight:500;
	}
	h3{
		padding-top:30px;
		padding-bottom:20px;
	}
	table{
		max-width:50% important!;
		margin:10px auto;
	}
	td{
		min-width:430px;
		height:30px;
		padding:10px 10px 10px 10px;
	}
</style>
</head>
<body>
<div id="mailbox">
<h3>쪽지함</h3>
<div>
<table>
<tr>
	<td>의사 정보</td>
	<td>내용</td>
	<td>시간</td>
</tr>
	<c:forEach var="item" items="${list }">
		<script>
			hit=${item.hit};
			if(hit==0)
				document.write("<table><tr><td id='mailbox'>${item.doctorid}</td><td> <a href='./gomaildetail?num=${item.num }'>${item.content}</a></td><td> ${item.datetime }</td></tr></table>");
				
			else 
				document.write('<table><tr><td style="color:gray">${item.doctorid}</td><td style="color:gray"> <a href="./gomaildetail?num=${item.num }">${item.content}</a></td><td style="color:gray"> ${item.datetime }</td></tr></table>');
		</script>
	</c:forEach>
</table>
</div>	
</div>
</body>
<%@ include file="../include/footer.jsp" %>
</html>