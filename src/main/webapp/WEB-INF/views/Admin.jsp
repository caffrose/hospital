<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<style>
   .div{
   }
   #btn1{
      width:350px;
      height: 208px;
       border-radius: 10px;
       font-size: 60px;
       margin:300px 100px 300px 300px;
       border-color: #2F62A7;
       background-color: white;
       border-width: 2px;
       color:#2F62A7;
       cursor:pointer;
   }
   #btn2{
      width:500px;
      height: 208px;
       border-radius: 10px;
       font-size: 60px;
       border-color: #D9E2F3;
       background-color: #2F62A7;
       border-width: 2px;
       color:white;
       cursor:pointer;
   }
   #img1{
      width:300px;
   }
   #img2{
      width:300px;
   }
   .div1{
      float:left;
      text-align:center;
      margin:200px;
      margin-left:350px;
      font-size:bold;
      font-size:45px;
      cursor:pointer;
   }
   .div2{
      float:left;
      text-align:center;
      margin:200px;
      margin-left:50px;
      font-size:bold;
      font-size:45px !important;
      cursor:pointer;
   }
</style>
</head>
<body>
<div style="min-height:800px;">
<div class="div1">
   <img onclick="location='BoardList'" src="resources/images/게시판로고.png" id="img1">
   <p>게시판</p>
</div>
<div class="div2">
   <img onclick="location='admin_doctorMember'" src="resources/images/의사아이콘.png" id="img2">
   <p>의사사용자관리</p>
</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>