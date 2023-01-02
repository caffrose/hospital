<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
<style>
	#container{
		margin:auto;
		padding-top:100px;
		padding-bottom:100px;	
	}
	table{
		margin:auto;
	}
	th{
		padding-bottom:20px;
	}
	.timebox{
		text-align: center;
		padding-left:35px;
		padding-right:35px;
		padding-bottom:10px;
		width:100px;
		height:24px;
	}
	
	.timebox td{
		border-left:1px solid gray;
	}
	
	#btn{
		width: 100px;
	    height: 40px;
	    border: 1px solid #2f62a7;
	    background-color: #2f62a7;
	    color:white;
	}
	
	.infobox{
		padding:30px;
		margin: auto;
	    background: #eeeeee;
	    width: 764px;
	    margin-bottom:50px;
	}
	
	.qatitle{
		background: #2f62a7;
    	padding: 5px 15px;
	    border-radius: 10px;
	    color: #fff;
	    font-size: 15px;
	    width: 150px;
	    margin:auto;
	    text-align:center;
	}
	
	.qacontent{
		margin-top:20px;
		font-weight:300;
		font-size:13px;
	    line-height: 24px;
		
	}
</style>
<script>
$(function() {
	$('.timelist').mouseenter(function(e) {
		$(this).mousemove(function(e) {
			$(this).css('font-size','18px');
		});
	});
	$('.timelist').mouseleave(function() {
		$(this).css('font-size','15px');
	});
});
</script>
</head>
<body>
<%
	String[] str=(String[])request.getAttribute("list");
	StringBuffer sbuff=new StringBuffer();
	for(int i=0;i<str.length;i++){
		sbuff.append(str[i]);
		if(i!=str.length-1){
			sbuff.append(",");
		}
	}
%>
<div id="container">
	<div class="infobox">
		<div class="qatitle">안내 및 유의사항</div>
		<div class="qacontent">
			* 회원가입시 월~금(9시에서 17시 30분, 11시30분~13시30분 제외)로 고정되어있습니다<br/>
			* 가능한 시간을 선택해 고정시간을 변경해주십시오<br/>
		</div>
	</div>
<form action="updatedoctortime2" method="post">
<table>
	<th>월</th>
	<th>화</th>
	<th>수</th>
	<th>목</th>
	<th>금</th>
	<tr>
		<td>
		<script>
			var count = 0;
			var idx=0;
		</script>
		<c:forEach var="list" items="${defaultitme}">
			<script>
				var list="${list}";
				var timelist=list.substring(4,9);
				var time="<%=sbuff.toString()%>";
				var doctortime=time.split(",");
				var i=0;
				++idx;
				for(var i in doctortime){
					if(list==doctortime[i]){
						document.write('<div class="timebox">');
						document.write('<input type="checkbox" id="checkmark'+idx+'" name="time" value="${list}" checked=true/>&nbsp&nbsp<label for="checkmark'+idx+'" class="timelist">'+timelist+'</label><br/>');
						document.write('</div>');
						i=1;
						break;
					}	
				}
				if(i!=1){
					document.write('<div class="timebox">');
					document.write('<input type="checkbox" id="checkmark'+idx+'" name="time" value="${list}"/>&nbsp&nbsp<label for="checkmark'+idx+'" class="timelist">'+timelist+'</label><br/>');
					document.write('</div>');
				}	

				if(++count%18==0) {
					if(count==90)
						document.write('</td><td>');
					else
						document.write('</td><td style="border-left: 1px solid #c3c3c3;">');
				}
			</script>
		</c:forEach>
		</td>
	</tr>
	<tr><td style="padding-top:50px" colspan='5'></td></tr>
	<tr>
		<td style="padding-top:50px;"></td><td></td><td></td><td></td>
		<td style="float:right; padding-right:40px;">
			<input id ="btn" type="submit" value="변경"/>
	</td></tr>
</table>
</form>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>