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
  right: 20%;
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
  left: 90%;
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
/* 더보기 */
</style>

    </head>
<body>
<input type="hidden" value="${sessionScope.id }" id="id">
<nav class="navbar navbar-default " style="top: 0; left: 0; width: 100%; z-index: 9999; padding-bottom: 10px;">
                <div class="navbar-header" style="margin-left: 100px;">
<!--                         <span class="">WolClass</span> -->
<!--                     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation"> -->
<!--                         <span class="icon-bar"></span> -->
<!--                         <span class="icon-bar"></span> -->
<!--                         <span class="icon-bar"></span> -->
<!--                     </button> -->
                    <a class="navbar-brand" href="/tj/main"><img src="/resources/img/logo.png" alt="wolClass" style="height: 90px;"></a>
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
                                    <input type="text" class="form-control" placeholder="Key word">
                                </div>
                                <button class="btn search-btn" type="submit"><i class="fa fa-search"></i></button>
								<div class="button navbar-right" style="padding: 0px;">
								<c:choose>
								  <c:when test="${sessionScope.id.equals('admin') }">
                       			  <button class="navbar-btn nav-button wow bounceInRight class" data-wow-delay="0.4s">관리자</button>
								  </c:when>
								  <c:otherwise>
                       			  <button class="navbar-btn nav-button wow bounceInRight class" data-wow-delay="0.4s" 
                       			  style="margin-right: 30px;" id="addClass">클래스 등록</button>
								  </c:otherwise>
								</c:choose>
                       			  
								<c:if test="${empty sessionScope.id }">
                       			  <button type="button" class="navbar-btn nav-button wow bounceInRight class" data-toggle="modal" data-target="#loginModal" 
                       			  style="margin-right: 30px;">로그인</button>
                      			  <button class="navbar-btn nav-button wow fadeInRight" id="join" data-wow-delay="0.5s">회원가입</button>
								</c:if>
								
								<c:if test="${not empty sessionScope.id }">
								<!-- 알림 버튼 -->
                      			 <div style="display: flex;">
								    <div class="notification-container">
								        <button id="notification-button" style="padding-right: 30px; font-size: 25px;">
								            <i class="fa fa-bell"></i>
								            <span style="right: 14px;" class="notification-count"></span>
								        </button>
								    </div>
								    <!-- 알림 버튼 -->
								    <!-- 마이페이지 -->
								    <button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.5s" style="margin-left: auto; margin-right: 30px;">
								        <i class="fas fa-user-circle"></i>마이페이지
								    </button>
								</div>
								<!-- 마이페이지 -->

                      			  <button class="navbar-btn nav-button wow fadeInRight" id="logout" data-wow-delay="0.5s">로그아웃</button>
								</c:if>
								
									<button type="button" class="navbar-btn nav-button wow fadeInRight more" id="more" style="margin-left: 30px;">더보기</button>
                  			    </div>
                  			     <div id="notification-popup" class="notification-popup">
								  <div id="notification-header" class="notification-header">
								    <h3 class="notification">알림</h3>
								    <button type="button" id="notification-read">전체 읽음</button>
								  </div>
								  <div id="notification-content" class="notification-content">
								    <ul id="notification-list" class="notification-list"></ul>
								  </div>
								</div>


                  			     
                  			     <div id="more-popup" class="more-popup">
                  			     <ul>
                  			       <li><a href="/sw/community"> 커뮤니티</a></li>
                  			       <li><a href="#"> 공지사항</a></li>
                  			     </ul>
                  			     </div>
                                <div style="display: none;" class="search-toggle">

                                    <div class="search-row">   

                                        <div class="form-group mar-r-20">
                                            <label for="price-range">Price range ($):</label>
                                            <div class="slider-selection" style="left: 0%; width: 75%;"></div>
                                            <div class="slider-handle round left-round" style="left: 0%;"></div>
                                            <div class="slider-handle round" style="left: 75%;"></div>
                                            <div class="tooltip top" style="top: -14px; left: 0px;">
                                            	<div class="tooltip-arrow"></div><div class="tooltip-inner">0 : 450
                                            	</div>
                                            </div>
                                            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[0,450]" id="price-range" style="">
                                            <br>
                                            <b class="pull-left color">2000$</b> 
                                            <b class="pull-right color">100000$</b>
                                        </div>
                                        <!-- End of  -->  

                                        <div class="form-group mar-l-20">
                                            <label for="property-geo">Property geo (m2) :</label>
                                            <div class="slider-selection" style="left: 8.33333%; width: 66.6667%;">
                                            </div>
                                            <div class="slider-handle round left-round" style="left: 8.33333%;"></div>
                                            <div class="slider-handle round" style="left: 75%;"></div><div class="tooltip top" style="top: -14px; left: 0px;">
                                            <div class="tooltip-arrow"></div>
                                            <div class="tooltip-inner">50 : 450</div></div>
                                            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[50,450]" id="property-geo" style="">
                                            <br>
                                            <b class="pull-left color">40m</b> 
                                            <b class="pull-right color">12000m</b>
                                        </div>
                                        <!-- End of  --> 
                                    </div>

                                    <div class="search-row">

                                        <div class="form-group mar-r-20">
                                            <label for="price-range">Min baths :</label>
                                            <div class="slider-selection" style="left: 41.6667%; width: 33.3333%;"></div>
                                            <div class="slider-handle round left-round" style="left: 41.6667%;"></div>
                                            <div class="slider-handle round" style="left: 75%;"></div>
                                            <div class="tooltip top" style="top: -14px; left: 0px;">
                                            <div class="tooltip-arrow"></div><div class="tooltip-inner">250 : 450</div>
                                            </div>
                                            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="min-baths" style=""><br>
                                            <b class="pull-left color">1</b> 
                                            <b class="pull-right color">120</b>
                                        </div>
                                        <!-- End of  --> 

                                        <div class="form-group mar-l-20">
                                            <label for="property-geo">Min bed :</label>
		                                            <div class="slider-selection" style="left: 41.6667%; width: 33.3333%;"></div>
		                                            <div class="slider-handle round left-round" style="left: 41.6667%;"></div>
		                                            <div class="slider-handle round" style="left: 75%;"></div>
                                            <div class="tooltip top" style="top: -14px; left: 0px;">
                                            <div class="tooltip-arrow"></div>
                                            <div class="tooltip-inner">250 : 450</div>
                                        </div>
                                        <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="min-bed" style="">
                                            <br>
                                            <b class="pull-left color">1</b> 
                                            <b class="pull-right color">120</b>
                                        </div>
                                        <!-- End of  --> 

                                    </div>
                                    <br>
                                    <div class="search-row">  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                     Fire Place(3100)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  -->  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                     Dual Sinks(500)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                     Hurricane Shutters(99)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 
                                    </div>

                                    <div class="search-row">  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                    Swimming Pool(1190)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  -->  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                  <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                   2 Stories(4600)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                     Emergency Exit(200)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 
                                    </div>                                    

                                    <div class="search-row">  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                        			 Laundry Room(10073)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  -->  

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                   Jog Path(1503)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 

                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                                   26' Ceilings(1200)
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End of  --> 
                                        <br>
                                        <hr>
                                    </div>                             
                                    <button class="btn search-btn prop-btm-sheaerch" type="submit"><i class="fa fa-search"></i></button>  
                                    
                                </div>                    
							  
                            </form>
                    <ul class="main-nav nav navbar-nav navbar-right">

                    </ul>
				</div>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!-- End of nav bar -->
        <!-- Modal 내용 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class= "modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">Wolclass</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="col-md-6" style="position: absolute; display: contents;">
	<div class="box-for overflow" >
		<div class="col-md-12 col-xs-12 login-blocks" >
			<h2>Login</h2>
			<form method="post" id="login_form">
				<div class="form-group">
					<label for="m_id">아이디</label> 
					<input type="text" class="form-control" name="m_id">
				</div>
				<div class="form-group">
					<label for="m_pw">비밀번호</label> 
					<input type="password" class="form-control" name="m_pw">
				</div>
				<div class="text-center">
					<button class="btn btn-default" id="loginBtn">로그인</button>
				</div>
			</form>
			<div class="text-center">
				<a href="#" style="color: black;">아이디</a>/<a href="#" style="color: black;">비밀번호 찾기</a>  
				<a href="/db/join" style="margin-left: 3px; color: black;">회원가입</a>	
			</div>
	
			<br>
			<p>
				<a class="login-social" href="#"><i class="fa fa-facebook"></i>&nbsp;Facebook</a>
				<a class="login-social" href="#"><i class="fa fa-google-plus"></i>&nbsp;Gmail</a>
				<a class="login-social" href="#"><i class="fa fa-twitter"></i>&nbsp;Twitter</a>
			</p>
		</div>
	</div>
</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		
		$('#join').click(function(){
			location.href="/db/join";
			return false;
		})
		
		$('#logout').click(function(){
			location.href="/db/logout";
			return false;
		});
		
		$('#addClass').on('click', function() {
		    var id = $('#id').val();
		    console.log(id);
		    if (!id) {
		    	alert('로그인이 필요합니다.');
		      $('#loginModal').modal('show');
		    } else{
		    	alert('클래스 등록');
		    	location.href='/tj/classWorkSpace';
		    }
		    return false;
		  });
		
	});
	
	// 모달창 id,pw 이벤트 전파 막기
	$("#m_id").click(function(event){
	    event.stopPropagation(); 
	  });
	$("#m_pw").click(function(event){
	    event.stopPropagation(); 
	  });
	// 모달창 id,pw 이벤트 전파 막기
	// 로그인 submit - 다빈
	$("#loginBtn").click(function(){
		  $("#login_form").attr("action","/db/login");
		  $("#login_form").submit();
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
	                        html += "<li> <a href='#' id='alertCheck' data-a-no='" + alert.a_no + "'>" + alert.a_content + "</a></li>";
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
	            notificationPopup.hide();
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

</script>

