<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="UTF-8" %>
<html>
<head>
   <title>Home</title>
<%@ include file="../include/header1.jsp" %>
<%@ include file="../include/header2.jsp" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> 
<script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script language="JavaScript">

$(document).ready(function(){ 
    var main = $('.bxslider').bxSlider({ 
    mode: 'fade', 
    auto: true,   //자동으로 슬라이드 
    controls : true,   //좌우 화살표   
    autoControls: true,   //stop,play 
    pager:true,   //페이징 
    pause: 3000, 
    autoDelay: 0,   
    slideWidth: 900, 
    speed: 500, 
    stopAutoOnclick:true
}); 
   
$(".bx-stop").click(function(){   // 중지버튼 눌렀을때 
    main.stopAuto(); 
    $(".bx-stop").hide(); 
    $(".bx-start").show(); 
    return false; 
}); 

$(".bx-start").click(function(){   //시작버튼 눌렀을때 
    main.startAuto(); 
    $(".bx-start").hide(); 
    $(".bx-stop").show(); 
    return false; 
}); 

  $(".bx-start").hide();   //onload시 시작버튼 숨김. 
}); 
</script> 
<style>
   img.bximg{display:block; margin:0px auto; height:595px; width:800px;}
   .bx-wrapper {height:600px;}
   .home__slider{width:900px; margin:0px auto;}
   .contents {width: 800px; margin: 0 auto; height: auto; background-color: #e0e0e0; padding: 20px;}
   .contents img {float: right; padding: 30px;}
   #news{
      margin:100px auto;
      width:900px;
      height:500px;
      pointer:cursor !important;
      padding-left:-50px;
   }
   table{
      border-collapse: collapse;
       width: 100%;
   
   }
   th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
      font-size:20px;
   }
   th{
      font-size:25px !important;
   }
   td:hover {background-color:#E1EAF7;}
</style>

</head>
<body>
<div class="home__slider"> 
   <%@include file="../include/banner.jsp" %>
    <div class="bxslider"> 
        <div>
           <a href="">
              <img src="${pageContext.request.contextPath}/resources/images/의료진여러분_감사합니다.png" alt="그림1" class="bximg">
           </a>
        </div>
        <div>
           <a href="">
              <img src="${pageContext.request.contextPath}/resources/images/코로나_손씻기.jpg" alt="그림2" class="bximg">
           </a>
        </div> 
        <div>
           <a href="">
              <img src="${pageContext.request.contextPath}/resources/images/코로나19_예방수칙.jpg" alt="그림3" class="bximg">
           </a>
        </div>
    </div> 
</div> 
<div id="news">
   <table>
      <tr>
         <th>건강뉴스</th>
      </tr>
      <tr>
         <td onclick="location.href='https://news.joins.com/article/23914472'">세계최초 승인된 러시아 코로나 백신 "일반인 접종 2주내 시작"</td>
      </tr>
      <tr>   
         <td onclick="location.href='https://jhealthmedia.joins.com/article/article_view.asp?pno=22650'">[약 이야기] 고혈압 환자, 먹는 약 개수·용량 줄었다고 안심해선 안됩니다</td>
      </tr>
      <tr>   
         <td onclick="location.href='http://health.chosun.com/site/data/html_dir/2020/11/05/2020110500818.html'">만성콩팥병 환자, 근력 감소 막기 위해 꼭 필요한 영양소는?</td>
      </tr>
      <tr>   
         <td onclick="location.href='http://health.chosun.com/site/data/html_dir/2020/11/04/2020110402121.html'">손발저림 있는 당뇨병 환자라면 '합병증' 의심하세요</td>
      </tr>
      <tr>   
         <td onclick="location.href='http://kormedi.com/1325880/%ed%9d%94%ed%95%9c-%ec%9c%84%ec%97%bc-%ec%9c%84%ec%95%94-%ec%a0%84-%eb%8b%a8%ea%b3%84%ec%9d%b8%eb%8d%b0-%ed%8c%8c-%ec%96%91%ed%8c%8c-%eb%a7%88%eb%8a%98-%eb%93%9c%ec%84%b8%ec%9a%94/'">흔한 위염? 위암 전 단계인데.. “파, 양파, 마늘 드세요”</td>
      </tr>
      <tr>   
         <td onclick="location.href='http://health.chosun.com/site/data/html_dir/2020/11/03/2020110300872.html'">대장암 두렵다면? '6가지' 수칙 꼭 지켜야</td>
      </tr>
      <tr>   
         <td onclick="location.href='http://www.youngnong.co.kr/news/articleView.html?idxno=32319'">불규칙적인 식습관, 역류성식도염 유발 가능성 높아</td>
      </tr>
   </table>
</div>
</body>
<%@ include file="../include/footer.jsp" %>
</html>