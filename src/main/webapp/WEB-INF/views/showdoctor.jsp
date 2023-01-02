<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.yg.vo.DoctorMemberVo" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
<%ArrayList<DoctorMemberVo> list = (ArrayList<DoctorMemberVo>)(request.getAttribute("list"));
   if(list.isEmpty()){%>
   alert("예약 불가.");
   location.href="./selecttable";
<%}%>
$(function() {
   $(".reserveBtn").click(function() {
      type = $(this).parent().find("#type").val();
      doctor_id = $(this).attr("doctor_id");
      field = $(this).attr("field");
      booking(doctor_id, field, type);
   });
      
});

var type = $("#type option:selected").val();

function booking(doctor_id, field, type){
//   alert(type+"!!!!!");
   ajax_insert(doctor_id, field, type);
}
function ajax_insert(doctor_id, field, type){
     var data1={
            start: '${start}',
            end: '${end}',
            dno: doctor_id,
            department: field,
            type : type
           }
      $.ajax({
         url:'http://192.168.6.88:8080/project3/rest/insert',
         type:'post',
         data:JSON.stringify(data1),
         dataType: 'json',
         contentType: 'application/json',
         success: function(response){
         
     
            location.href="./mypage";
         },
         error: function(){
            alert("에러!");
      
         }
      });
   } 
</script>
<style>
   .allbox{
      width:55%;
      margin:auto;
      padding:120px 0;
   }
   
   .doctorbox{
      padding: 20px 0;
       width: 100%;
       height: 226px;
       border-top: 1px solid #5D5D5D;
       border-bottom: 1px solid #5D5D5D;
   }
   
   .doctorimg{
      float:left;
      width:180px;
      margin-right:40px;
   }
   
   .doctorinfo{
      width:73%;
      float:left;
      padding-bottom:30px;
   }
   
   .doctorinfo p{
      font-size:25px;
   }
   
   table{
      width:100%;
      border-top: 1px solid #ccc;
       border-bottom: 1px solid #ccc;
   }
   
   table td{
      padding-top:5px;
      padding-bottom:5px;
   }
   
   .chatbox{
      float:right;
      padding-right:20px;
   }
   
   .reserveBtn{
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
      margin-left: 10px;
   }
   
</style>
</head>
<body>
<div class="allbox">
   <div>
      <h2 style="text-align:center; margin-bottom: 70px;">의료진 선택</h3>
      <p style="text-align:right; font-weight: 300; font-size: 14px;">* 의료진은 평점순으로 나열되어있습니다</p>
   </div>
   <c:forEach var="item" items="${list }">
      <div class="doctorbox">
         <div class="doctorimg">
            <img src="resources/images/${item.doctorimg}">
         </div>
         <div class="doctorinfo">
            <p>${item.name}</p>
            <table>
               <tr>
                  <td style="padding-right:10px; width:60px;">진료과</td>
                  <td style="color:#555; font-weight: 300;">${item.field}</td>
               </tr>
               <tr>
                  <td style="width:60px;">병원</td>
                  <td style="color:#555; font-weight: 300;">${item.hospitalname }</td>
               </tr>      
            </table>
             
         </div>
         <div class="chatbox">
         <select name="type" id="type">
            <option>상담방법 선택</option>
            <option value="chat">일반채팅</option>
            <option value="video">화상채팅</option>
         </select>
         <button class="reserveBtn" doctor_id="${item.doctor_id}" field="${item.field}" >예약하기</button><br/>
         </div>
      </div>
   </c:forEach>
</div>   
<%@ include file="../include/footer.jsp" %>   
</body>
</html>