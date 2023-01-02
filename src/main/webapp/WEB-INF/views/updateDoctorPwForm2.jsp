<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String updatePw = (String)session.getAttribute("updatePw"); %>
<script>
	<%if(("y").equals(updatePw)){%>
		alert("비밀번호가 변경되었습니다")
		document.location.href="login";
	<%}else if(("n").equals(updatePw)){%>
		alert("비밀번호가 일치하지 않습니다");
	<%}%>
</script>
</head>
<body>
<h1>비밀번호변경</h1>
<form action="updateDoctorPwAction">
비밀번호 : <input type="password" name="pw"/><br/>
비밀번호 확인 : <input type="password" name="pwc"/>
<input type="submit" value="변경"/>
</form>
</body>
</html>