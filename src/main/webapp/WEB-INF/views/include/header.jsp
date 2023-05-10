<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WolClass</title>
<meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico  the root directory -->
<!--         <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"> -->
<!--         <link rel="icon" href="favicon.ico" type="image/x-icon"> -->

		<!-- adminlte -->
<!-- 		<link rel="stylesheet" href="/resources/admibower_components/bootstrap/dist/css/bootstrap.min.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admibower_components/bootstrap-daterangepicker/daterangepicker.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admibower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admibower_components/font-awesome/css/font-awesome.min.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admibower_components/Ionicons/css/ionicons.min.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admibower_components/morris.js/morris.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admibower_components/jvectormap/jquery-jvectormap.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admidist/css/skins/_all-skins.min.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admidist/css/skins/skin-blue.min.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admidist/css/AdminLTE.min.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/admiplugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"> -->
 		<!-- Google Font --> 
<!-- 		<link rel="stylesheet" -->
<!--         href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> -->
		<!-- adminlte -->

        <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/animate.css" media="screen">
        <link rel="stylesheet" href="/resources/assets/fonts/icon-7-stroke/css/helper.css">
        <link rel="stylesheet" href="/resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css">
        <link rel="stylesheet" href="/resources/assets/css/normalize.css">
        <link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="/resources/assets/css/fontello.css">
        <link rel="stylesheet" href="/resources/assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="/resources/assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="/resources/assets/css/price-range.css">
        <link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="/resources/assets/css/owl.theme.css">
        <link rel="stylesheet" href="/resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="/resources/assets/css/jquery.slitslider.css">
        <link rel="stylesheet" href="/resources/assets/css/style.css">
        <link rel="stylesheet" href="/resources/assets/css/responsive.css">
        <noscript>
        <link rel="stylesheet" type="text/css" href="/resources/assets/css/styleNoJS.css" />
        </noscript>
        
        <!-- Font Awesome CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" 
		integrity="sha512-......" 
		crossorigin="anonymous" />
        <!-- Font Awesome CSS -->
	
		<!-- noUiSlider cdn -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.4/nouislider.min.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.4/nouislider.min.js"></script>
		<!-- noUiSlider cdn -->
		
        
        <!-- jQuery cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jQuery cdn -->

      

<!-- 로그인 모달 라이브러리 - 다빈 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 로그인 모달 css 충돌 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 로그인 모달 라이브러리 - 다빈 -->

<!-- slick 라이브러리 추가 - ㅌㅈ -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<!-- slick 라이브러리 추가 - ㅌㅈ -->


<style type="text/css">
/* 알림 버튼 */
.button {
  display: flex;
  justify-content: center;
  align-items: center;
}

#notification-button {
  position: relative;
  background-color: transparent;
  border: none;
  outline: none;
  cursor: pointer;
  font-size: 20px;
  color: #555;
}

.notification-count {
  position: absolute;
  top: -5px;
  right: -10px;
  background-color: red;
  color: white;
  font-size: 10px;
  padding: 2px 5px;
  border-radius: 50%;
}

.notification-container {
  display: flex;
  flex-direction: row-reverse;
}

.notification-container button {
  margin-left: 10px;
}

.notification-popup {
  top: -170px;
  position: absolute;
  left: 70%;
  bottom: -310px;
  border: 1px solid #ccc;
  display: none;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  margin: 0px;
  transform: translate(-80px, 258px);
  width: 100%;
/*   height: 100%; */
  z-index: 1101;
  max-width: 448px;
  background: #FFFFFF;
  box-shadow: 4px 4px 12px rgba(0, 0, 0, 0.25);
  max-height: 524px;
  overflow-y: auto;
  border-radius: 10px;
}
/* 팝업 내부 리스트 스타일 */
.notification-popup ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.notification-popup ul li {
  margin: 0;
  padding: 0;
}

.notification-popup ul li a {
  display: block;
  padding: 8px 16px;
  text-decoration: none;
  color: #333;
}

.notification-popup ul li a:hover {
  background-color: #f2f2f2;
}

