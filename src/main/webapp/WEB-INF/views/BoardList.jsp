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
   .container2{
         margin-top:120px;
         margin-bottom:120px;
   }
   
   table{
         margin:auto;
         width:800px;
   }
   
   table th{
         text-align:center;
         padding-top:11px;
         padding-bottom:9px;
         border-top:1px solid #4579bf;
         border-bottom:1px solid #4579bf;
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
      float:right;
      margin-top:5px;
      font-weight:bold;
      margin-bottom:-20px;
   }
   .admin, .admin_title{
      background-color:#DAE3F3;
      padding-top:7px;
      padding-bottom:7px;
      border-bottom: 1px solid #eaeaea;
   }
   
   .admin_title, .doctor_title{
      padding-left:25px;
   }   
   
   .listbox td:not(.admin):not(.admin_title){
      border-bottom: 1px solid #eaeaea;
      padding-top:9px;
         padding-bottom:9px;
   }
   
   .listbox a{
      text-decoration:none;
      color:#555;
   }
   
   .totalbox{
      margin:auto;   
      width:800px;
   }
   
   .buttonbox ul{
       list-style:none;
       text-align:center;
   }
   
   .buttonbox li{
      float: left;
       border: 1px solid #ccc;
       padding: 1.5px 7px;
       margin: 3px;
       border-radius: 4px;
      color:#767676;
      font-size:14px;
   }
   
   .buttonbox li a{
      color:#767676;
      font-size:14px;
   }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container2">
<% int pageNum = (Integer)session.getAttribute("page"); 
   String id = (String)session.getAttribute("id");
   String who = (String)session.getAttribute("who");
%>
   <div class="totalbox">
   <h2 style="font-size: 30px; font-weight:400; padding-bottom:50px;">소식/공지</h2>
   <table class="listbox">
         <thead>
            <tr>
               <th style="width:8%;">번호</th>
               <th style="width:60%;">제목</th>
               <th>날짜</th>
               <th>작성자</th>
            </tr>
         </thead>
         <tbody>
      <c:forEach var="list" items="${list}">
         <c:set var="writedate"  value="${list.writedate }" />
            <tr>
               <c:choose>
                  <c:when test="${list.writer eq 'admin'}"> 
                     <td style="text-align:center;" class="admin">공지</td>
                     <td class="admin_title"><a href="${pageContext.request.contextPath}/BoardDetailAction?bno=${list.bno}&page=<%=pageNum%>">${list.title}</a></td>
                     <td style="text-align:center;" class="admin">${fn:substring(writedate,0,11) }</td>
                     <td style="text-align:center;" class="admin">관리자</td> 
                  </c:when>
                  <c:otherwise>
                     <td style="text-align:center;">${list.bno}</td>
                     <td class="doctor_title"><a href="${pageContext.request.contextPath}/BoardDetailAction?bno=${list.bno}&page=<%=pageNum%>">${list.title}</a></td>
                     <td style="text-align:center;">${fn:substring(writedate,0,11) }</td>
                     <td style="text-align:center;">${list.writer}</td>
                  </c:otherwise>
               </c:choose>
            </tr>
      </c:forEach>
         </tbody>
   </table>
      <div style="padding-top: 20px;" class="buttonbox">
         <div style="width: 540px; padding-left: 260px; font-size:20px; text-align:center; float:left;">
         <ul>
            <% int maxPageNum = (Integer)session.getAttribute("maxPageNum");
                 int currentpage = (Integer)session.getAttribute("page");
                 int pageSize=10;
                 int startPage= ((currentpage-1)/pageSize)*pageSize+1;
                 int endPage = startPage + pageSize - 1;

               if(endPage > maxPageNum){
               endPage = maxPageNum;
            }
               
               if(startPage > pageSize){ 
               %>
                        <li><a href="BoardListPaging?page=<%=startPage - 10%>">[이전]</a></li>   
               <%         
            }
               for(int i=startPage; i <= endPage; i++){ 
               if(i == currentpage){ 
            %>
                  <li style="color:#444; background-color: #DAE3F3;"><%=i %></li>
            <%                           
               }else{ 
            %>
                  <li><a href="BoardListPaging?page=<%=i%>"><%=i %></a></li>
            <%   
               }
            } 
            
            if(endPage < maxPageNum){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
            %>
               <li><a href="BoardListPaging?page=<%=startPage + 10 %>">[다음]</a></li>
            <%         
            }
            %>
          </ul>
         </div>
         <div class="writebtnbox">
   <%   
      if(null!=id) {
         if((("doctor").equals(who))||id.equals("admin")){%>
         <input type="button" onclick="location.href='BoardWrite'" value="글쓰기" id="btn"/>
            <%}%>
      <%} %>
            </div>
      </div>
   </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>