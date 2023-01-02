<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
	    border-collapse: collapse;
	    text-align: left;
	    line-height: 1.5;
	    width:100%;
	
	}
	table thead th {
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	table tbody th {
		width:100px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	table td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	#btn{
		width: 100px;
		height: 40px;
		font-size:19px;
		border-radius:10px;
		margin-left:5px;
		color:white;
		background-color:#307CD8;
		border-width:0px;
		cursor:pointer;
		float:right;
		margin-top:5px;
	}
</style>
</head>
<body>
<table class="table">
		<tr>
			<th scope="row">이름</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th scope="row">면허증</th>
			<td><img src="${pageContext.request.contextPath}/resources/images/${vo.license }/"></td>
		</tr>
</table>
<input type="button" onclick="location='admin_detail_action?id=${vo.id}'" value="승인" id="btn"/>
</body>
</html>