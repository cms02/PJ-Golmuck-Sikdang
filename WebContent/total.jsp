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
<%@ page import="com.biz.MyBiz"%>
<%@ page import="java.util.List"%>

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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	function changeDisplay() {

		var radioValue1 = $("input[name='chk1']:checked").val(); //연령선택
		var radioValue2 = $("input[name='chk2']:checked").val(); //성별선택

		console.log(radioValue1);
		console.log(radioValue2);

		if (radioValue1 == "ageall" && radioValue2 == "mf") {//나이무관성별무관
			$(".platform1").show();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();

		} else if (radioValue1 == "ageall" && radioValue2 == "mm") {//나이무관성별남자
			$(".platform1").hide();
			$(".platform2").show();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();
		} else if (radioValue1 == "ageall" && radioValue2 == "ff") {//나이무관성별여자
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").show();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();
		} else if (radioValue1 == "age10" && radioValue2 == "mf") {//10대성별무관
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").show();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();

		} else if (radioValue1 == "age10" && radioValue2 == "mm") {//10대남자
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").show();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();
		} else if (radioValue1 == "age10" && radioValue2 == "ff") {//10대여자
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").show();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();
		} else if (radioValue1 == "age20" && radioValue2 == "mf") {//20대성별무관
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").show();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();

		} else if (radioValue1 == "age20" && radioValue2 == "mm") {//20대남자
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").show();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();
		} else if (radioValue1 == "age20" && radioValue2 == "ff") {//20대여자
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").show();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();
		} else if (radioValue1 == "age30" && radioValue2 == "mf") {//30대성별무관
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").show();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();

		} else if (radioValue1 == "age30" && radioValue2 == "mm") {//30대남자
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").show();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();
		} else if (radioValue1 == "age30" && radioValue2 == "ff") {//30대여자
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").show();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").hide();
		} else if (radioValue1 == "age40" && radioValue2 == "mf") {//40대이상성별무관
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").show();
			$(".platform14").hide();
			$(".platform15").hide();

		} else if (radioValue1 == "age40" && radioValue2 == "mm") {//40대이상남자
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").show();
			$(".platform15").hide();
		} else if (radioValue1 == "age40" && radioValue2 == "ff") {//40대이상여자
			$(".platform1").hide();
			$(".platform2").hide();
			$(".platform3").hide();
			$(".platform4").hide();
			$(".platform5").hide();
			$(".platform6").hide();
			$(".platform7").hide();
			$(".platform8").hide();
			$(".platform9").hide();
			$(".platform10").hide();
			$(".platform11").hide();
			$(".platform12").hide();
			$(".platform13").hide();
			$(".platform14").hide();
			$(".platform15").show();
		}
	}
</script>

<style type="text/css">
/* 이미지 사이즈 조절 */
#rankimage {
	overflow: hidden;
	width: 112px;
	height: 130px;
}

/* 재료 생략문자(...) 삽입 */
.most_popular_item_area .p_recype_item_main .media .media-body p {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 270px;
	height: 50px;
}

