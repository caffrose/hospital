<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                    document.getElementById("extraaddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraaddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
</script>
<style>
   #infobox{
      padding-top:100px;
      padding-bottom:150px;
   }

   #infobox table{
      margin:auto;
   }
   
   #infobox input:not(#btn) {
       width: 300px;
       height: 40px;
       background-color: transparent;
       border: 1px solid #ccc;
       text-align: left;
       margin: 10px;
       padding-left: 10px;
   }
   
   input.btn_address {
       background-color: transparent;
       width: 150px;
       height: 40px;
       border: 1px solid #2f62a7;
       color: #2f62a7;
       margin-left: 10px;
   }
   
   input.btn_update{
      width: 150px;
       height: 40px;
       border: 1px solid #2f62a7;
       background-color: #2f62a7;
       color:white;
   }
   
</style>
</head>
<body>
<div class="container">
   <div id="infobox">
         <form action="updatedoctorinfo2" method="get">
         <table>
            <tr>
               <td rowspan='6'><img src="resources/images/${vo.doctorimg}"></td>
               <td style="height: 120px;">  </td>
            </tr>
            <tr>
               <td>  </td>
            </tr>
            <tr>
               <td>  </td>
            </tr>
            <tr>
               <td style="font-size:25px; padding-left:40px;">${vo.name }</td>
            </tr>   
            <tr>
               <td style="padding-left:40px;">${vo.field }</td>   
            </tr>   
            <tr>
               <td style="padding-left:40px;">${vo.hospitalname }</td>
            </tr>
            <tr>
               <td style="height: 60px;"></td>
               <td></td>
            <tr>
               <td>tel</td>
               <td><input type="text" name="tel" value="${vo.tel }"/></td>
            </tr>
            <tr>
               <td>병원 주소</td>
               <td>
                  <input type="text" id="postcode" name="postcode" value="${vo.postcode }" readonly="readonly" required="">
                  <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" id="btn" class="btn_address"><br>
                  <input type="text" id="address" name="address" value="${vo.address}" required="">
                  <input type="text" id="extraAddress" name="extraaddress" placeholder="참고항목" style="width:138px;"><br>
                  <input type="text" id="detailAddress" name="detailaddress" value="${vo.detailaddress}" required="">
               </td>
            </tr>   
            <tr>
               <td style="height: 60px;"></td>
            </tr>
            <tr>
               <td></td>
               <td style="float:right; padding-right:10px;"><input id="btn" class="btn_update" type="submit" value="변경"/></td>
            </tr>   
         </table>
         </form>
   </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>