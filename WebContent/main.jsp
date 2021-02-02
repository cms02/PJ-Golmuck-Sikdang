<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.dao.PopularityDao"%>
<%@ page import="com.dto.PopularityDto"%>
<%@ page import="com.dto.FoodDto" %>
<%@ page import="com.biz.MyBiz"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/express-favicon.png" type="image/x-icon" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>G.M. Res.</title>

<!-- Icon css link -->
<link href="vendors/material-icon/css/materialdesignicons.min.css"
   rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="vendors/linears-icon/style.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Rev slider css -->
<link href="vendors/revolution/css/settings.css" rel="stylesheet">
<link href="vendors/revolution/css/layers.css" rel="stylesheet">
<link href="vendors/revolution/css/navigation.css" rel="stylesheet">

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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
var preimg;
window.onload = function() {
	preimg = "img/background.jpg";
   var divs = document.getElementsByClassName('media-left');
   for (var i = 0; i < divs.length; ++i) {
      var div = divs[i];
      var divAspect = div.offsetHeight / div.offsetWidth;
      div.style.overflow = 'hidden';

      var img = div.querySelector('img');
      var imgAspect = img.height / img.width;

      if (imgAspect <= divAspect) {
         // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
         var imgWidthActual = div.offsetHeight / imgAspect;
         var imgWidthToBe = div.offsetHeight / divAspect;
         var marginLeft = -Math
               .round((imgWidthActual - imgWidthToBe) / 2)
         img.style.cssText = 'width: auto; height: 100%; margin-left: '
               + marginLeft + 'px;'
      } else {
         // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
         img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
      }
   }
};
</script>

<style type="text/css">
/* 이미지 사이즈 조절 */


