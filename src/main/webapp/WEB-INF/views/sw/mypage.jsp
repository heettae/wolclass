<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header  -->
<%@ include file="../include/header.jsp"%>
<!-- header  -->

<style type="text/css">
section {
	display: block;
	border: 1px #ddd solid;
	width: 100%;
	height: auto;
}

a, button:hover {
	cursor: pointer;
}
/* body css   */
.body_box {
	height: 100%;
	display: flex;
}

.body_sidebar_box {
	width: 13%;
	height: 99%;
	background: #353942;
	align-items: center;
}

.body_section {
	height: 800px;
}

.menu_container {
	height: 90%;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
}

.side_menu {
	display: flex;
	align-items: center;
	height: 60px;
	padding-left: 15%;
}

.side_menu a {
	color: white;
	margin-left: 20px;
}

.side_menu:hover {
	transition: background 1s;
	background: #FDC600;
}

.side_menu:hover a {
	color: #353942;
	transition: color 1s;
}

#icon1 {
	background-image: url('../../../resources/img/member10.png');
}

#icon2 {
	background-image: url('../../../resources/img/wishlist10.png');
}

#icon3 {
	background-image: url('../../../resources/img/class10.png');
}

#icon4 {
	background-image: url('../../../resources/img/payment10.png');
}

#icon5 {
	background-image: url('../../../resources/img/inquiry10.png');
}

#icon6 {
	background-image: url('../../../resources/img/subs10.png');
}

#icon7 {
	background-image: url('../../../resources/img/Withdrawal10.png');
}

.side_menu:hover #icon1 {
	background-image: url("../../../resources/img/member11.png");
	transition: background-image 1s;
}

.side_menu:hover #icon2 {
	background-image: url("../../../resources/img/wishlist11.png");
	transition: background-image 1s;
}

.side_menu:hover #icon3 {
	background-image: url("../../../resources/img/class11.png");
	transition: background-image 1s;
}

.side_menu:hover #icon4 {
	background-image: url("../../../resources/img/payment11.png");
	transition: background-image 1s;
}

.side_menu:hover #icon5 {
	background-image: url("../../../resources/img/inquiry11.png");
	transition: background-image 1s;
}

.side_menu:hover #icon6 {
	background-image: url("../../../resources/img/subs11.png");
	transition: background-image 1s;
}

.side_menu:hover #icon7 {
	background-image: url("../../../resources/img/Withdrawal11.png");
	transition: background-image 1s;
}

.side_icon {
	width: 40px;
	height: 40px;
	align-items: center;
}

.admin_header_button a {
	margin: 5px;
	border-left: 2px #ddd solid;
	border-right: 2px #ddd solid;
}

.sub_menu {
	padding-left: 15%;
}

.sub_menu a {
	color: white;
}

.sub_menu a:hover {
	color: #777;
	transition: color 1s;
}

.class_teacher {
	padding-left: 15%;
	color: white;
	font-weight: 550;
}

.myinfo_spot div{
margin-top: 18px;
}


/* body css   */
</style>
</head>
<body>

	<!-- body  -->
	<section class="body_section">
		<div class="body_box">
			<!-- sidebar  -->
			<div class="body_sidebar_box">

				<div class="menu_container">
					<div
						style="font-size: x-large; font-weight: 550; color: white; text-align: center; margin: 10%;">마이페이지
					</div>
					<div class="side_menu">
						<div id="icon1" class="side_icon"></div>
						<div>
							<a>회원정보 수정</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon2" class="side_icon"></div>
						<div>
							<a>위시리스트</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon3" class="side_icon"></div>
						<div>
							<a>내가신청한클래스</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon4" class="side_icon"></div>
						<div>
							<a>결제내역</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon5" class="side_icon"></div>
						<div>
							<a>메시지</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon6" class="side_icon"></div>
						<div>
							<a>구독</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon7" class="side_icon"></div>
						<div>
							<a>회원탈퇴</a>
						</div>
					</div>

					<hr
						style="border-top: 1px solid #777; width: 80%; margin-left: 10%;">
					<div>
						<div class="class_teacher">
							<div>
								<div id="icon8" class="side_icon"></div>

							</div>
							<div>강사용</div>

						</div>
						<div class="sub_menu">
							-<a> 차트 </a> <br> -<a> 클래스신청정보 </a>

						</div>
					</div>



				</div>
			</div>
			<!-- sidebar  -->
			
			<!-- main content  -->
			<div class="content_box"
				style="width: 87%; display: flex; align-items: center;">
				<div class="mypage_myinfo"
					style="width: 50%; height: 80%; margin: auto; border: 3px black double;">
					<div class="myinfo_img"
						style="border-bottom: 2px solid; height: 70%; display: flex;">
						<div class="myinfo_img_spot"
							style="margin: auto; border: 1px solid; min-width: 40%; min-height: 80%; max-height: 100%;">
							<img src="../../../resources/img/no_img.PNG">
						</div>
					</div>
					<div class="myinfo_container" style="display: flex;height: 30%;">
						<div class="myinfo_spot" style="margin: auto;text-align: center;height: 70%; ">
							<div class="myinfo_text" style="font-size: 50px;">반갑습니다 000님</div>
							<div class="myinfo_point" style="font-size: 30px;">포인트 : 1000P</div>
							<div class="myinfo_button" style="font-size :15px;">
								<button class="navbar-btn nav-button wow fadeInRight animated">프로필사진 변경</button>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- main content  -->
		</div>
	</section>
	<!-- body  -->


	<!-- footer  -->
	<%@ include file="../include/footer.jsp"%>
	<!-- footer  -->