#notification-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
  background-color: #f6f6f6;
  border-bottom: 1px solid #ccc;
  font-size: 16px;
  font-weight: bold;
}

#notification-header .notification {
  margin: 0;
}

#notification-header button {
  margin-left: 10px;
  padding: 5px 10px;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 14px;
}

/* 알림 버튼 */

/* 위시리스트 */
.wishlist-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: transparent;
  border: none;
  cursor: pointer;
  outline: none;
  font-size: 24px;
  color: #ccc;
  transition: all 0.3s ease;
}

.wishlist-btn.active i:first-child {
  display: none;
}

.wishlist-btn.active i:last-child {
  display: inline;
  color: #f44336;
}
/* 위시리스트 */

/* 더보기 */
/* 팝업 스타일 */
.more-popup {
  position: absolute;
  top: 80px;
  left: 58%;
  z-index: 1;
  width: 240px;
  padding: 12px;
  margin: 0;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  border: 1px solid #ccc;
  border-top: none;
  opacity: 0;
  transition: opacity 0.2s ease-in-out;
  pointer-events: none;
}


/* 활성화된 팝업 스타일 */
.more-popup.active {
  opacity: 1;
  pointer-events: auto;
}

/* 팝업 내부 리스트 스타일 */
.more-popup ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.more-popup ul li {
  margin: 0;
  padding: 0;
}

.more-popup ul li a {
  display: block;
  padding: 8px 16px;
  text-decoration: none;
  color: #333;
}

.more-popup ul li a:hover {
  background-color: #f2f2f2;
}

#more {
    background-color: transparent;
    color: black;
    border: none;
}
/* 더보기 */

/* 마이페이지 */
#user-popup {
  position: absolute;
  top: 80px;
  left: 79%;
  z-index: 1;
  width: 240px;
  padding: 12px;
  margin: 0;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  border: 1px solid #ccc;
  border-top: none;
  opacity: 0;
  transition: opacity 0.2s ease-in-out;
  pointer-events: none;
}

#user-popup.active {
  opacity: 1;
  pointer-events: auto;
}

#user-popup ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

#user-popup ul li {
  margin: 0;
  padding: 0;
}

#user-popup ul li a {
  display: block;
  padding: 8px 16px;
  text-decoration: none;
  color: #333;
}

#user-popup ul li a:hover {
  background-color: #f2f2f2;
}
#user-popup ul li:hover {
  background-color: #f2f2f2;
}

#user-button {
  background-color: transparent;
  padding: 0px;
  font-size: x-large;
  color: black;
  border: none;
}
/* 마이페이지 */

/* 검색창 select 박스 */
.form-control {
  height: 35px;
  border-radius: 0;
  box-shadow: none;
  border-color: #ddd;
  font-size: 14px;
}

select.form-control {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background: url("data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' width='10' height='6' viewBox='0 0 10 6'><path d='M5 6L0 0h10z'/></svg>") no-repeat right 10px center/8px 8px #fff;
  padding-right: 30px;
}

/* 슬라이더 */
.noUi-connect {
  background-color: #FDC600;
}
/* 슬라이더 */
/* 검색창 select 박스 */
#logoutBtn {
  background-color: transparent;
  border: none;
}

</style>

    </head>