#mainrankimage{
   overflow: hidden;
   width: 360px;
   height: 270px;
}
</style>
</head>
<body>
   <div id="preloader">
      <div class="loader absolute-center">
         <div class="loader__box">
            <b class="top"></b>
         </div>
         <div class="loader__box">
            <b class="top"></b>
         </div>
         <div class="loader__box">
            <b class="top"></b>
         </div>
      </div>
   </div>

   <%@include file="header.jsp"%>
   <!--================Slider Area =================-->
   <section class="slider_area">
      <div class=slider_inner>
         <div class="rev_slider fullwidthabanner" data-version="5.3.0.2"
            id="home-slider">
            <ul>
               <li data-slotamount="7" data-easein="Power4.easeInOut"
                  data-easeout="Power4.easeInOut" data-masterspeed="600"
                  data-rotate="0" data-saveperformance="off">
                  <!-- MAIN IMAGE --> <img src="img/home-slider/slider-1.jpg" alt=""
                  data-bgposition="center center" data-bgfit="cover"
                  data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg"
                  data-no-retina> <!-- LAYERS --> <!-- LAYER NR. 1 -->
                  <div class="slider_text_box">
                     <div class="tp-caption bg_box" data-width="none"
                        data-height="none" data-whitespace="nowrap" data-x="center"
                        data-y="['350','350','300','250','0']" data-fontsize="['55']"
                        data-lineheight="['60']" data-transform_idle="o:1;"
                        data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:0px;" data-mask_out="x:inherit;y:inherit;"
                        data-start="2000" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on"></div>
                     <div class="tp-caption first_text" data-x="center"
                        data-y="center" data-voffset="['-20']" data-Hoffset="['0']"
                        data-fontsize="['36','36','36','36','20']"
                        data-lineheight="['52','52','52','52','35']" data-width="none"
                        data-height="none" data-transform_idle="o:1;"
                        data-whitespace="nowrap"
                        data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                        data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                        data-start="1000" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on" data-elementdelay="0.05">Welcome
                        To Golmuck Sikdang</div>
                     <div class="tp-caption secand_text" data-x="center"
                        data-y="center" data-voffset="['45']" data-Hoffset="['0']"
                        data-fontsize="['36']" data-lineheight="['42']"
                        data-width="none" data-height="none" data-transform_idle="o:1;"
                        data-whitespace="nowrap"
                        data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                        data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                        data-start="1000" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on" data-elementdelay="0.05">One
                        Click</div>
                     <div class="tp-caption third_text" data-x="center"
                        data-y="center" data-voffset="['100']" data-Hoffset="['0']"
                        data-fontsize="['24','24','24','24','16']"
                        data-lineheight="['34','34','34','34','26']" data-width="none"
                        data-height="none" data-transform_idle="o:1;"
                        data-whitespace="nowrap"
                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                        data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                        data-start="1200" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on" data-elementdelay="0.05">YOU
                        CAN SELECT JUST ONE CLICK</div>
                     <div class="tp-caption btn_text" data-x="center" data-y="center"
                        data-voffset="['180']" data-Hoffset="['0']"
                        data-fontsize="['16.75']" data-lineheight="['26']"
                        data-width="none" data-height="none" data-transform_idle="o:1;"
                        data-whitespace="nowrap"
                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                        data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                        data-start="1200" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on" data-elementdelay="0.05">
                        <a class="submit_btn_bg" onclick="oneClick();">One Click</a>
                     </div>
                  </div>
               </li>
               <li data-slotamount="7" data-easein="Power4.easeInOut"
                  data-easeout="Power4.easeInOut" data-masterspeed="600"
                  data-rotate="0" data-saveperformance="off">
                  <!-- MAIN IMAGE --> <img src="img/home-slider/slider-2.jpg" alt=""
                  data-bgposition="center center" data-bgfit="cover"
                  data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg"
                  data-no-retina> <!-- LAYERS --> <!-- LAYER NR. 1 -->
                  <div class="slider_text_box text_box2">
                     <div class="tp-caption bg_box" data-width="none"
                        data-height="none" data-whitespace="nowrap" data-x="center"
                        data-y="['350','350','300','250']" data-fontsize="['55']"
                        data-lineheight="['60']" data-transform_idle="o:1;"
                        data-transform_in="y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;s:1500;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:0px;" data-mask_out="x:inherit;y:inherit;"
                        data-start="2000" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on"></div>
                     <div class="tp-caption first_text" data-x="center"
                        data-y="center" data-voffset="['-20']" data-Hoffset="['0']"
                        data-fontsize="['36','36','36','36','20']"
                        data-lineheight="['52','52','52','52','35']" data-width="none"
                        data-height="none" data-transform_idle="o:1;"
                        data-whitespace="nowrap"
                        data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                        data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                        data-start="1000" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on" data-elementdelay="0.05">Welcome
                        To Golmuck Sikdang</div>
                     <div class="tp-caption secand_text" data-x="center"
                        data-y="center" data-voffset="['45']" data-Hoffset="['0']"
                        data-fontsize="['36']" data-lineheight="['42']"
                        data-width="none" data-height="none" data-transform_idle="o:1;"
                        data-whitespace="nowrap"
                        data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                        data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                        data-start="1000" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on" data-elementdelay="0.05">One
                        Click</div>
                     <div class="tp-caption third_text" data-x="center"
                        data-y="center" data-voffset="['100']" data-Hoffset="['0']"
                        data-fontsize="['24','24','24','24','16']"
                        data-lineheight="['34','34','34','34','26']" data-width="none"
                        data-height="none" data-transform_idle="o:1;"
                        data-whitespace="nowrap"
                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                        data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                        data-start="1200" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on" data-elementdelay="0.05">YOU
                        CAN SELECT JUST ONE CLICK</div>
                     <div class="tp-caption btn_text" data-x="center" data-y="center"
                        data-voffset="['180']" data-Hoffset="['0']"
                        data-fontsize="['16.75']" data-lineheight="['26']"
                        data-width="none" data-height="none" data-transform_idle="o:1;"
                        data-whitespace="nowrap"
                        data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;"
                        data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                        data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                        data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                        data-start="1200" data-splitin="none" data-splitout="none"
                        data-responsive_offset="on" data-elementdelay="0.05">
                        <a class="submit_btn_bg" onclick="oneClick();">One Click</a>
                     </div>
                  </div>
               </li>
            </ul>
         </div>
         <!-- END REVOLUTION SLIDER -->
      </div>
   </section>
   <!--================End Slider Area =================-->



   <!--================Our feature Area =================-->
   <script type="text/javascript">
   function popularity(select,num) {
		<%
			if ((session.getAttribute("rdto") == null || !request.isRequestedSessionIdValid())
			&& (session.getAttribute("sdto") == null || !request.isRequestedSessionIdValid())) {
			%>
			      alert("회원에게만 허용된 기능입니다.");
			<%
			} else {
			%>
			      var classId = $(select).attr("class");
			      
			      if(classId=='fa fa-heart-o') {
			         // 좋아요
			        $(select).attr('class','fa fa-heart');
			         
			         $.ajax({
			            url: "nation.do?cd=heart_true&fno="+num,
			         });
			         
			      }else if(classId=='fa fa-heart') {
			         // 좋아요 취소
	        		 $(select).attr('class','fa fa-heart-o');
			         
	        		 $.ajax({
			            url: "nation.do?cd=heart_false&fno="+num,
	      			 });
			      }
			<%}%>
	}
   </script>
   <section class="our_feature_area">
      <div class="container">
         <div class="s_black_title">
            <h3>Popular Food</h3>
            <h2>Ranking</h2>
         </div>
         <div class="feature_slider">
         <c:forEach var="list1" items="${list1 }">
            <div class="item">
               <div class="feature_item">
                  <div class="feature_item_inner">
                  <div class="box">
                     <img src="${list1.imgdir }" alt="" id="mainrankimage">
                  </div>
                     <div class="icon_hover">
                     <i class="fa fa-search" onclick="mapView('${fn:trim(list1.fname)}');"></i>
                     	<c:set var="cnt" value="0" />
                     		<c:forEach var="myList" items="${myList }">
								<c:if test="${list1.fno eq myList.fno }">
									<c:set var="cnt" value="${cnt+1}" />
								</c:if>
							</c:forEach>
							<c:if test="${cnt>0}">
								<i class="fa fa-heart" onclick="popularity(this,${list1.fno});"></i>
							</c:if>
							<c:if test="${cnt<=0}">
								<i class="fa fa-heart-o" onclick="popularity(this,${list1.fno});"></i>
							</c:if>
                        <script type="text/javascript">
                        </script>
                     </div>
                  </div>
                  <div class="title_text">
                     <div class="feature_left">
                        <a><span>${fn:trim(list1.fname)}</span></a>
                     </div>
                     <div class="restaurant_feature_dots"></div>
                     <div class="feature_right">${list1.rank}위!</div>
                  </div>
               </div>
            </div>
			</c:forEach>
         </div>
      </div>
   </section>
   <!--================End Our feature Area =================-->


   <%@include file="footer.jsp"%>


   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="js/jquery-2.1.4.min.js"></script>
   
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="js/bootstrap.min.js"></script>
   <!-- Rev slider js -->
   <script src="vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
   <script src="vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
   <script
      src="vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
   <script
      src="vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
   <script
      src="vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
   <script
      src="vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
   <script
      src="vendors/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
   <!-- Extra plugin js -->
   <script src="vendors/bootstrap-selector/bootstrap-select.js"></script>
   <script
      src="vendors/bootatrap-date-time/bootstrap-datetimepicker.min.js"></script>
   <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
   <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
   <script src="vendors/isotope/isotope.pkgd.min.js"></script>
   <script src="vendors/countdown/jquery.countdown.js"></script>
   <script src="vendors/js-calender/zabuto_calendar.min.js"></script>
   <!--gmaps Js-->
   <!--        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>-->
   <!--        <script src="js/gmaps.min.js"></script>-->


   <!--        <script src="js/video_player.js"></script>-->
   <script src="js/theme.js"></script>
</body>
</html>