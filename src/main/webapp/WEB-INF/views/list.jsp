<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div#list { 
	width:70%;
	margin:20px auto;
}
 div.tip {
    text-decoration: none;
    width:20%;
    float:left;
    margin:5px auto;
}
div.tip:hover {
    cursor: help;
    position: relative;
}
div.tip span {
    display: none;
}
div.tip:hover span {
    border: #c0c0c0 1px dotted;
    padding: 5px 20px 5px 5px;
    display: block;
    z-index: 100;
    background: #f0f0f0 no-repeat 100% 5%;
    left: 0px;
    margin: 10px;
    width: 250px;
    position: absolute;
    top: 10px;
    text-decoration: none
}
 </style>
</head>
<body>
<div id="list">
<form action="checked">
	<c:forEach var="list" items="${list}">
		<div class="tip">
			<input type="checkbox" name="symptom" value="${list.symptom}">${list.symptom}
			<span>${list.description}</span>
		</div>
		<%-- <input type="hidden" name="part" value="${list.part}"/> --%>
	</c:forEach>
	<%String part = (String)session.getAttribute("part");%>
	<input type="hidden" name="part" value="<%=part %>">
	<input type="submit" value="제출"/>
</form>
</div>
</body>
</html>