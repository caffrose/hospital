<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		color:#2f62a7;
	}
	
	input[type="text"]{
		width: 708px;
		border: 1px solid #999;
	}
	
	.datebottom{
		border-bottom:1px solid #e6e6e6;
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
</head>
<body>
<form method="POST" action="BoardWriteAction" enctype="multipart/form-data">
<div class="detailbox">
<h2 style="font-size: 30px; font-weight:400; padding-bottom:50px;">소식/공지</h2>
	<table>
		<tr class="titletop">
			<td>제목</td>
			<td style="width:90%;"><input type="text" name="title" value="${vo.title }"/></td>
		</tr>
		<tr>
			<td style="padding-top:20px;" colspan="2"><textarea style="border: 1px solid #999;" cols="108" rows="20" name="content">${vo.content }</textarea></td>
		</tr>	
		<%-- <%String img=(String)request.getAttribute("img");
			if(img.equals("(파일없음)"))
				img="";
			else{
		%> --%>
		<tr>
			<td class="contentbox" colspan="2"><%-- <img src="resources/images/${vo.file }/" id="img"><br/>(사진 변경)<br/> --%><input type="file" name="multipart"/></td>
		</tr>
		<%-- <%		
			}
				초기값주기
		%> --%>
	</table>
	<div class="buttonbox">
			<input id="btn3" type="submit" value="글쓰기"/>
		<input style="float:left;" type="button" onclick="location.href='BoardList'" value="목록으로"  id="btn"/>
	</div>	
</div>
</form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>