<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var result = confirm("글을 정말로 삭제하시겠습니까?");
	if(result){
		alert("삭제되었습니다.");
		document.location.href="BoardDelete?bno="+${bno}
	}else{
		history.back(-1);
	}
</script>
</body>
</html>