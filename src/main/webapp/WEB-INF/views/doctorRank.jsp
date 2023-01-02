<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<style>
	.allbox{
		width:55%;
		margin:auto;
		padding:150px 0;
	}
	
	.doctorbox{
		padding: 20px 0;
	    width: 100%;
	    height: 260px;
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
</head>
<body>

<% int pageNum = (Integer)session.getAttribute("page"); %>
<div class="allbox">
	<h1>의사 랭킹</h1>
	<c:forEach var="item" items="${rank }">
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
					<tr>
						<td style="width:60px;">주소</td>
						<td style="color:#555; font-weight: 300;">${item.address }</td>
					</tr>
					<tr>
						<td style="width:60px;">전화번호</td>
						<td style="color:#555; font-weight: 300;">${item.tel }</td>
					</tr>
					<tr>
						<td style="width:60px;">별점</td>
						<td style="color:#555; font-weight: 300;">
						<c:set var="starpoint" value="${item.starpoint}"/>
						<c:if test="${starpoint eq 0}">
						<c:out value="-"/>
						</c:if>
						<c:if test="${starpoint ne 0}"> 
						<c:out value="${item.starpoint}(${item.starpointcount })"/>
						</c:if></td>
					</tr>		
				</table>
				 
			</div>
		</div>
	</c:forEach>
	
</div>
 <div class="buttonbox" style="font-size:20px; text-align:center;">
         <ul style="width:fit-content; margin: 0 auto;">
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
                        <li><a href="doctorRankPage?page=<%=startPage - 10%>">[이전]</a></li>   
               <%         
            }
               for(int i=startPage; i <= endPage; i++){ 
               if(i == currentpage){ 
            %>
                  <li style="color:#444; background-color: #DAE3F3;"><%=i %></li>
            <%                           
               }else{ 
            %>
                  <li><a href="doctorRankPage?page=<%=i%>"><%=i %></a></li>
            <%   
               }
            } 
            
            if(endPage < maxPageNum){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
            %>
               <li><a href="doctorRankPage?page=<%=startPage + 10 %>">[다음]</a></li>
            <%         
            }
            %>
          </ul>
         </div>
	
<%@ include file="../include/footer.jsp" %>	
</body>
</html>