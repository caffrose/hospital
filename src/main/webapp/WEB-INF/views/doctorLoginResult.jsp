<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String doctorlogin = (String)session.getAttribute("doctorlogin"); 
   String name = (String)session.getAttribute("name");
%>
<script>
	<%if(("성공").equals(doctorlogin)){%>
		alert("<%=name%>님 반갑습니다")
		document.location.href="./";
	<%}else{%>
		alert("아이디 또는 비밀번호가 일치하지 않습니다");
		document.location.href="login";
	<%}%>
</script>
</head>
<body>

</body>
</html>