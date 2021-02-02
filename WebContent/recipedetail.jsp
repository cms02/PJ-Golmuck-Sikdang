<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>
 
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
 
 
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
        <link href="vendors/material-icon/css/materialdesignicons.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="vendors/linears-icon/style.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Extra plugin css -->
        <link href="vendors/bootstrap-selector/bootstrap-select.css" rel="stylesheet">
        <link href="vendors/bootatrap-date-time/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <link href="vendors/owl-carousel/assets/owl.carousel.css" rel="stylesheet">
        
        <link href="css/style.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<style type="text/css">
.most_popular_item_area {
   padding: 20px;
}

.read_mor_btn {
   width: 100px;
   color: #800000;
   font-size: 9pt;
   font-family: "Open Sans", sans-serif;
}

.media {
   text-align: center;
}

td img {
   height: 300px;
   width: auto;
}

tbody {
   align: center;
}

table {
   border-color: pink;
   margin: auto;
}

th {
   font-size: 20pt;
   height: 100px;
   font-family: "Open Sans", sans-serif;
   color: #800000;
   text-align: center;
}

th li {
   list-style:none;
}

td {
   font-family: "Open Sans", sans-serif;
   font-size: 13pt;
   text-align: left;
   padding: 50px;
}
</style>

</head>
<body>
   <%@include file="header.jsp"%>


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
        
        <!--================Banner Area =================-->
        <section class="banner_area">
            <div class="container">
                <div class="banner_content">
                    <h4>Menu List</h4>
                    <a href="#">Home</a>
                    <a class="active" href="menu-list.jsp">Menu</a>
                </div>
            </div>
        </section>
        <!--================End Banner Area =================-->
        
        <!--================End Our feature Area =================-->
   <section class="most_popular_item_area menu_list_page">
      <div class="container">

         <div class="p_recype_item_main">
            <div class="row p_recype_item_active">

               <!-- //////////////  상세 레시피 ///////////////////////-->
               <div class=${dto.cookingid}>
                  <div class="media">
                     <div class="table">
                        <table text-align=center>
                           <!-- ///////////////////  뒤로가기 버튼 ///////////////////   -->
                           <tr>
                              <td colspan="2" style="text-align: left; padding: 10px;">
                                 <a href="javascript:void(0)" class="read_mor_btn"
                                 onclick="history.back();">뒤로가기</a>
                              </td>
                           <tr>
                              <th colspan=2><li>[ ${dto.fname } ]</li></th>
                           <tr>
                              <!--  /////////////////// 이미지 ///////////////////  -->
                              <td align=center><img src=${dto.imgdir }></td>
                              <!--  /////////////////// 재료 ///////////////////  -->
                              <td align=center width=400px>
                                 <c:forEach var="jaeryo" items="${jaeryo}">
                                    <li>${jaeryo}</li>
                                 </c:forEach>
                              </td>
                              <!-- ///////////////////  레시피 /////////////////// -->
                           <tr>
                              <td colspan="2"><br>
                                 <ol style="margin-left: 20px;">
                                    <c:forEach var="recipe" items="${recipe}">
                                       <li>${recipe}</li>
                                    </c:forEach>
                                 </ol><br>
                              </td>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>

   <!--================End Our feature Area =================-->
        

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-2.1.4.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Extra plugin js -->
        <script src="vendors/bootstrap-selector/bootstrap-select.js"></script>
        <script src="vendors/bootatrap-date-time/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
        <script src="vendors/isotope/isotope.pkgd.min.js"></script>
        <script src="vendors/countdown/jquery.countdown.js"></script>
        <script src="vendors/js-calender/zabuto_calendar.min.js"></script>
        
        <script src="js/theme.js"></script>
        
        
        <%@include file="footer.jsp"%>
    </body>
</html>