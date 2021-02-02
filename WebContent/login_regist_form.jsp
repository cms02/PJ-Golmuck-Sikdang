<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
   request.setCharacterEncoding("UTF-8"); 
   response.setContentType("text/html; charset=UTF-8"); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Join Us</title>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="229091335959-bioeblq1u31vm3rfu9j1cpo39m27tqpg.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<link rel="stylesheet" href="login_style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
		var idval = false;
		var pwval = false;
		var nameval = false;
		var phoneval = false;
		var ageval = false;
	
		//input-field 클래스들을 각각 함수를 실행하겠다.
		$(".input-field").each(function(){
			
				//로그인 창의 input-field는 제외하겠다.
				if( !($(this).get(0) == $(".input-field").eq(0).get(0) || $(this).get(0) == $(".input-field").eq(1).get(0) )  ){
					
					//id창의 input-field의 포커스를 잃으면 실행하겠다.
					$("#uid").blur(function(){
						var mid = $("#uid").val().trim();
						
						//id 입력창이 비어있지않다면 실행하겠다.
						if( !((mid == "" && typeof mid == "String") || mid.length == 0) ){
							var idreg = /^[a-zA-Z0-9]{6,10}$/;
							
							// id가 정규식을 통과한다면 실행하겠다.
							if(idreg.test(mid)){
									$.ajax({
										url:"golmuck.do?cd=idchk", 
										data : {id : mid},
										dataType : "json",
										success : function(msg){
													if(msg.idnotused){
														$("#pid").html("");
														$("#pid").css("color","blue");
														$("#pid").html("사용가능한 id입니다.");
														idval = true;
													}else{
														$("#pid").html("");
														$("#pid").css("color","red");
														$("#pid").html("중복된 id가 존재합니다. 다시 입력해주세요");
														
														$("#uid").html("");
														$("#uid").focus();
													}
										},
										error : function(){
										}
									});
							}else{
								$("#pid").html("");
								$("#pid").css("color","red");
								$("#pid").html("id가 형식에 맞지 않습니다. 다시 입력해주세요");
								
								$("#uid").html("");
								$("#uid").focus();
							}
						}
					});
					
					// pw 입력창이 focus를 잃으면 실행하겠다.
					$("#upw").blur(function(){
						var mpw = $("#upw").val().trim();
						if( !((mpw == "" && typeof mpw == "String") || mpw.length == 0 ) ){
							var pwre = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,13}$/;
							//pw 정규식 실행
							if(pwre.test(mpw)){
								$("#ppw").html("");
								$("#ppw").css("color","blue");
								$("#ppw").html("등록 가능한 비밀번호 형식입니다.");
								pwval = true;
							}else{
								$("#ppw").html("");
								$("#ppw").css("color","red");
								$("#ppw").html("등록 불가능한 비밀번호 형식입니다.");
								$("#upw").focus();
							}
						}
					});
					//이름 입력창 focus 잃으면 실행
					$("#uname").blur(function(){
						var mname = $("#uname").val().trim();
						if( !((mname == "" && typeof mname == "String") || mname.length == 0 ) ){
							//이름 정규식 실행
							var namere = /^[가-힣]{2,}$/;
							if(namere.test(mname)){
								$("#pname").html("");
								$("#pname").css("color","blue");
								$("#pname").html("등록 가능한 이름 형식입니다.");
								nameval = true;
							}else{
								$("#pname").html("");
								$("#pname").css("color","red");
								$("#pname").html("등록 불가능한 이름 형식입니다.");
								$("#uname").focus();
							}
						}
					});
					
					//전화번호 입력창 focus 잃으면 실행
					$("#uphone").blur(function(){
						var mphone = $("#uphone").val().trim();
						if( !((mphone == "" && typeof mphone == "String") || mphone.length == 0 ) ){
							var phonere = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
							//전화번호 정규식 실행
							if(phonere.test(mphone)){
								$("#pphone").html("");
								$("#pphone").css("color","blue");
								$("#pphone").html("등록 가능한 전화번호 형식입니다.");
								phoneval = true;
							}else{
								$("#pphone").html("");
								$("#pphone").css("color","red");
								$("#pphone").html("등록 불가능한 전화번호 형식입니다.");
								$("#uphone").focus();
							}
						}
					});
					
					//나이 입력창 focus 잃으면 실행
					$("#uage").blur(function(){
						var mage = $("#uage").val().trim();
						if( !((mage == "" && typeof mage == "Integer") || mage.length == 0 ) ){
							var agere = /^[0-9]+$/;
							//나이 정규식 실행
							if(agere.test(mage)){
								$("#page").html("");
								$("#page").css("color","blue");
								$("#page").html("등록 가능한 나이 형식입니다.");
								ageval = true;
							}else{
								$("#page").html("");
								$("#page").css("color","red");
								$("#page").html("등록 불가능한 나이 형식입니다.");
								$("#uage").focus();
							}
						}
					});
					
					//위에껀 값이 있을 경우에 실행
				
					//아래는 값이 없는 경우에 실행
					$(this).click(function(){
						
						// id쪽 input을 선택했을 때
						if( $(this).get(0) == $(".input-field").eq(2).get(0) ){
							var mid = $("#uid").val().trim();
							if( (mid == "" && typeof mid == "String") || mid.length == 0 ){
									$("#pid").html("");
									$("#pid").css("color","red");
									$("#pid").html("id를 입력해주세요");
							}
							
						//pw쪽 input을 선택했을 때
						}else if( $(this).get(0) == $(".input-field").eq(3).get(0) ){
							var mpw = $("#upw").val().trim();
							if( (mpw == "" && typeof mpw == "String") || mpw.length == 0  ){
								$("#ppw").html("");
								$("#ppw").css("color","red");
								$("#ppw").html("비밀번호를 입력하세요");
							}
							
						//name쪽 input을 선택했을 때	
						}else if( $(this).get(0) == $(".input-field").eq(4).get(0) ){
							var mname = $("#uname").val().trim();
							if( (mname == "" && typeof mname == "String") || mname.length == 0 ){
								$("#pname").html("");
								$("#pname").css("color","red");
								$("#pname").html("이름을 입력하세요.");
							}
							
						//phone쪽 input을 선택했을 때	
						}else if( $(this).get(0) == $(".input-field").eq(5).get(0) ){
							var mphone = $("#uphone").val().trim();
							if( (mphone == "" && typeof mphone == "String") || mphone.length == 0 ){
								$("#pphone").html("");
								$("#pphone").css("color","red");
								$("#pphone").html("전화번호를 입력하세요.");
							}
							
						//age쪽 input을 선택했을 때	
						}else if( $(this).get(0) == $(".input-field").eq(6).get(0) ){
							var mage = $("#uage").val().trim();
							if( (mage == "" && typeof mage == "Integer") || mage.length == 0 ){
								$("#page").html("");
								$("#page").css("color","red");
								$("#page").html("나이를 입력하세요.");
							}
						}
						
					});
				}
		});	
		
		//모두 다 입력했을 때만 통과
		$(".submit").eq(1).click(function(){
			if(idval&&pwval&&nameval&&phoneval&&ageval){
				return true;
			}
			return false;
		});
		
});
</script>
<style type="text/css">
p {
	color: red;
	font-style: bold;
	font-size: 8px;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="form-wrap" id="size">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" id="log" onclick="login();">LOGIN</button>
				<button type="button" class="togglebtn" id="reg" onclick="register();">REGISTER</button>
			</div>
			<form id="login" action="golmuck.do" class="input-group" method="post">
				<input type="hidden" name="cd" value="login"> 
				<input type="text" name="lid" id ='iid' class="input-field" placeholder="User id" required>
				<input type="password" name="lpw" class="input-field" placeholder="User Password" required> 
				<br><br>
				<button class="submit">Login</button>
				<br><br>
				<br>&nbsp;&nbsp;&nbsp;&nbsp;
		         <a id="login-form-btn" href="javascript:loginFormWithKakao()">
			           <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
		         </a>
				<script type="text/javascript">
				  // 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용됩니다.
				  // 초기화한 앱에 현재 도메인이 등록되지 않은 경우 에러가 발생합니다.
				  Kakao.init('46af2b83f0b0d49cc01f795dedb0bab7');
				  
				  function loginFormWithKakao(){
					  Kakao.Auth.loginForm({
					    success: function(authObj) {
							      Kakao.API.request({
									        url: '/v2/user/me',
									        success: function(res) {
									        		  var id = res.id;
									        		  var name = res.properties["nickname"];
									        		  var email = res.kakao_account["email"];
									        		  var gender = res.kakao_account["gender"];
									        		  var age = res.kakao_account["age_range"];
									        		  if(email == undefined){
									        			email = id;  
									        		  }
									        		  if(gender == undefined){
									        			  gender = "male";
									        		  }
									        		  if(age == undefined){
									        			  age = 20;
									        		  }
									        		  location.href='golmuck.do?cd=kakaologin&id='+id+'&name='+name+'&gender='+gender+'&age='+age+'&email='+email;
									        },
									        fail: function(error) {
											          alert(
											            'login success, but failed to request user information: ' +
											              JSON.stringify(error)
											          )
									        },
							      })
					    },
					    fail: function(err) {
					     		 alert('failed to login: ' + JSON.stringify(err))
					    },
					  })
				  }
				</script>
				<!-- <div class="g-signin2" id='gid' data-onsuccess="onSignIn"></div>
				
			    <script>
			      function onSignIn(googleUser) {
			        // Useful data for your client-side scripts:
			        var profile = googleUser.getBasicProfile();
			        var mno = profile.getId();
			        var mname = profile.getName();
			        var mid = profile.getEmail();
			
			    /*     // The ID token you need to pass to your backend:
			        var id_token = googleUser.getAuthResponse().id_token;
			        console.log("ID Token: " + id_token); */
			        
			        $("#gid").click(function(){
			    		  location.href = 'golmuck.do?cd=googlelogin&mno='+mno+'&mname='+mname+'&mid='+mid;
			    	  });
			        
			      }
			      onSignIn.init();
			    </script> -->
			    
				 <!-- naver login -->
     <!--    		 <div style="padding:5px; text-align: center;">
         네이버아이디로로그인 버튼 노출 영역
              <div id="naverIdLogin"></div>
         </div>
   Scroll Up
    <div id="back-top" >
        <a title="Go to Top" href="#"><i class="fas fa-level-up-alt"></i></a>
    </div>

   naver JS
  <script type="text/javascript">
   var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "fDt6Xap5gzK6pVa8mGwN",
         callbackUrl: "http://localhost:9090/SEMI_1/navercallback.jsp",
         isPopup: false, /* 팝업을 통한 연동처리 여부 */
         loginButton: {color: "green", type: 3, height: 48} /* 로그인 버튼의 타입을 지정 */
      }
   );
   
   /* 설정정보를 초기화하고 연동을 준비 */
   naverLogin.init();
   
   </script>
 -->
			</form>
			<form id="register" action="golmuck.do" class="input-group" method="post" >
				<input type="hidden" name="cd" value="register"> 
				<input type="text" id="uid" name="id" class="input-field" title="n" placeholder="아이디(영문자,숫자 포함 6-10자리)" required>
				<p id="pid"></p>
				<input type="password" id="upw" name="pw" class="input-field" placeholder="비밀번호(특수문자,영문자,숫자 포함 8-13자리)" required> 
				<p id="ppw"></p>
				<input type="text" id="uname" name="name" class="input-field" placeholder="이름(한글만)" required> 
				<p id="pname"></p>
				<input type="text" id="uphone" name="phone" class="input-field" placeholder="휴대폰번호(010-1234-5678)" required> 
				<p id="pphone"></p>
				<input type="number" id="uage" name="age" class="input-field" placeholder="나이(숫자만)" required>
				<p id="page"></p>
				<br><br> 
				<input type="radio" name="chk" checked="checked" value="M">Male&nbsp;&nbsp;
				<input type="radio" name="chk" value="F">Female 
				<input type="text" name="residence1" id="residence1" onclick="execDaumPostcode();" class="input-field" placeholder="지역 주소" required>
				<br><br>
				<input type="text" name="residence2" id="residence2" class="input-field" placeholder="세부 주소" required>
				<br><br>
				<button class="submit" onclick="return totchk();">회원가입</button>
			</form>
		</div>
	</div>

	
<script>
	document.getElementById("uid").value == "";
	document.getElementById("upw").value == "";
	document.getElementById("uname").value == "";
	document.getElementById("uphone").value == "";
	document.getElementById("uage").value == "";
	document.getElementById("residence1").value == "";
	document.getElementById("residence2").value == "";
	var x = document.getElementById("login");
	var y = document.getElementById("register");
	var z = document.getElementById("btn");
	var size = document.getElementById("size");
            
    function login(){
    	
        x.style.left = "50px";
        y.style.left = "450px";
        z.style.left = "0";
        size.style.height = "600px";
        size.style.transition=".5s";
    }

    function register(){
        x.style.left = "-400px";
        y.style.left = "50px";
        z.style.left = "110px";
        size.style.height = "750px";
        size.style.transition=".5s";
       
    }
    
    //주소 입력창에 주소검색창을 띄우겠다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                $("#residence1").val(data.address);
                $("#residence2").focus();
            }
        }).open();
    }
              
</script>	
</body>
</html>
