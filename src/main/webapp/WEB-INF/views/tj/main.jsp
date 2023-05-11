<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<style>

/* 도트 모양 스타일 */
/* 도트 위치 조정 */
.slick-dots {
    bottom: 20px;
}

/* 도트 모양 제거 */
.slick-dots li button:before {
    content: none;
}

/* 도트 활성화 모양 */
.slick-dots li.slick-active button:before {
    content: "\f111";
    font-family: FontAwesome;
    font-size: 10px;
    color: #fff;
    opacity: 1;
}

/* 화살표 모양 제거 */
.slick-prev:before, .slick-next:before {
    content: none;
}

/* 화살표 스타일 */
.slick-prev, .slick-next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 30px;
    height: 30px;
    background: #fff;
    border: none;
    border-radius: 50%;
    font-size: 14px;
    line-height: 1;
    cursor: pointer;
    transition: all 0.3s ease;
    z-index: 1;
}

.slick-prev:hover, .slick-next:hover {
    background: #ccc;
}

.slick-prev {
    left: 20px;
}

.slick-next {
    right: 20px;
}

.slick-prev:after {
    content: "\f053";
    font-family: FontAwesome;
    font-size: 16px;
    color: #333;
    display: block;
    margin: -1px 0 0 -1px;
}

.slick-next:after {
    content: "\f054";
    font-family: FontAwesome;
    font-size: 16px;
    color: #333;
    display: block;
    margin: -1px 0 0 -1px;
}
/* 도트 모양 스타일 */

.item-thumb {
  position: relative; /* 이미지를 포지션:absolute;로 설정할 때 기준이 될 부모 요소를 설정 */
}
.item-thumb img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  position: absolute;
  top: 0;
  left: 0;
}

</style>

<div class="slider-area">
  <div class="slider">
    <div id="bg-slider" class="owl-carousel owl-theme">

      <div class="item">
        <a href="#">
          <img src="/resources/img/sub.PNG" alt="구독">
        </a>
      </div>

      <div class="item">
        <a href="/tj/Event">
          <img src="/resources/img/review.png" alt="리뷰">
        </a>
      </div>

    </div>

  </div>
