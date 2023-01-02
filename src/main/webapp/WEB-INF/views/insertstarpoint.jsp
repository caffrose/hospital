<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별점</title>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('resources/images/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
<script src="resources/js/jquery-1.11.3.min.js"></script>

<script>
<%	String doctor_id = (String)request.getAttribute("doctor_id");
	String startDate = (String)request.getAttribute("startDate");%>
	function insert(){
		var starpoint = $("#starpoint").val().substring(0,1);
		
		//var starpoint=document.getElementById(starpoint);
		//alert(starpoint);
		location.href="./insertstarpoint2?doctor_id=${doctor_id}&startDate=${startDate}&starpoint="+starpoint;
	}
	//alert("!");
</script>
<style>
	#btn_star{
		background-color: #fff;
	    font-size:14px;
	    border: 1px solid #2F62A7;
	    color: #2F62A7;
	    width: 100px;
	    height: 30px;
	    margin-bottom: 5px;
	}
</style>

</head>

<body>
<span class="star-input">
	<span class="input">
    	<input type="radio" name="star-input" value="1" id="p1">
    	<label for="p1">1</label>
    	<input type="radio" name="star-input" value="2" id="p2">
    	<label for="p2">2</label>
    	<input type="radio" name="star-input" value="3" id="p3">
    	<label for="p3">3</label>
    	<input type="radio" name="star-input" value="4" id="p4">
    	<label for="p4">4</label>
    	<input type="radio" name="star-input" value="5" id="p5">
    	<label for="p5">5</label>
  	</span>
  	
  	
  		<output for="star-input" id="starpoint"><b>0</b>점</output>
  	&nbsp;&nbsp;
  	<button onclick="insert()" id="btn_star">별점이여</button>
</span>
<script src="resources/js/star.js"></script>

</body>
</html>