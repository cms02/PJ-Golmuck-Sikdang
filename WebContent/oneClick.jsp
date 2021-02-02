<%@page import="com.biz.MyBiz"%>
<%@page import="com.dto.FoodDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
MyBiz biz = new MyBiz();
List<FoodDto> list = biz.selectAll();
String[] imgdir = new String[list.size()];
int[] fno = new int[list.size()];
for (int i = 0; i < list.size()-1; i++) {
	imgdir[i] = list.get(i).getImgdir();
	fno[i]=list.get(i).getFno();
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>One Click</title>
<link href = "https://fonts.googleapis.com/css2? family = Great + Vibes & display = swap"rel = "stylesheet">

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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
var imgdir = new Array();
<%for (int i = 0; i < imgdir.length-1; i++) {%>
imgdir[<%=i%>] = "<%=imgdir[i]%>";
<%}%>
	$(function() {
		setInterval(function() {
			var div = $("#menu");
			// active 클래스를 가진 요소를 div의 맨 뒤에 추가,0.5초마다
			$(".active").first().appendTo(div);
		}, 50);
		$("button").click(function() {
			$("img").toggleClass("active");
			if ($("button").text() == "Start") {
				$("button").text("stop");
			} else {
				$("button").text("Start");
				var fno = imgdir.indexOf($("img:eq(2)").attr("src"))+1;
				//번호 순서가 반대라 수정 필요 
				alert(fno)
				location.href="golmuck.do?cd=oneclick&fno="+fno;
				}
			}
		);
	});
	

	
</script>

<style type="text/css">
img {
	width: 150px;
	height: 150px;
	float: left;
}

#menubox {
	position: relative;
	width: 750px;
	height: 150px;
	overflow: hidden;
	height: 150px;
}

#menu {
	overflow: auto;
}

.sel {
	width: 150px;
	height: 150px;
	border: 4px solid #64fbe4;
	position: absolute;
	left: 300px;
}

.back{
background-color : #800000;
heght: 1000px;
color : white;
}

.bt{
padding : 20px;
}
.read_mor_btn{
background-color : black;
color: white;
	width: 135px;
	height: 50px;
	margin-left: 292px;
	

}

p{
font-family: "Great Vibes",sans-serif;
font-size: 60pt;
}


</style>

</head>
<body>
<div class="back">
	<br><br><br>
	<div clsss="h" style="margin-left:190px;"><p>Golmuck Choie</p></div>
		<br><br><br>
	<div id="menubox">
		<div class="sel"></div>
		<div id="menu">
			<%
				for (int i = 0; i < imgdir.length-1; i++) {
			%>
			<img src="<%=imgdir[i]%>" alt="음식사진">
			<%
				}
			%>
		</div>
	</div>
	<div class="bt" >
	<button class="read_mor_btn" style="font-size: 12pt">Start</button>
	</div>
</div>
	
</body>
</html>

