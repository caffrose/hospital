<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	<% String doctorDelete = (String)session.getAttribute("doctorDelete");
	   String login_id = (String)session.getAttribute("login_id");
	   if(("ok").equals(doctorDelete)){%>
	   		var result = confirm("정말로 탈퇴하시겠습니까?\n탈퇴시 모든 회원정보는 삭제됩니다")
	   		if(result==true){
				alert("탈퇴되었습니다")
				document.location.href="doctorDeleteAction?id=<%=login_id%>"
		   	}else{
				document.location.href="main";
			}
	   <%}%>
</script>
</head>
<body>

</body>
</html>