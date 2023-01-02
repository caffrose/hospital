<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
function cancelbooking(){
	ajax_delete();
}

function ajax_delete(){
	  var data1={
      	    doctorNum: '${vo.doctorNum}',
			start: '${vo.startDate }',
			end: '${vo.endDate }',
			mid: '${vo.mid }'
				
	        }
		$.ajax({
			url:'http://192.168.6.88:8080/project3/rest/delete',
			type:'post',
			data:JSON.stringify(data1),
			dataType: 'json',
		contentType: 'application/json',
			success: function(response){
				
				location.href="./showdoctorcalendar";
			},
			error: function(){
				alert("에러!");
		
			}
		});
	} 

function url_ajax() {
	var url = document.getElementById("url").value;
	 var data1={
			 startDate:'${vo.startDate}',
	            mid: '${vo.mid}',
	            type: '${vo.type}',
	            url: url
	            
	           }
		$.ajax({
			url : 'http://192.168.6.88:8080/project3/rest/sendurl?type=video&url='+url,
			type : 'post',
			 data:JSON.stringify(data1),
	         dataType: 'json',
	         contentType: 'application/json',
			success : function(response) {
				alert("제출이 완료되었습니다.")
			},
			error : function(xhr, status, error) {
				alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			}
		});
	}
	$(document).ready(function() {
		$("#btn_submit").click(function() {
			url_ajax();
		});
	});
</script>
<style>
	h2{
		text-align:center;
		margin:30px auto;
		padding-top:30px;
	}
	#table{
		text-align:center;
		vertical-align:middle;
		margin:20px auto;
	}
	th{padding:10px 15px;}
	td{padding:10px 15px;}
	#connect{
		display:flex;
		text-align:center;
		width:32%;
		margin:20px auto;
		position:relative;
	}
	#chatting{
		text-align:center;
		margin-bottom:30px;
	}
	#connect_inner1{
		padding:15px 15px;
	}
	#connect_inner2{
		padding:15px 15px;
	}
	#btn_cancel{
		border:0 solid #fff;
		width:300px;
		height:50px;
		background-color:#2f62a7;
		color:#fff;
	}
</style>
</head>
<body>
<form action="finish">
<table id="table">
	<h2>환자 및 질환정보</h2>
	<tr>
		<td rowspan="8"><img style="width:160px;" src="resources/images/prescriptionB.png" id="prescription"></td>
	</tr>
	<tr>
		<th>환자정보?</th>
		<td>${vo.mid}</td>
	</tr>
	<tr>
		<th>예약 시작 시간</th>
		<td>${vo.startDate}</td>
	</tr>
	<tr>
		<th>예약 종료 시간</th>
		<td>${vo.endDate}</td>
	</tr>
	<tr>
		<th>예상 병명</th>
		<td>${vo.diseaseName}</td>
	</tr>
	<tr>
		<th>관련질환</th>
		<td>${vo.related}</td>
	</tr>
	<tr>
		<th>연결방법</th>
		<td>${vo.type}</td>
	</tr>
	<tr>
		<th><input type="hidden" value="${vo.cNum}" name="cNum"/></th>
		<td><button onclick="cancelbooking()" id="btn_cancel">예약 취소</button></td>
	</tr>
</table>
<br/><br/>

<hr size="3" noshade width="50%">

<br/><br/>
<div id="chatting">
	<h4>채팅방 생성</h4>
	<p>밑의 아이콘을 클릭하면 채팅방을 생성할 수 있습니다.</p>
	<div id="connect">
		<div id="connect_inner1">
			<a href="javascript:void(window.open('${url}','방', 'width=#, height=#'))"><img style="width:160px;" src="resources/images/videocallB.png"></a>
		</div><br/><br/>
		<div id="connect_inner2">	
			<p>방 만든 후 해당 url을 입력 후 제출 버튼을 눌러주세요</p><br/>
			<input type="text" placeholder="ex) ${url}/?...." id="url">
			<button type="button" id="btn_submit">제출</button>
		</div>
	</div>
	<input type="submit" id="btn_finish" value="진료완료"/>
</div>
</form>
</body>
<%@ include file="../include/footer.jsp" %>
</html>