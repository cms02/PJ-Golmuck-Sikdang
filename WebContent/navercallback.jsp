<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("fDt6Xap5gzK6pVa8mGwN", "http://localhost:9090/SEMI_1/navercallback.jsp");
	// 접근 토큰 값 출력
	alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
	  var id = naver_id_login.getProfileData('id');
	 var name = naver_id_login.getProfileData('name');
	 var email = naver_id_login.getProfileData('email');
	 console.log(id);
	 console.log(name);
	 console.log(email);
	 self.close();
	 opener.location = "http://localhost:9090/SEMI_1/golmuck.do?cd=naverlogin&id="+id+"&name="+name+"&email="+email;
	}

</script>
</head>
<body>

</body>
</html>