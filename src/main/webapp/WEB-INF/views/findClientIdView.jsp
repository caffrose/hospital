<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String findId = (String)session.getAttribute("findId"); %>
<script>
	<%if(findId!=null){%>
		alert("찾으시는 아이디는 <%=findId%>입니다");
		document.location.href="login";
	<%}else{%>
		alert("등록되지 않은 사용자입니다");
		document.location.href="findClientId";
	<%}%>
</script>
</head>
<body>

</body>
</html>