<body>
<input type="hidden" value="${sessionScope.id }" id="id">
<nav class="navbar navbar-default " style="top: 0; left: 0; width: 100%; z-index: 9999; padding-bottom: 10px;">
                <div class="navbar-header" style="margin-left: 100px;">
                    <a href="/tj/main"><img src="/resources/img/logo2.png" alt="wolClass" style="height: 90px;"></a>
                </div>
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse yamm" id="navigation">
 <div class="search-form wow pulse animated" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; border: 0px; box-shadow: 0px 0px 0px; 
  animation-name: pulse; background: none;">
                            <form action="" class=" form-inline">
                                <button class="btn  toggle-btn" type="button"><i class="fa fa-bars"></i></button>

                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Key word" id="search">
                                </div>
                                <button class="btn search-btn" type="button" id="searchBtn"><i class="fa fa-search"></i></button>
								<div class="button navbar-right" style="padding: 0px;">
								<!-- 더보기 버튼 -->
									<button type="button" class="navbar-btn nav-button wow fadeInRight more" id="more" style="margin-left: 30px;">
									  <i class="fa fa-ellipsis-v"></i> 
									</button>
								<!-- 더보기 버튼 -->
								<c:choose>
								  <c:when test="${sessionScope.id.equals('admin') }">
                       			  <button class="navbar-btn nav-button wow bounceInRight class" data-wow-delay="0.4s">관리자</button>
								  </c:when>
								  <c:otherwise>
                       			  <button class="navbar-btn nav-button wow bounceInRight class" data-wow-delay="0.4s" 
								    style=" border: 2px solid #000; background-color: transparent;
								           border-radius: 50px; font-weight: bold; color: #000;" id="addClass">클래스 등록</button>

								  </c:otherwise>
								</c:choose>
                       			  
								<c:if test="${empty sessionScope.id }">
                       			  <button type="button" class="navbar-btn nav-button wow bounceInRight class"  id="login" style="background-color: transparent; font-weight: bold; color: #000">로그인</button>
