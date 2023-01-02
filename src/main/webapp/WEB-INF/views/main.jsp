<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	<%	String ok1 = (String)session.getAttribute("clientUpdate");
		if(("ok").equals(ok1)){%>
			alert("변경이 완료되었습니다");
			document.location.href="./";
	<%	} %>

   <% String updateFinish = (String)request.getAttribute("updateFinish");
      if(("ok").equals(updateFinish)) {   %>
         alert("진료를 완료하였습니다.\n메인페이지로 이동합니다.");
         document.location.href="./";
   <%   }   %>
</script>
</head>
<body>

</body>
</html>