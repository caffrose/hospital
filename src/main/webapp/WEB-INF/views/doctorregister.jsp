<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 회원가입</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
function id_ajax(id) {
	$.ajax({
		url : 'http://192.168.6.88:8080/project3/rest/doctoridcheck?id='+id,
		type : 'get',
		data : JSON.stringify(id),
		contentType : 'application/json;charset=UTF-8',
		success : function(result) {
				if(result >= 1) {
					alert("중복된 아이디입니다");
				} else if(result == 0) {
					alert("사용 가능한 아이디입니다.");
				}
		},
		error : function(xhr, status, error) {
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
}
function email_ajax(email) {
	$.ajax({
		url : 'http://192.168.6.88:8080/project3/rest/doctoremailcheck?email='+email,
		type : 'get',
		data : JSON.stringify(email),
		contentType : 'application/json;charset=UTF-8',
		success : function(result) {
				if(result >= 1) {
					alert("중복된 이메일입니다");
				} else if(result == 0) {
					alert("사용 가능한 이메일 입니다.");
				}
		},
		error : function(xhr, status, error) {
			alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		}
	});
}
$(function() {
	$('#idchekcbutton').click(function() {
		var id = $('#userid').val();
		id_ajax(id);
	});
	$('#emailchekcbutton').click(function() {
		var email = $('#useremail').val();
		email_ajax(email);
	});
});
</script>
<style>
	body {
		font-size:16px;
		min-height:462px;
	}
	h2{margin: 40px auto;text-align: center;}
	table{
		margin: auto;
	}
	#doctorR tr > th {    
		width :200px;
		vertical-align: top;
		text-align: center;
		vertical-align:middle;
   }
   #doctorR tr > td {
		text-align:left;
   }
   #doctorR tr > td > input:not(#btn) {
		width:300px;
		height:40px;
		background-color:transparent;
		border:1px solid #ccc;
		text-align:left;
		margin:10px;
		padding-left: 10px;
   }
   input.btn_address {
		background-color:transparent;
		width: 150px;
		height: 40px;
		border: 1px solid #2f62a7;
		color: #2f62a7;
		margin-left:10px;
   }
   input.btn_submit {
		width:150px;
		height:40px;
		background-color: #2f62a7;
		border:none;
		color: #fff;
		margin-top:50px;
   }
   select {
		width:310px;
		height:43px;
		margin:10px;
		border: 1px solid #ccc;
		color: #8c8c8c;
   }
</style>
</head>
<body>
<%@ include file="../include/banner.jsp" %>
<h2>의사 회원가입</h2>
<%
	String naver_id = (String)session.getAttribute("naver_id");
	String kakao_nickname = (String)session.getAttribute("kakao_nickname");
%>
<div>

<form method="POST" action="doctorRegisterAction2" enctype="multipart/form-data">
<div>

<table id="doctorR">
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" required="" placeholder="이름을 입력해주세요"/></td>
	</tr>
	<tr>
		<th>ID</th>
		<td><input type="text" name="id" required="" placeholder="아이디를 입력해주세요"/><button type="button" id="idchekcbutton">중복체크</button></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pw" required="" placeholder="비밀번호를 입력해주세요"/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" required="" placeholder="이메일을 입력해주세요"/><button type="button" id="emailchekcbutton">중복체크</button></td>
	</tr>
	<tr>
		<th>병원 주소</th>
		<td>
			<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly" required="">
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" id="btn" class="btn_address"><br>
			<input type="text" id="address" name="address" placeholder="주소" required="">
			<input type="text" id="extraAddress" name="extraaddress" placeholder="참고항목" style="width:150px;"><br>
			<input type="text" id="detailAddress" name="detailaddress" placeholder="상세주소" required="">
		</td>
	</tr>
	<tr>
		<th>병원이름</th>
		<td><input type="text" name="hospitalname" placeholder="병원 이름을 입력해주세요"/></td>
	</tr>
	<tr>
		<th>분야</th>
		<td>
		<select name="field">
		    <option value="">분야선택</option>
		    <option value="학생">내과</option>
		    <option value="정형외과">정형외과</option>
		    <option value="재활의학과">재활의학과</option>
		    <option value="비뇨기과">비뇨기과</option>
		    <option value="산부인과">산부인과</option>
		    <option value="안과">안과</option>
		    <option value="피부과">피부과</option>
		    <option value="이비인후과">이비인후과</option>
		    <option value="가정의학과">가정의학과</option>
		    <option value="소아청소년과">소아청소년과</option>
		    <option value="정신건강의학과">정신건강의학과</option>
		    <option value="성형외과">성형외과</option>
		    <option value="응급의학과">응급의학과</option>
		    <option value="신경과">신경과</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>병원전화번호</th>
		<td><input type="text" name="tel" placeholder="병원 전화번호를 입력해주세요"/></td>
	</tr>
	<tr>
		<th>의사면허증</th>
		<td><input type="file" name="multipart" style="vertical-align:middle;"/></td>
	</tr> 
	<tr>
		<th>
			<input type="hidden" name="naver_id" value="<%=naver_id%>"/>
			<input type="hidden" name="kakao_nickname" value="<%=kakao_nickname %>"/>
		</th>	
		<td><input type="submit" value="회원가입" id="btn" class="btn_submit"/></td>
	</tr>
</table>
</div>
</form>
</div>
</body>
</html>