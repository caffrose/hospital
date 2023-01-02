<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
$(function() {
	$(".gotoField").click(function() {
		field = $(this).parent().find("#field").val();
		selectField(field);
	});
});
var field = $("#field option:selected").val();
function selectField(field) {
	
	var gsWin = window.open('about:blank','viewer','width=1000, height=1000');
	var frm = document.selectField;
	frm.action = 'doctorlistByField?field='+field;
	frm.target = 'viewer';
	frm.submit();
}
</script>
<style>
   footer{
      height: 130px;
      text-align: center;
      font-size:20px;
      padding-top:40px;
      border:1px solid #f7fafd;
      
   }
#footer {
    width: 100%;
    margin: 0 auto;
  	background-color: #c3c3c3;
    padding-bottom: 60px;
    font-weight: 400;
    letter-spacing: -.2px;
}
#footer .inner_footer1 {
    overflow: hidden;
    padding-bottom: 20px;
}
#footer .footer_cc1 {
    float: left;
    width: 534px;
}
#footer .footer_cc2 {
	float:left;
	padding-top:50px;
}
#footer .footer_cc2 select#field {
	width:150px;
	height:30px;
}
#footer .footer_cc2 select#field option{
	height:30px;
}
#footer .footer_cc2 button.gotoField {
	width:70px;
	height:30px;
	background-color:#2F62A7;
	color:#fff;
	border:none;
	
}
#footer .footer_cc3 {
	float:left;
	padding-top:50px;
	padding-left:50px;
}
#logoF{
	padding-top:40px;
	width:160px;
	
}
#footer .tit_cc {
    padding: 29px 0 2px;
    font-weight: 700;
    font-size: 20px;
    color: #333;
    line-height: 24px;
}
#footer .cc_call {
    padding-top: 0px;
}
#footer .cc_call .tit {
    padding-top: 4px;
    padding-right:5px;
    font-weight: 800;
    font-size: 28px;
    color: #333;
    line-height: 36px;
    letter-spacing: -.5px;
    white-space: nowrap;
}
#footer .footer_cc1 .list {
    font-size: 14px;
    color: #333;
    line-height: 22px;
    letter-spacing: -.2px;
    padding-left:5px;
}
#footer .footer_cc1 .list dt {
    display: block;
    float:right;
    margin-top:-62px;
    margin-right:107px;
    padding-left:5px;
}
#footer .footer_cc1 .list dd {
    color: #999;
    float:right;
    margin-right:72px;
    margin-top:-38px;
    padding-left:5px;
}
#footer .company {
    float: right;
    padding-top: 29px;
    font-size: 12px;
    color: #999;
    line-height: 20px;
    margin-top:-168px;
    margin-right:154px;
    text-align:left;
}
</style>
</head>
<body>
<footer>
<div id="footer">
<div class="in_footer">
	<div class="inner_footer1">
		<div class="footer_cc1">
			<p><img src="${pageContext.request.contextPath}/resources/images/DoctorYGLogoF.png" id="logoF"></p> 
			<div class="cc_view cc_call">
				<h3><span class="tit">5595-9500</span></h3>
				<dl class="list">
					<dt>365고객센터</dt>
					<dd>오전 7시 - 오후 7시</dd>
				 </dl>
			 </div>    
		</div>
		<div class="footer_cc2">
			<ul>
				<li>
				<form name="selectField" action="" method="get" id="selectField">
					<select id="field" name="field">
						<option>진료과</option>
						<option value="가정의학과">가정의학과</option>
						<option value="내과">내과</option>
						<option value="비뇨기과">비뇨기과</option>
						<option value="산부인과">산부인과</option>
						<option value="성형외과">성형외과</option>
						<option value="소아청소년과">소아청소년과</option>
						<option value="신경과">신경과</option>
						<option value="안과">안과</option>
						<option value="응급의학과">응급의학과</option>
						<option value="이비인후과">이비인후과</option>
						<option value="재활의학과">재활의학과</option>
						<option value="정신건강의학과">정신건강의학과</option>
						<option value="정형외과">정형외과</option>
						<option value="치과">치과</option>
						<option value="피부과">피부과</option>
					</select>
					<button type="button" class="gotoField">바로가기</button>
				</form>
				</li>
			</ul>
		</div>
		<div class="footer_cc3">
			<ul>
				<li><a href="${pageContext.request.contextPath}/terms" style="text-decoration:none; color:#4a4a4a; font-size:16px;">이용약관</a></li>
			</ul>
		</div>
	</div>
</div>
	<div class="company">
		법인명 (상호) : 당신의 주치의 Dr.YG
		<span class="bar">I</span>
		사업자등록번호 : 123-45-67890
		<br/>
		통신판매업 : 제 2018-서울신촌-01234 호
		<span class="bar">I</span>
		개인정보보호책임자 : 이영걸
		<br/>
		주소 : 서울특별시 마포구 서강로 136 아이비타워 2F,3F 
		<span class="bar">I</span>
		대표이사 : 이영걸
		<br/>
		채용문의 : javaprogramming2020@gmail.com
		<br/>
		대표번호 : 010-5595-9500
	</div>
</div>
</footer>
</body>
</html>