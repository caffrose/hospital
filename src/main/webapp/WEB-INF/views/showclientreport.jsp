<%@page import="com.yg.vo.calendarVo"%>
<%@page import="com.yg.vo.DoctorMemberVo"%>
<%@page import="com.yg.service.DoctorMemberService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
<title>소비자 예약 현황</title>
<script>
/* var doctor_id = $("#doctor_id").val();
var startDate = $("#startDate").val(); */
	function starcheck() {
		/* doctor_id = $(this).parent().find("#star").val();
		alert(doctor_id +" & "+ startDate); */
		var gsWin = window.open('about:blank', 'viewer', 'width=500, height=500');
		var frm = document.star;	
		frm.action = 'insertstarpoint';
		frm.target = 'viewer';
		frm.submit();
	}
</script>
<style>
	#divMain{
		min-height:600px;
		text-align:center;
		vertical-align:middle;
	}
	table#totalTable{
		max-width:50% important!;
		margin:50px auto;
	}
	td{
		min-width:200px;
		height:30px;
		padding:15px 10px 15px 30px;
	}
	#btn_star{
		background-color: #2F62A7;
	    font-size:14px;
	    border: none;
	    color: #fff;
	    width: 100px;
	    height: 30px;
	    margin-bottom: 5px;
	}
</style>
</head>
<body>
	<div id="divMain">
		<%@ include file="../include/banner.jsp" %>
		<table id="totalTable">
		<tr>
			<th><h3>진료 미완료</h3></th>
			<th><h3>진료 완료</h3></th>
		</tr>
		<tr>
			<td>
			<%	List<calendarVo> list2= (List<calendarVo>)request.getAttribute("notfinish");
				for(calendarVo item : list2){
					DoctorMemberService service = (DoctorMemberService)request.getAttribute("service"); 
					DoctorMemberVo vo = service.getDoctorName(item.getDoctorNum());%>
					<table>
						<tr>
							<th>담당의사</th>
							<td><%=vo.getName()%></td>
						</tr>
						<tr>
							<th>상담시작시간</th>
							<td><%=item.getStartDate()%></td>
						</tr>
						<tr>
							<th>상담종료시간</th>
							<td><%=item.getEndDate()%></td>
						</tr>
					</table>
				<%} %>
			</td>
			<td>
			<%	List<calendarVo> list1= (List<calendarVo>)request.getAttribute("finish");
				for(calendarVo item : list1){
					DoctorMemberService service = (DoctorMemberService)request.getAttribute("service"); 
					DoctorMemberVo vo = service.getDoctorName(item.getDoctorNum());%>
					<table style="border-left:1px solid #2f62a7; padding-left:40px;">
						<tr>
							<th>담당의사</th>
							<td><%=vo.getName()%></td>
						</tr>
						<tr>
							<th>상담시작시간</th>
							<td><%=item.getStartDate()%></td>
						</tr>
						<tr>
							<th>상담종료시간</th>
							<td><%=item.getEndDate()%></td>
						</tr>
					</table>
					<%	if(item.getStarpoint()==0) {%>
					
						<form name="star" action="" method="get" id="star">
							<input type="hidden" name="doctor_id" id="doctor_id" value="<%=item.getDoctorNum() %>"/>
							<input type="hidden" name="startDate" id="startDate" value="<%=item.getStartDate()%>"/>
							<input type="button" value="별점" onclick="starcheck()" id="btn_star"/>
						</form>
						<%-- <a href="./insertstarpoint?doctor_id=<%=item.getDoctorNum() %>+&startDate=<%=item.getStartDate()%>"><button>별점ㄱㄱ</button></a></br> --%>
						<%} %>
							
					<%	} %>	
			</td>
		</tr>
		</table>
		</div>
		<%-- <c:forEach var="item" items="${notfinish }">
			${item.doctorNum}/ ${item.startDate} / ${item.endDate} /
		</c:forEach> --%>
	</div>
</body>
<%@ include file="../include/footer.jsp" %>
</html>