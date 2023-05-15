<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	width: 247px !important;
	height: 100%;
	min-height: 650px;
	background: #353942;
	align-items: center;
}

/* .body_section { */
/* 	height: 800px; */
/* } */

.menu_container {
width: 247px !important;
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
	margin-bottom: 10%;
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
	<!-- body  -->
	<section class="body_section">
		<div class="body_box">
			<!-- sidebar  -->
			<div class="body_sidebar_box">

				<div class="menu_container">
					<div style="font-size: x-large; font-weight: 550; color: white; text-align: center; margin: 10%;">
						<a href="/member/mypage">마이페이지</a>
					</div>
					<div class="side_menu">
						<div id="icon1" class="side_icon"></div>
						<div>
							<a href="/member/updateMember">회원정보 수정</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon2" class="side_icon"></div>
						<div>
							<a href="/member/wishList">위시리스트</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon3" class="side_icon"></div>
						<div>
							<a href="/member/classList">내가신청한클래스</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon4" class="side_icon"></div>
						<div>
							<a href="/member/payList">결제내역</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon5" class="side_icon"></div>
						<div>
							<a href="/member/msgList">메시지</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon6" class="side_icon"></div>
						<div>
							<a href="/member/subscribe">구독</a>
						</div>
					</div>
					
					<c:set var="isKakao" value="${sessionScope.id.toString().replaceAll('[0-9]','') }" />
					<c:if test="${sessionScope.id != null }">
						<c:if test="${isKakao != '' && sessionScope.id.toString().length()<20}">
							<div class="side_menu">
								<div id="icon7" class="side_icon"></div>
								<div>
									<a href="/member/deleteMember">회원탈퇴</a>
								</div>
							</div>
						</c:if>
					</c:if>




				</div>
			</div>
			<!-- sidebar  -->
		