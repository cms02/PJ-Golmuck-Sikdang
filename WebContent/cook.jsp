<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script type="text/javascript">

   window.onload = function() {
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


</script>
<style type="text/css">
.box {
   overflow: hidden;
   width: 112px;
   height: 130px;
}

.most_popular_item_area .p_recype_item_main .media .media-body .read_mor_btn
   {
   width: 85px;
   color: #800000;
}

.most_popular_item_area .p_recype_item_main .media .media-body ul li i {
   color: #ff0000;
   font-size: 20px;
}

.page .container .page_number {
   background-size: cover;
   padding: 100px 0px;
   position: relative;
   z-index: 2;
}

/* 재료 생략문자(...) 삽입 */
.most_popular_item_area .p_recype_item_main .media .media-body p {
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 270px;
   height: 50px;
}

/* 상단 카테고리 필터 */
.most_popular_item_area .popular_filter li a {
   font-family: "Open Sans", sans-serif;
   font-size: 13px;
}

/* 음식이름 */
.most_popular_item_area .p_recype_item_main .media .media-body h3 {
   font-family: "Open Sans", sans-serif;
   font-weight: bold;
}

/* 주변음식점, 레시피보기버튼 */
.read_mor_btn {
   font-family: "Open Sans", sans-serif;
}

</style>

<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

////////////////////////////// 좋아요기능 //////////////////////////////
function popularity(num) {
<%if ((session.getAttribute("rdto") == null || !request.isRequestedSessionIdValid())
      && (session.getAttribute("sdto") == null || !request.isRequestedSessionIdValid())) {%>
      alert("회원에게만 허용된 기능입니다.");
<%} else {%>
      var abb = num+1;
      var classId = $("i").eq(num).attr("class");
      
      if(classId=='fa fa-heart-o') {
         // 좋아요
         $("i").eq(num).attr('class','fa fa-heart');
         
         $.ajax({
            url: "nation.do?cd=heart_true&fno="+num
         });
      }
      
      if(classId=='fa fa-heart') {
         // 좋아요 취소
         $("i").eq(num).attr('class','fa fa-heart-o');
      
         $.ajax({
            url: "nation.do?cd=heart_false&fno="+num
         });
      }
<%}%>
}
////////////////////////////// 좋아요기능 //////////////////////////////

</script>

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

   <!--================Banner Area =================-->
   <section class="banner_area">
      <div class="container">
         <div class="banner_content">
            <h4>Menu List</h4>
            <a href="golmuck.do?cd=main">Home</a> <a class="active"
               href="golmuck.do?cd=nation">NationalCategory</a>
         </div>
      </div>
   </section>
   <!--================End Banner Area =================-->

   <!--================End Our feature Area =================-->
   <section class="most_popular_item_area menu_list_page">
      <div class="container">
         <div class="popular_filter">
            <ul>
               <li class="active" data-filter="*"><a href="">all</a></li>
               <li data-filter=".C1"><a href="">밥</a></li>
               <li data-filter=".C2"><a href="">면</a></li>
               <li data-filter=".C3"><a href="">국물</a></li>
               <li data-filter=".C4"><a href="">찜/조림</a></li>
               <li data-filter=".C5"><a href="">구이</a></li>
               <li data-filter=".C6"><a href="">볶음</a></li>
               <br>
               <br>
               <li data-filter=".C7"><a href="">튀김</a></li>
               <li data-filter=".C8"><a href="">나물/샐러드</a></li>
               <li data-filter=".C9"><a href="">김장/절임</a></li>
               <li data-filter=".C10"><a href="">베이킹/디저트</a></li>
               <li data-filter=".C11"><a href="">음료</a></li>
            </ul>
         </div>
         <div class="p_recype_item_main">
            <div class="row p_recype_item_active">

               <!-- ////////////// 페이지 번호 - 페이징 기능 추가하려고 준비중  ///////////////////////-->


               <!--  추가 할 기능  
 페이징 기능- 각 조리법별 나라별 추가 번호 추가, 필터 적용 
 상세 페이지
 CSS적용 --됬다!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

               <!-- ///////////////게시글 [레시피] ///////////////////////-->

               <c:forEach var="dto" items="${list}">
                  <div class="col-md-6 + ${fn:trim(dto.cookingid)} +">
                     <div class="media">
                        <div class="media-left">
                           <div class="box">
                              <img id="imgdir"src="${fn:trim(dto.imgdir)}" alt="">
                           </div>
                        </div>
                        <div class="media-body">
                           <a href="#"><h3>${fn:trim(dto.fname)}</h3></a>
                           <p>${dto.ingredients }</p>

                           &nbsp; <a href="javascript:void(0)" class="read_mor_btn"
                              onclick="window.open('golmuck.do?cd=mapSearch&keyword=${fn:trim(dto.fname)}',
                              '_blank','width=700,height=650,resizable=no,toolbar=no,statusbar=no,menubar=no,location=no');">
                              음식점보기</a> &nbsp; <a href="javascript:void(0)" class="read_mor_btn"
                              onclick="location.href='cook.do?cd=detail&fno=${fn:trim(dto.fno)}'">레시피보기</a>
                           <ul>
                           <ul>
                              <li><c:set var="cnt" value="0" /> <c:forEach
                                    var="popList" items="${popList }">
                                    <c:if test="${dto.fno eq popList.fno }">
                                       <c:set var="cnt" value="${cnt+1}" />
                                    </c:if>
                                 </c:forEach> <c:if test="${cnt>0}">
                                    <i class="fa fa-heart" onclick="popularity(${dto.fno});"></i>
                                 </c:if> <c:if test="${cnt<=0}">
                                    <i class="fa fa-heart-o" onclick="popularity(${dto.fno});"></i>
                                 </c:if></li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </c:forEach>

            </div>
         </div>
      </div>
   </section>

   <!--================End Our feature Area =================-->

   <%@include file="footer.jsp"%>



   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="js/jquery-2.1.4.min.js"></script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="js/bootstrap.min.js"></script>

   <!-- Extra plugin js -->
   <script src="vendors/bootstrap-selector/bootstrap-select.js"></script>
   <script
      src="vendors/bootatrap-date-time/bootstrap-datetimepicker.min.js"></script>
   <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
   <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
   <script src="vendors/isotope/isotope.pkgd.min.js"></script>
   <script src="vendors/countdown/jquery.countdown.js"></script>
   <script src="vendors/js-calender/zabuto_calendar.min.js"></script>

   <script src="js/theme.js"></script>
</body>
</html>