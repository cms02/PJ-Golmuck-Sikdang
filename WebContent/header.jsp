<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import = "com.dto.MemberDto" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G.M. Res.</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script type="text/javascript">
    function login() {
    window.open(
          "login_regist_form.jsp", "_blank", 
          "toolbar=no,location=no,status=no,resizable=no,menubar=no,width=500,height=850,top=50,left=500");
    }
   
   function logOut(){
      location.href='golmuck.do?cd=logout';
   }

   function oneClick(){
       window.open("oneClick.jsp","_blank",
       "toolbar=no,location=no,status=no,resizable=no,menubar=no,width=750,height=409px,top=50,left=500");
   }
   
   function mapView(fname){
      window.open("golmuck.do?cd=mapSearch&keyword="+fname,
            "_blank","width=700,height=650,resizable=no,toolbar=no,statusbar=no,menubar=no,location=no");
      
   }
   
   $(function(){
      var loc = $(location).attr('href');
         console.log(loc);   
      $(".bs-example-navbar-collapse-1 ul li").each(function(){
         $(".bs-example-navbar-collapse-1 ul li").css("color","white");
      });
         
      if(loc.includes("main",0)){
         $(".active > a").css("color","#b10400");
      }else if(loc.includes("total",0)){
         $(".rankT > a").css("color","#b10400");
      }else if(loc.includes("nation",0)){
         $(".dropdown-toggle").css("color","#b10400");
      }else if(loc.includes("cook",0)){
         $(".dropdown-toggle").css("color","#b10400");
      }else if(loc.includes("mypage",0)){
    	  $(".mp").css("color","#b10400");
      }
                                                               
   });
   
   
   
</script>
</head>
<body>
   <!--================Start header Area =================-->
   <header class="main_menu_area">
      <nav class="navbar navbar-default">
         <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed"
                  data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                  aria-expanded="false">
                  <span class="sr-only">Toggle navigation</span> <span
                     class="icon-bar"></span> <span class="icon-bar"></span> <span
                     class="icon-bar"></span>
               </button>
               <a class="navbar-brand" href="golmuck.do?cd=main"><img src="img/logo-2.png"
                  alt=""></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse"
               id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav navbar-right" id="catelist">
                  <li class="active">
                     <a href="golmuck.do?cd=main">Home</a>
                  </li>
                  <li class="rankT">
                     <a href="golmuck.do?cd=total">Ranking</a>
                  </li>
                  <li class="dropdown submenu">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                     aria-haspopup="true" aria-expanded="false">category
                     <i class="fa fa-angle-down" aria-hidden="true"></i>
                     </a>
                     <ul class="dropdown-menu">
                        <li id="nat"><a href="golmuck.do?cd=nation">나라별 음식</a></li>
                        <li id="coc"><a href="golmuck.do?cd=cook">조리별 음식</a></li>
                     </ul>
                  </li>
                  <%
                     if( (session.getAttribute("rdto") == null || !request.isRequestedSessionIdValid() ) ){
                  %>
                        <li id="loginid"><span id="spanid"></span><a href="#" id="aid" onclick="login();">login</a></li>
                  <%
                     }else{
                  %>
                        <li><a href="mypage.do?cd=mypage" class="mp">MyPage</a></li>
                        <li id="loginid">
                           <a href="#" id="aid" onclick="logOut();">${rdto.mname}님, 환영합니다. &nbsp;log Out</a>
                        </li>
                  <%      
                     }
                  %>
               </ul>
            </div>
            <!-- /.navbar-collapse -->
         </div>
         <!-- /.container-fluid -->
      </nav>
   </header>
   <!--================End header Area =================-->

</body>
</html>