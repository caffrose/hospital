<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<script type="text/javascript">
var global_part = '<%=(String)session.getAttribute("part")%>';

function ajax(part) {
   $.ajax({
      url : 'http://192.168.6.88:8080/project3/rest/selectPart?part='+part,
      type : 'get',
      data : JSON.stringify(part),
      contentType : 'application/json;charset=UTF-8',
      success : function(response) {
         list = response;
         var str ="";
         var str2 = "";
         str += '<form action="checked">';
         for(var i=0; i<=list.length-1; i++) {
            str += '<div class="tip">';
            str += '<input type="checkbox" name="symptom" class="checkbox" value="'+ list[i].symptom +'">'+ list[i].symptom;
            str += '<span>'+ list[i].description +'</span>';
            str += '</div>';
            $("#selection").append(str);
         }
         str += '<input type="hidden" name="part" value="'+global_part+'"/>';
         str += '<input type="submit" value="제출하기" id="submit"/>';
         str += '</form>';
         str2 += '<div id="div3">검색 : <input type="text" id="filtering"/></div>'
         $("#list").html("");
         $('#list').append(str);
         $("#div2").html("");
         $('#div2').append(str2);
         
      },
      error : function(xhr, status, error) {
         alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
      }
   });
}
$(function() {
   $("#part").on('change', function() {
      var part = $(this).val();
      global_part = part;
      
      ajax(part);
   });
});
var newValue;
$(function() {   
   $(document).on("keyup", "#filtering", function(e){
      //keyup 이벤트 발생 시 해당 input의 value 가져오기.
      var searchText = $("#filtering").val();
      //실시간 검색이 필요한 table의 모든 행(tr) 숨김 처리
      $("#list > form > .tip").hide();
      //해당 table에서 input에 입력한 데이터가 있는 td Element 찾기.
      var temp = $(".tip:contains('"+ searchText +"')");
      //입력한 데이터가 있는 Elemnet의 부모 Elemnet(td)만 표시.
      $(temp).show();
   });
});
</script>
<style type="text/css">
   div#list { 
      width:70%;
      margin:20px auto;
   }
    div.tip {
       text-decoration: none;
       width:20%;
       float:left;
       margin:5px auto;
   }
   div.tip:hover {
       cursor: help;
       position: relative;
   }
   div.tip span {
       display: none;
   }
   div.tip:hover span {
       border: #c0c0c0 1px dotted;
       padding: 5px 20px 5px 5px;
       display: block;
       z-index: 100;
       background: #f0f0f0 no-repeat 100% 5%;
       left: 0px;
       margin: 10px;
       width: 250px;
       position: absolute;
       top: 10px;
       text-decoration: none
   }
   #filtering{
      margin-top:70px;
      height:30px;
      width:200px;
      border-radius:5px;
      border-color:#2f62a7;   
   }
   #div2{
      text-align:center;
      margin-right:80px;
   }
   #submit{
      width:90px;
      height:35px;
      border-radius:5px;
      background-color:#2f62a7;
      color:white;
      border-color:white;
   }
</style>
</head>
<body style="min-height:800px;">
<div style="min-height:800px;">
<select name="part" id="part">
   <option>부위 선택</option>
   <c:forEach var="list" items="${list}">
      <option value="${list.part}">${list.part}</option>
   </c:forEach>
</select>
<%-- 
<form id = "myboard" class=  "">
<input type  = "hidden" value = "<%= "abcd" %>"> $("#myboard").serialize()
</form>  --%>

<div id="list">

</div>
<div id="div2">

</div>
</div>
</body>
<%@ include file="../include/footer.jsp" %>
</html>