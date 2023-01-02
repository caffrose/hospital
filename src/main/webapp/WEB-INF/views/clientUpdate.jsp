<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
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
</script>
<style>
   body {
      font-size:16px;
      min-height:600px;
   }
   h2{margin: 40px auto;text-align: center;}
   p{text-align:center; margin:0 auto; color:#c3c3c3;}
   table{
      margin: auto;
   }
   #clientR tr > th {    
      width :200px;
      vertical-align: top;
      text-align: center;
      vertical-align:middle;
   }
   #clientR tr > td {
      text-align:left;
   }
   #clientR tr > td > input:not(#btn) {
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
   td#voId{
         padding:10px 10px 10px 25px;
         
   }
</style>
</head>
<body>
<div id="divMain">
<h2>회원정보수정</h2>
<p><u>※ 이름, 비밀번호, 주소, 전화번호만 수정가능합니다</u></p>
<form action="clientUpdateAction">
<table id="clientR">
   <tr>
      <th>이름</th>
      <td><input type="text" name="name" value="${vo.name}"/></td>
   </tr>
   <tr>
      <th>ID</th>
      <td id="voId">${vo.id}</td>
   </tr>
   <tr>
      <th>비밀번호</th>
      <td><input type="password" name="pw" value="${vo.pw}"/></td>
   </tr>
   <tr>
      <th>거주지 주소</th>
      <td>
         <input type="text" id="postcode" name="postcode" readonly="readonly" value="${vo.postcode}"/>
         <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" id="btn" class="btn_address"><br>
         <input type="text" id="address" name="address" value="${vo.address}"/><br>
         <input type="text" id="detailAddress" name="detailaddress"value="${vo.detailaddress}"/>
         <input type="text" id="extraaddress" name="extraaddress"value="${vo.extraaddress}"/>
      </td>
   </tr>
   <tr>
      <th>전화번호</th>
      <td><input type="text" name="tel" value="${vo.tel}"/></td>
   </tr>
   <tr>
      <th>
         <input type="hidden" name="maybeid" value="${vo.id}"/>
      </th>
      <td><input type="submit" value="수정" id="btn" class="btn_submit"/></td>
   </tr>
</table>
</form>
</div>
</body>
<%@ include file="../include/footer.jsp" %>
</html>