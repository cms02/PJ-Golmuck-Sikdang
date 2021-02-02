<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.dto.FoodDto"%>
<%@ page import="com.dto.PopularityDto"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랜덤 음식</title>
<link href = "https://fonts.googleapis.com/css2? family = Great + Vibes & display = swap"rel = "stylesheet">

<!-- Icon css link -->
<link href="vendors/material-icon/css/materialdesignicons.min.css"
	rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="vendors/linears-icon/style.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Extra plugin css -->
<link href="vendors/bootstrap-selector/bootstrap-select.css"
	rel="stylesheet">
<link
	href="vendors/bootatrap-date-time/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="vendors/owl-carousel/assets/owl.carousel.css"
	rel="stylesheet">

<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<style type="text/css">
/* 이미지 사이즈 조절 */
.box {
	overflow: hidden;
	width: 112px;
	height: 130px;
}
.ph{
font-family: "Great Vibes",sans-serif;
font-size: 60pt;
color:white;
}
.ph2{
font-family: "Great Vibes",sans-serif;
font-size: 25pt;
color: #64fbe4;
padding-bottom: 15px;
}
#select {
	margin-top: 15px;
}
/* 재료 생략문자(...) 삽입 */
.media .media-body p {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 270px;
	height: 50px;
}

.media{
background-color:white;
margin-left:80px;
margin-right:80px;

}
.media-body {
	
	padding-left: 15px;
	border-left: 0px;
	padding-right: 15px;
	padding-top: 12px;
	width: 500px;
	height: 130px;
}

.media-body {
}
.col-md-6 {
	padding-left: 15px;
	padding-right: 15px;
}

.media .media-body .read_mor_btn {
	line-height: 30px;
	text-transform: capitalize;
	width: 110px;
	display: inline-block;
}

.media .media-body ul {
	display: inline-block;
	float: right;
	vertical-align: bottom;
}

.media .media-body ul li {
	display: inline-block;
}

.media .media-body ul li i {
	color: #ff0000;
	font-size: 20px;
}
body{
background-color : #800000;
}

.onemore{
text-align:center;


}
#btone{
}

.back{

heght: 1000px;

}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

/* 이미지 사이즈 조절 */
window.onload = function(){
     var divs = document.getElementsByClassName('media-left');
     for (var i = 0; i < divs.length; ++i) {
       var div = divs[i];
       var divAspect = div.offsetHeight / div.offsetWidth;
       div.style.overflow ='hidden';

       var img = div.querySelector('img');
       var imgAspect = img.height / img.width;

       if (imgAspect <= divAspect) {
         // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
         var imgWidthActual = div.offsetHeight / imgAspect;
         var imgWidthToBe = div.offsetHeight / divAspect;
         var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
         img.style.cssText = 'width: auto; height: 100%; margin-left: '
                         + marginLeft + 'px;'
       } else {
         // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
         img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
       }
    }
};

function recipe(){
	  
	
	opener.location.href="cook.do?cd=detail&fno="+${dto.fno};
	
	self.close();
}




</script>
</head>
<body>
<div class="back">
<br><br><br>
	<div class="h" style="margin-left:190px;"><p class="ph">Golmuck Choie</p></div>
		<br>
		<div class="h" style="text-align:center;"><p class="ph2">Today's Your Pick!</p></div>
		
	<div class="col-md-6" id="select">
		<div class="media">
			<div class="media-left">
				<div class="box">
					<img src="${fn:trim(dto.imgdir)}" alt="">
				</div>
			</div>
			<div class="media-body">
				<h3>${fn:trim(dto.fname)}</h3>
				<p>${dto.ingredients }</p>
				&nbsp; <a href="javascript:void(0)" class="read_mor_btn"
					onclick="window.open('golmuck.do?cd=mapSearch&keyword=${fn:trim(dto.fname)}','_blank','width=700,height=650,resizable=no,toolbar=no,statusbar=no,menubar=no,location=no');">음식점보기</a>
				&nbsp; <a href="javascript:void(0)" class="read_mor_btn"
					onclick="recipe()">레시피보기</a>
		
			</div>
		</div>
	</div>
	<br>
	<div class = "onemore">
	<a href="javascript:void(0)" class="read_mor_btn" name="btone"
			style=" background-color :black; color:white; font-size:10pt;"
					onclick="history.back()">one more?</a>
				<ul>
	</div>
	</div>
</body>
</html>