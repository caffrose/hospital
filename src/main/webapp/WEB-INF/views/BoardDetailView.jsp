<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.detailbox{
		width:860px;
		margin:auto;
		padding-top:120px;
		padding-bottom:120px;
	}

	table {
		margin:auto;
	    border-collapse: collapse;
	    text-align: left;
	    line-height: 1.5;
		width:860px;
	}
	
	.titletop{
		border-top:2px solid #4579bf;
		border-bottom:1px solid #e6e6e6;
		font-size:16px;
	}
	
	.titletop td{
		padding:10px 20px;
		background-color:#f3f6f7;
		color:#2f62a7;
	}
	
	.datebottom{
		border-bottom:1px solid #dedede;
	}
	table td {
	    padding-left: 20px;
	}
	
	.writerdaybox{
		padding-top:3px;
		padding-bottom:3px;
		font-size:13px;
		color:#555;
	}
	
	.contentbox{
		min-height: 100px;
	    padding-top: 20px;
	    padding-bottom: 20px;
	    border-bottom:1px solid #dedede;
	}
	/* table thead th {
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	table tbody th {
		width:350px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	 */
	 
	.buttonbox{
		padding-top:30px;
		padding-bottom:100px;
	}
	 
	#btn{
      width: 80px;
      height: 32px;
      font-size:13.5px;
      /* border-radius:10px; */
      margin-left:5px;
      color:white;
      background-color:#307CD8;
      border-width:0px;
      cursor:pointer;
      margin-top:5px;
      font-weight:bold;
      margin-bottom:-20px;
   }
	#btn2 {
		 width: 80px;
      height: 32px;
      font-size:13.5px;
      /* border-radius:10px; */
      margin-left:5px;
      color:white;
      background-color:#c3c3c3;
      border-width:0px;
      cursor:pointer;
      float:right;
      margin-top:5px;
      font-weight:bold;
      margin-bottom:-20px;
	}
	#btn3{
		 width: 80px;
      height: 32px;
      font-size:13.5px;
      /* border-radius:10px; */
      margin-left:5px;
      color:white;
      background-color:#c3c3c3;
      border-width:0px;
      cursor:pointer;
      float:right;
      margin-top:5px;
      font-weight:bold;
      margin-bottom:-20px;
	}
	#img {
		text-align:center;
		margin-top:40px;
		margin-bottom:20px;
	}
</style>
<% String update = (String)session.getAttribute("update"); %>
<script>
	<% if(("ok").equals(update)){%>
	alert("수정되었습니다");
	<%}%>
</script>
</head>
<body>
<div class="detailbox">
<h2 style="font-size: 30px; font-weight:400; padding-bottom:50px;">소식/공지</h2>
	<table>
		<tr class="titletop">
			<td style="width:60%;">${vo.title }</td>
			<td style="padding-right:5px; font-size:13px; width:6%">등록일</td>
			<c:set var="writedate"  value="${vo.writedate }" />
			<td style="font-size:13px; width:11%">${fn:substring(writedate,0,11) }</td>
		</tr>
		<tr class="datebottom">
			<td colspan="3" class="writerdaybox">작성자 &nbsp &nbsp ${vo.writer }</td>
		</tr>	
		<%String img=(String)request.getAttribute("img");
			if(img.equals("(파일없음)"))
				img="";
			else{
		%>
		<tr>
			<td colspan="3"><img src="resources/images/${vo.file }/" id="img"><br/></td>
		</tr>
		<%		
			}
				
		%>
		<tr>
			<td class="contentbox" colspan="3">${vo.content }</td>
		</tr>	
	</table>
	<div class="buttonbox">
		<% String id = (String)session.getAttribute("id");
		   String writer = (String)session.getAttribute("writer");
			if(null!=id&&writer.equals(id)){%>
			<input id="btn2" type="button" onclick="location.href='BoardDeleteAlert?bno=${vo.bno}'" value="삭제"/>
			<input id="btn3" type="button" onclick="location.href='BoardUpdate?bno=${vo.bno}'" value="수정"/>
			<%}%>
		<input style="float:left;" type="button" onclick="location.href='BoardList'" value="목록으로"  id="btn"/>
	</div>	
</div>
<!-- 이미지 없는 사람들은 안뜨게 -->
<%@ include file="../include/footer.jsp" %>
</body>
</html>