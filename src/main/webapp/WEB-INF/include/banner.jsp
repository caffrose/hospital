<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yg.vo.DoctorMemberVo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script language="JavaScript">
$(window).scroll(function() { 
	$('#banner').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 500});
});
</script>
<style>
	#banner { position: absolute; font-size: 13pt; top: 5px; left: 150%; z-index: 10; background:#f1f1f1; padding:5px; border:1px solid #CCCCCC; text-align:center;}
	#banner > span {margin-bottom: 10px; display: block;}
	.banner_contents {min-height: 200px; background-color: #c0c0c0; padding: 5px;}

</style>
</head>
<body>
<%ArrayList<DoctorMemberVo> list = (ArrayList<DoctorMemberVo>)session.getAttribute("list");
	
%>
	<div style="position:relative;float:right;width:90px;top:-15px;right:-115px;"> 
		<div id="banner">
			<span>의사랭킹</span>
			<div id="" class="banner_contents">
				<%for(DoctorMemberVo vo : list){%>
					<div>
					<img src="resources/images/<%=vo.getDoctorimg() %>"width="130">
					이름: <%=vo.getName()%><br/>	 
					별점: <%=vo.getStarpoint() %>
					총수: <%=vo.getStarpointcount() %><br/>
					</div>
				<%} %>				
					
			</div>
		</div> 
	</div>
</body>
</html>