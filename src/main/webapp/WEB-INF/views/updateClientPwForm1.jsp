<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String check = (String)session.getAttribute("Check"); %>
<script>
	<%if(("n").equals(check)){%>
		alert("아이디 또는 이메일이 일치하지 않습니다")
	<%}%>
</script>
</head>
<body>
<h1>비밀번호찾기</h1>
<form action="clientPwCheck">
아이디 : <input type="text" name="id"/><br/>
이메일 : <input type="text" name="email"/><br/>
<input type="submit" value="찾기"/>
</form>
</body>
</html>