</div>
<div class="content-area home-area-1 recent-property"
	style="background-color: #FCFCFC; padding-bottom: 55px;">
	<div class="container">
		
		<!-- 온라인 클래스 -->
		<c:if test="${WDATA.contains('Rain') && !WDATA.contains('lightrain') }">
		<div class="row">
			<div class="proerty-th">
			<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
					<h2>비 오는 날엔 집에서 듣는 온라인 클래스!</h2>
				</div>
				<div class="slick-slider col-sm-12">
				<c:set var="count" value="0"/>
				<c:forEach items="${onlineList }" var="vo">
				  <c:if test="${count < 8 }">
					<div class="col-sm-6 col-md-3 p0">
						<div class="box-two proerty-item">
							<div class="item-thumb">
								<a href="/class/detail?c_no=${vo.c_no }"><img src="/resources/img/${rvo.c_img.split(',')[0] }"></a>
							</div>
							<div class="item-entry overflow">
					    <h4><a href="/class/detail?c_no=${rvo.c_no }">${vo.c_name }</a></h4>
					    <span class="proerty-price pull-left">
					    <fmt:formatNumber value="${rvo.c_price }"/> 원
					    </span>
					    <span class="pull-right"> 평점 :  </span>
					    <!-- 위시리스트 버튼 -->
				        <c:if test="${not empty sessionScope.id }">
				        <button class="wishlist-btn ${wishList.contains(rvo.c_no) ? 'active' : ''}" value="${rvo.c_no }">
				          <i class="fas fa-heart"></i>
				        </button>
				        </c:if>
				        <!-- 위시리스트 버튼 -->
						</div>
						</div>
					</div>
					<c:set var="count" value="${count + 1 }"/>
					</c:if>
				</c:forEach>
				</div>
			</div>
		</div>
		</c:if>
		<!-- 온라인 클래스 -->
		
		<!-- 추천리스트 -->
		<c:if test="${not empty recClass }">
		<div class="row">
			<div class="proerty-th">
			<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
					<h2>${sessionScope.id }님의 추천 클래스</h2>
				</div>
				<div class="slick-slider col-sm-12">
				<c:forEach items="${recClass }" var="rvo">
					<div class="col-sm-6 col-md-3 p0">
						<div class="box-two proerty-item">
							<div class="item-thumb">
								<a href="/class/detail?c_no=${rvo.c_no }"><img src="/resources/img/${rvo.c_img.split(',')[0] }"></a>
							</div>
							<div class="item-entry overflow">
					    <h4><a href="/class/detail?c_no=${rvo.c_no }">${rvo.c_name }</a></h4>
					    <span class="pull-left"><b>${rvo.c_addr1 }</b> </span><br>
					    <span class="proerty-price pull-left">
					    <fmt:formatNumber value="${rvo.c_price }"/> 원
					    </span>
					    <span class="pull-right"> 평점 : ${rvo.score }</span>
					    <!-- 위시리스트 버튼 -->
				        <c:if test="${not empty sessionScope.id }">
				        <button class="wishlist-btn ${wishList.contains(rvo.c_no) ? 'active' : ''}" value="${rvo.c_no }">
				          <i class="fas fa-heart"></i>
				        </button>
				        </c:if>
				        <!-- 위시리스트 버튼 -->
						</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
			</c:if>
		<!-- 추천리스트 -->
		
		<!-- 일반 리스트 -->
		<div class="row">
		  <div class="proerty-th">
		    <c:forEach items="${categoryList}" var="vo">
		      <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
		        <h2>${vo.key }</h2>
		      </div>
		      <div class="slick-slider col-sm-12">
		      <c:set var="count" value="0"/>
		        <c:forEach items="${vo.value }" var="classVO">
		          <c:if test="${count < 8 }">
		          <div class="col-sm-6 col-md-3 p0">
		            <div class="box-two proerty-item">
		              <div class="item-thumb">
		                <a href="/class/detail?c_no=${classVO.c_no }"><img src="/resources/img/${classVO.c_img.split(',')[0] }"></a>
		              </div>
		              <div class="item-entry overflow">
		                <h4><a href="/class/detail?c_no=${classVO.c_no}">${classVO.c_name}</a></h4>
		                <span class="pull-left"><b>${classVO.c_addr1}</b> </span><br>
		                <span class="proerty-price pull-left">
		                  <fmt:formatNumber value="${classVO.c_price}"/> 원
		                </span>
		                <span class="pull-right"> 평점 : ${classVO.score }</span>
		                <!-- 위시리스트 버튼 -->
		                <c:if test="${not empty sessionScope.id }">
				        <button class="wishlist-btn ${wishList.contains(classVO.c_no) ? 'active' : ''}" value="${classVO.c_no }">
				          <i class="fas fa-heart"></i>
				        </button>
				        </c:if>
		                <!-- 위시리스트 버튼 -->
		              </div>
		            </div>
		          </div>
		          <c:set var="count" value="${count + 1}"/>
		          </c:if>
		        </c:forEach>
		      </div>
		    </c:forEach>
		  </div>
		</div>
	</div>
</div>
<script type="text/javascript">

// 상단 베너
$(document).ready(function() {

  $("#bg-slider").owlCarousel({
    items: 1,
    loop: true,
    autoplay: true,
    autoplayTimeout: 10000,
    smartSpeed: 1000,
    nav: false,
    dots: false
  });

});

// 상단 베너

// 슬라이드
$('.slick-slider').slick({
    slidesToShow: 4, // 4개씩 보여줍니다.
    slidesToScroll: 4, // 4개씩 스크롤합니다.
    infinite: true, // 무한 루프를 사용합니다.
    dots: true, // 도트 표시를 사용합니다.
    responsive: [
      {
        breakpoint: 992, // 화면 크기가 992px 이하일 때 옵션을 변경합니다.
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3
        }
      },
      {
        breakpoint: 768, // 화면 크기가 768px 이하일 때 옵션을 변경합니다.
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 576, // 화면 크기가 576px 이하일 때 옵션을 변경합니다.
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
 });
// 슬라이드
</script>

<%@ include file="../include/footer.jsp"%>