<!--                       			  <button class="navbar-btn nav-button wow fadeInRight" id="join" data-wow-delay="0.5s">회원가입</button> -->
								</c:if>
								
								<c:if test="${not empty sessionScope.id }">
								<!-- 알림 버튼 -->
                      			 <div style="display: flex; margin-left: 25px;">
								    <div class="notification-container">
								        <button id="notification-button" style="padding-right: 30px; font-size: 25px;">
								            <i class="fa fa-bell"></i>
								            <span style="right: 14px;" class="notification-count"></span>
								        </button>
								    </div>
								    <!-- 알림 버튼 -->
								    <!-- 마이페이지 -->
								    <button id="user-button" type="button" class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.5s">
									  <i class="fas fa-user-circle fa-lg"></i>
									</button>

								</div>
								<!-- 마이페이지 -->

								</c:if>
								
								

                  			    </div>
                  			    
                  			    <!-- 알림 팝업창 -->
                  			     <div id="notification-popup" class="notification-popup">
								  <div id="notification-header" class="notification-header">
								    <h3 class="notification">알림</h3>
								    <button type="button" id="notification-read">전체 읽음</button>
								  </div>
								  <div id="notification-content" class="notification-content">
								    <ul id="notification-list" class="notification-list"></ul>
								  </div>
								</div>
                  			    <!-- 알림 팝업창 -->


                  			    <!-- 더보기 팝업창 --> 
                  			     <div id="more-popup" class="more-popup">
                  			     <ul>
                  			       <li><a href="/sw/community"> 커뮤니티</a></li>
                  			       <li><a href="#"> 공지사항</a></li>
                  			     </ul>
                  			     </div>
                  			    <!-- 더보기 팝업창 -->
                  			    
                  			    <!-- 마이페이지 팝업창 -->
                  			    <div id="user-popup" class="user-popup">
								  <ul>
								    <li><a href="/db/mypage">마이페이지</a></li>
								    <c:set var="isKakao" value="${sessionScope.id.toString().replaceAll('[0-9]','') }" />
									<c:if test="${sessionScope.id != null }">
										<c:if test="${isKakao != '' && sessionScope.id.toString().length()<20}">
											<li><a href="/db/logout">로그아웃</a></li>
										</c:if>
										<c:if test="${isKakao == '' && sessionScope.id.toString().length()<20}">
											<li><button type="button" class="btn btn-default" id="logoutBtn" onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=c6c8f231f2997186bfd65955c7b8f1ab&logout_redirect_uri=http://localhost:8080/db/logout'">
											로그아웃
											</button>
											</li>
										</c:if>
										<c:if test="${sessionScope.id.toString().length()>20 }">
											<li><a href="#" onclick="nLogout()">로그아웃</a> </li>
										</c:if>
								    </c:if>
								    <!-- <li><a href="/db/logout">로그아웃</a></li> -->
								  </ul>
								</div>
                  			    <!-- 마이페이지 팝업창 -->
                  			    
                  			    <!-- Search Toggle -->
                                <div style="display: none;" class="search-toggle" id="search-toggle">

									<div class="search-row">
										<div class="form-group mar" style="width: 35%;">
										  <label for="region">지역</label>
										  <select class="form-control" id="region">
										    <option value="">전체</option>
										    <option value="서울" ${map.addr == '서울' ? 'selected' : ''}>서울</option>
										    <option value="부산" ${map.addr == '부산' ? 'selected' : ''}>부산</option>
										    <option value="인천" ${map.addr == '인천' ? 'selected' : ''}>인천</option>
										    <option value="대구" ${map.addr == '대구' ? 'selected' : ''}>대구</option>
										    <option value="광주" ${map.addr == '광주' ? 'selected' : ''}>광주</option>
										    <option value="대전" ${map.addr == '대전' ? 'selected' : ''}>대전</option>
										    <option value="울산" ${map.addr == '울산' ? 'selected' : ''}>울산</option>
										    <option value="세종" ${map.addr == '세종' ? 'selected' : ''}>세종</option>
										    <option value="경기" ${map.addr == '경기' ? 'selected' : ''}>경기도</option>
										    <option value="경남" ${map.addr == '경남' ? 'selected' : ''}>경상남도</option>
										    <option value="경북" ${map.addr == '경북' ? 'selected' : ''}>경상북도</option>
										    <option value="전남" ${map.addr == '전남' ? 'selected' : ''}>전라남도</option>
										    <option value="전북" ${map.addr == '전북' ? 'selected' : ''}>전라북도</option>
										    <option value="충남" ${map.addr == '충남' ? 'selected' : ''}>충청남도</option>
										    <option value="충북" ${map.addr == '충북' ? 'selected' : ''}>충청북도</option>
										    <option value="강원" ${map.addr == '강원' ? 'selected' : ''}>강원도</option>
										    <option value="제주" ${map.addr == '제주' ? 'selected' : ''}>제주도</option>
										  </select>
										</div>
										
									</div>

									<div class="search-row">
										<div class="form-group mar" style="width: 35%;">
										  <label for="category">카테고리</label>
										  <select class="form-control" id="category">
										    <option value="">전체</option>
												<option value="펫 푸드" ${map.category == '펫 푸드' ? 'selected' : '' }>펫 푸드</option>
												<option value="펫 훈련" ${map.category == '펫 훈련' ? 'selected' : '' }>펫 훈련</option>
												<option value="펫 에티켓" ${map.category == '펫 에티켓' ? 'selected' : '' }>펫 에티켓</option>
												<option value="펫 액세서리" ${map.category == '펫 액세서리' ? 'selected' : '' }>펫 액세서리</option>
												<option value="펫 미용" ${map.category == '펫 미용' ? 'selected' : '' }>펫 미용</option>
											</select>
										</div>
									</div>

                                    <div class="search-row">

                                        <div class="form-group mar-r-20" style="margin-left: 10px; width: 35%;">
										  <label for="price-range">시간</label>
										  <div id="slider-range"></div>
										  <br>
										  <b class="pull-left color" id="start-time">00:00</b> 
										  <b class="pull-right color" id="end-time">24:00</b>
										</div>

                                        <!-- End of  --> 

                                    </div>
                                    <div class="search-row">  
                                      <label for="level">난이도</label> <br>
                                        <div class="form-group" style="width: 35%; min-width: 80px; padding-bottom: 35px;">
                                            <div class="checkbox" id="c_level">
                                                    <input type="checkbox" name="c_level" value="1" 
                                                    ${map.lowlv == '1' ? 'checked' : '' }
                                                    style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">
                                                     입문
                                            </div>

                                            <div class="checkbox" id="c_level">
                                                    <input type="checkbox" value="2" name="c_level" 
                                                    ${map.midlv == '2' ? 'checked' : '' }
                                                    style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">
                                                     초급
                                            </div>

                                            <div class="checkbox" id="c_level">
                                                    <input type="checkbox" value="3" name="c_level" 
                                                    ${map.highlv == '3' ? 'checked' : '' }
                                                    style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">
                                                     고급
                                            </div>
                                        </div>
                                    </div>