.checks {
	position: relative;
	margin-top: 5px;
}
/* 라디오 버튼 이미지 */
.checks input[type="radio"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.checks input[type="radio"]+label {
	display: inline-block;
	position: relative;
	padding-left: 30px;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.checks input[type="radio"]+label:before {
	content: '';
	position: absolute;
	left: 0;
	top: -4px;
	width: 21px;
	height: 21px;
	text-align: center;
	background: #b10400;
	border: 1px solid #cacece;
	border-radius: 100%;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
		rgba(0, 0, 0, 0.05);
}

.checks input[type="radio"]+label:active:before, .checks input[type="radio"]:checked+label:active:before
	{
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.checks input[type="radio"]:checked+label:before {
	background: #E9ECEE;
	border-color: #adb8c0;
}

.checks input[type="radio"]:checked+label:after {
	content: '';
	position: absolute;
	top: 1px;
	left: 5px;
	width: 13px;
	height: 13px;
	background: #99a1a7;
	border-radius: 100%;
	box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.3);
}

#findButton {
	font-size: 25px;
}

label {
	margin-left: 20px;
	margin-bottom: 10px;
	font-size: 20px;
}

.checks {
	margin-bottom: 15px;
}

/* 음식이름 글씨체*/
.most_popular_item_area .p_recype_item_main .media .media-body h3 {
	font-family: "Open Sans", sans-serif;
	font-weight: bold;
}
/* 나라이름글씨체*/
.most_popular_item_area .p_recype_item_main .media .media-body .read_mor_btn
	{
	font-family: "Open Sans", sans-serif;
}
</style>
</head>
<body>

	<%
		MyBiz biz = new MyBiz();
	List<PopularityDto> list1 = biz.selectRankAllAll();
	List<PopularityDto> list2 = biz.selectRankAllM();
	List<PopularityDto> list3 = biz.selectRankAllF();
	List<PopularityDto> list4 = biz.selectRank10All();
	List<PopularityDto> list5 = biz.selectRank10M();
	List<PopularityDto> list6 = biz.selectRank10F();
	List<PopularityDto> list7 = biz.selectRank20All();
	List<PopularityDto> list8 = biz.selectRank20M();
	List<PopularityDto> list9 = biz.selectRank20F();
	List<PopularityDto> list10 = biz.selectRank30All();
	List<PopularityDto> list11 = biz.selectRank30M();
	List<PopularityDto> list12 = biz.selectRank30F();
	List<PopularityDto> list13 = biz.selectRank40All();
	List<PopularityDto> list14 = biz.selectRank40F();
	List<PopularityDto> list15 = biz.selectRank40M();
	%>

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
				<h4>FOOD RANKING</h4>
				<a class="active f" href="golmuck.do?cd=main">Home</a>
			</div>
		</div>
	</section>
	<!--================End Banner Area =================-->
	<!--================End Our feature Area =================-->
	<section class="most_popular_item_area">
		<div class="container">
			<div class="s_white_title">
				<h3>Ranking By Category</h3>
			</div>
			<div class="popular_filter">

				<ul id="chk1">
					<div class="checks">
						<input type="radio" name="chk1" id="ageall" value="ageall" checked>
						<label for="ageall">All Age</label> <input type="radio"
							name="chk1" id="age10" value="age10"> <label for="age10">10'S</label>
						<input type="radio" name="chk1" id="age20" value="age20">
						<label for="age20">20'S</label> <input type="radio" name="chk1"
							id="age30" value="age30"> <label for="age30">30'S</label>
						<input type="radio" name="chk1" id="age40" value="age40">
						<label for="age40">40'S</label>
					</div>
				</ul>
				<ul id="chk2">

					<div class="checks">
						<input type="radio" name="chk2" id="mf" value="mf" checked>
						<label for="mf">All Gender</label> <input type="radio" name="chk2"
							id="mm" value="mm"> <label for="mm">M</label> <input
							type="radio" name="chk2" id="ff" value="ff"> <label
							for="ff">F</label>
					</div>
					<div class="wrap">
						<a href="#" class="button" onclick="changeDisplay()"
							id="findButton">Find!</a>
					</div>
				</ul>
			</div>

			<div class="p_recype_item_main">
				<div class="row p_recype_item_active">
					<div class="platform1">
						<%
							for (PopularityDto dto : list1) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a><%=dto.getCount()%><i class="fa fa-heart"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>

					<div class="platform2" style="display: none">

						<%
							for (PopularityDto dto : list2) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>

					<div class="platform3" style="display: none">
						<%
							for (PopularityDto dto : list3) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform4" style="display: none">
						<%
							for (PopularityDto dto : list4) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform5" style="display: none">
						<%
							for (PopularityDto dto : list5) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform6" style="display: none">
						<%
							for (PopularityDto dto : list6) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform7" style="display: none">
						<%
							for (PopularityDto dto : list7) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform8" style="display: none">
						<%
							for (PopularityDto dto : list8) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform9" style="display: none">
						<%
							for (PopularityDto dto : list9) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform10" style="display: none">
						<%
							for (PopularityDto dto : list10) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform11" style="display: none">
						<%
							for (PopularityDto dto : list11) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform12" style="display: none">
						<%
							for (PopularityDto dto : list12) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform13" style="display: none">
						<%
							for (PopularityDto dto : list13) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform14" style="display: none">
						<%
							for (PopularityDto dto : list14) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="platform15" style="display: none">
						<%
							for (PopularityDto dto : list15) {
						%>
						<div class="col-md-6 break snacks">
							<div class="media">
								<div class="media-left">
									<div class="box">
										<img src="<%=dto.getImgdir()%>" alt="no image" id="rankimage">
									</div>
								</div>
								<div class="media-body">
									<a href="cook.do?cd=detail&fno=<%=dto.getFno()%>"><h3><%=dto.getFname()%></h3></a>
									<h4><%=dto.getRank()%>위!
									</h4>
									<p></p>
									<a class="read_mor_btn"
										href="nation.do?cd=nation&fno=<%=dto.getFno()%>"><%=dto.getNation()%></a>
									<ul>
										<li><a> <%=dto.getCount()%><i class="fa fa-heart"></i></a></li>

									</ul>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>




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