<!--                                     <button class="btn search-btn prop-btm-sheaerch" id="reset" type="button" style="display: block; width: max-content;">초기화</button>   -->
                                    <button class="btn search-btn prop-btm-sheaerch" id="search-btn" type="button" style="display: block; width: 100%; text-align: 
                                    center; max-width: 30%; margin: auto;">
                                    검색하기
                                    </button>  
                                    
                                </div>                    
							  <!-- Search Toggle -->
                            </form>
                            <!-- 검색 폼 -->
                            <form role="srch_frm" method="get">
								<input type="hidden" name="timestart" value="${map.timestart }">
								<input type="hidden" name="timeend" value="${map.timeend }">
								<input type="hidden" name="lowlv" value="${map.lowlv }">
								<input type="hidden" name="midlv" value="${map.midlv }">
								<input type="hidden" name="highlv" value="${map.highlv }">
								<input type="hidden" name="category" value="${map.category }">
								<input type="hidden" name="addr" value="${map.addr }">
								<input type="hidden" name="order" value="${map.order }">
								<input type="hidden" name="search" value="${map.search }">
								<input type="hidden" name="pageNum" value="${map.pageNum }">
							</form>
                            <!-- 검색 폼 -->

<!-- 검색 폼 전송 -->                            
<script type="text/javascript">
$(document).ready(function(){
	var addr = null;
	var category = null;
	var level = null;
	var timestar = null;
	var timeend = null;
	
// 	function updateStartEndTimes() {
// 		  var values = slider.noUiSlider.get();
// 		  var start = formatTime(values[0]);
// 		  var end = formatTime(values[1]);
// 		  document.getElementById('start-time').innerHTML = start;
// 		  document.getElementById('end-time').innerHTML = end;
		  
// 		  timestart = $('input[name=timestart]').val(start);
// 		  timeend = $('input[name=timeend]').val(end);
		  
// 		  console.log($('input[name=timestart]').val());
// 		  console.log($('input[name=timeend]').val());
// 		}
	// 시간
 	// 슬라이더 초기값 설정
 	
 	var initStartStr = '${map.timestart}';
 	var initEndStr = '${map.timeend}';
 	var initStart = Number(initStartStr.split(":")[0])*60;
 	var initEnd = Number(initEndStr.split(":")[0])*60;
 	initEnd = initEnd == 0 ? 1440 : initEnd;
 	
	var slider = document.getElementById('slider-range');
	noUiSlider.create(slider, {
	  start: [initStart, initEnd],
	  connect: true,
	  step: 60,
	  range: {
	    'min': 0,
	    'max': 1440
	  }
	});
	
	// 시작시간, 끝시간 출력 함수
	function updateStartEndTimes() {
	  var values = slider.noUiSlider.get();
	  var start = formatTime(values[0]);
	  var end = formatTime(values[1]);
	  document.getElementById('start-time').innerHTML = start;
	  document.getElementById('end-time').innerHTML = end;
	  
	  timestart = $('input[name=timestart]').val(start);
	  timeend = $('input[name=timeend]').val(end);
	  
	  console.log($('input[name=timestart]').val());
	  console.log($('input[name=timeend]').val());
	}
	
	// 슬라이더 이벤트 리스너 등록
	slider.noUiSlider.on('update', updateStartEndTimes);
	
	// 시간 포맷 변환 함수
	function formatTime(minutes) {
	  var hours = Math.floor(minutes / 60);
	  var mins = minutes % 60;
	  hours = hours < 10 ? '0' + hours : hours;
	  mins = mins < 10 ? '0' + mins : mins;
	  var strTime = hours + ':' + mins;
	  return strTime;
	}
	// 시간

	$('#region').on('change', function() {
	    var selectedValue = $(this).val();
	    addr = $('input[name="addr"]').val(selectedValue);
	    console.log($(this).val());
	    console.log($(addr).val());
	  });
	
	$('#category').on('change', function(){
		console.log($(this).val());
		$('input[name="category"]').val($(this).val());
		console.log($('input[name="category"]').val());
	});
	
	$('input[name="c_level"]').on('ifChecked', function(event){
	    if($(this).val() == 1){
	    	level = $('input[name="lowlv"]').val($(this).val());
	    	console.log($(level).val());
	    }else if($(this).val() == 2){
	    	level = $('input[name="midlv"]').val($(this).val());
	    	console.log($(level).val());
	    }else{
	    	level = $('input[name=highlv]').val($(this).val());
	    	console.log($(level).val());
	    }
	});
	
	$('#search').on('input', function() {
	    $('input[name="search"]').val($(this).val());
	});

	
	var formObj = $('form[role="srch_frm"]');
	$('#search-btn').click(function(){
		formObj.attr("action","/class/list");
		formObj.submit();
	});
	
	$('#searchBtn').click(function(){
		formObj.attr("action","/class/list");
		formObj.submit();
	});
	 
});
</script>
<!-- 검색 폼 전송 -->                             
			    	</div>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!-- End of nav bar -->

<script type="text/javascript">
	
	
		function nLogout(){ 
		 	let popup = window.open('https://nid.naver.com/nidlogin.logout?returl=https%3A%2F%2Fwww.naver.com','네이버 로그아웃','width=1,height=1,bottom=0,right=0,location=no'); 
		 	window.addEventListener("beforeunload", function() { 
		 		popup.close(); 
		 	}); 
		 	setTimeout(function(){ 
		 		location.href="/db/logout"; 
		 	},150) 
		 } 
	$(document).ready(function(){
		
		
		$('#addClass').on('click', function() {
		    var id = $('#id').val();
		    console.log(id);
		    if (!id) {
		    	alert('로그인이 필요합니다.');
		        location.href="/db/login";
		    } else{
		    	location.href='/tj/classWorkSpace';
		    }
		    return false;
		  });
		
	});
	

	// 로그인 submit - 다빈
	$("#login").click(function(){
		location.href="/db/login";
	});
	$(document).ready(function(){
     <% if (request.getAttribute("result") != null && (int)request.getAttribute("result") == 0) { %>
     		alert("사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.");
     <% } %>
    });
	
	
	
	$(document).ready(function() {
	    var isOpen = false;
	    var notificationPopup = $("#notification-popup");
	    var notificationCount = $(".notification-count"); // 알림 개수를 표시하는 엘리먼트

	    // 서버에서 알림 개수 조회
	    $.ajax({
	        type: "GET",
	        url: "/tj/alertList",
	        dataType: "json",
	        success: function(data) {
	        	var count = data.length;
	            // 알림 개수를 표시
	            notificationCount.text(count);
	            
	            if (count === 0) {
	                notificationCount.hide();
	            } else {
	                notificationCount.show();
	            }
	        },
	        error: function() {
	            console.error("서버에서 알림 개수 조회 실패");
	        }
	    });

		// 알림목록조회
	    $("#notification-button").click(function(event) {
	        event.preventDefault(); // 버튼 클릭 시 디폴트 액션 중지

	        if (!isOpen) {
	            $.ajax({
	                type: "GET",
	                url: "/tj/alertList",
	                dataType: "json",
	                success: function(alertList) {
	                    var html = "";
	                    $.each(alertList, function(index, alert) {
	                        console.log(alert.cate_no)
	                        if(alert.category == 1){
	                        	html += "<li> <a href='/class/detail?c_no="+alert.cate_no+"' id='alertCheck' data-a-no='" + alert.a_no + "'>" + alert.a_content + "</a></li>";
	                        }
	                        if(alert.category == 2){
	                        	html += "<li> <a href='/sw/mypage' id='alertCheck' data-a-no='" + alert.a_no + "'>" + alert.a_content + "</a></li>";
	                        }
	                        if(alert.category == 3){
	                        	html += "<li> <a href='/tj/main' id='alertCheck' data-a-no='" + alert.a_no + "'>" + alert.a_content + "</a></li>";
	                        }
	                    });
	                    $('#notification-list').html(html);
	                    notificationPopup.show();
	                    isOpen = true;
	                },
	                error: function() {
	                    console.error("서버에서 알림 목록 조회 실패");
	                }
	            });
	        } else {
	            notificationPopup.hide();
	            isOpen = false;
	        }
	    });
		 // 알림목록조회
		 
	    // 다른 곳 클릭 시 알림 팝업 닫기
	    $(document).click(function(event) {
		  if (!$(event.target).closest("#notification-popup").length && !$(event.target).is("#notification-button")) {
		    $("#notification-popup").hide();
		    isOpen = false;
		  }
		});
	   // 다른 곳 클릭 시 알림 팝업 닫기
	   
	   // 알림 읽음 처리
	    $(document).on('click', '#alertCheck', function() {
	        var a_no = $(this).data('a-no');
	        console.log("a_no: " + a_no);
	        var $alertListItem = $(this).closest('li');
	        $.ajax({
	            type: "GET",
	            url: "/tj/alertCheck",
	            data: {a_no: a_no},
	            success: function() {
	                console.log("알림 읽음 처리 완료");
	                $alertListItem.fadeOut(300, function() {
	                    $(this).remove();
	                    updateNotificationCount();
	                });
	            },
	            error: function() {
	                console.error("알림 읽음 처리 실패");
	            }
	        });
	    });
	 // 알림 읽음 처리
	 
	 // 알림 전체 읽음 처리
	 $(document).on('click', '#notification-read', function() {
    $.ajax({
        type: "GET",
        url: "/tj/alertCheckAll",
        success: function() {
            console.log("전체 알림 읽음 처리 완료");
            $(".notification-list").fadeOut(300, function() {
                $(this).empty().removeAttr("style");
            });
            updateNotificationCount();
        },
        error: function() {
            console.error("전체 알림 읽음 처리 실패");
        }
	    });
	});

	 // 알림 전체 읽음 처리
	});
	
	// 알림 개수 갱신 함수
	function updateNotificationCount() {
	    var notificationCount = $(".notification-count");

	    // 서버에서 알림 개수 조회
	    $.ajax({
	        type: "GET",
	        url: "/tj/alertList",
	        dataType: "json",
	        success: function(data) {
	            var count = data.length;
	            // 알림 개수를 표시
	            notificationCount.text(count);
	            
	            if (count === 0) {
	                notificationCount.hide();
	            } else {
	                notificationCount.show();
	            }
	        },
	        error: function() {
	            console.error("서버에서 알림 개수 조회 실패");
	        }
	    });
	}
	// 알림 개수 갱신 함수

	    
	    // 더보기
	   /* 더보기 버튼 클릭 이벤트 */
		const moreButton = document.getElementById('more');
		const morePopup = document.getElementById('more-popup');
		
		moreButton.addEventListener('click', (event) => {
		  event.stopPropagation(); // 이벤트 전파 중지
		console.log('ddddddddddddd');
		  morePopup.classList.toggle('active');
		});
		
		/* 팝업 외부 클릭 이벤트 */
		document.addEventListener('click', (event) => {
		  if (!morePopup.contains(event.target)) {
		    morePopup.classList.remove('active');
		  }
		});
	    // 더보기
	    // 유저
		const userButton = document.getElementById('user-button');
		const userPopup = document.getElementById('user-popup');
		
		userButton.addEventListener('click', (event) => {
		  event.stopPropagation(); // 이벤트 전파 중지
		console.log('user-button 클릭');
		  userPopup.classList.toggle('active');
		});
		
		/* 팝업 외부 클릭 이벤트 */
		document.addEventListener('click', (event) => {
		  if (!userPopup.contains(event.target)) {
		    userPopup.classList.remove('active');
		  }
		});
	    // 유저
	    
	    
	    

</script>

