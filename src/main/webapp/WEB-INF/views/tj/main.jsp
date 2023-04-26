<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<style>
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
        <a href="#">
          <img src="/resources/img/review.PNG" alt="리뷰">
        </a>
      </div>

      <div class="item">
        <a href="#">
          <img src="https://via.placeholder.com/1903x615/000000/FFFFFF?text=Slide+3" alt="Slide 3">
        </a>
      </div>
      <div class="item">
        <a href="#">
          <img src="https://via.placeholder.com/1903x615/000000/FFFFFF?text=Slide+4" alt="Slide 4">
        </a>
      </div>

    </div>

  </div>
</div>
<div class="content-area home-area-1 recent-property"
	style="background-color: #FCFCFC; padding-bottom: 55px;">
	<div class="container">
		<div class="row">
			<div
				class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
				<!-- /.feature title -->
				<h2>인기/추천 검색어</h2>
				<p>내 주변 검색 & 지도</p>
			</div>
		</div>
		<!-- 추천리스트 -->
		<c:if test="${not empty recClass }">
		<div class="row">
			<div class="proerty-th">
			<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
					<h2>${sessionScope.id }님의 추천 클래스</h2>
				</div>
				<c:forEach items="${recClass }" var="rvo">
					<div class="col-sm-6 col-md-3 p0">
						<div class="box-two proerty-item">
							<div class="item-thumb">
								<a href="/class/detail?c_no=${rvo.c_no }"><img src="/resources/img/no_img.PNG"></a>
							</div>
							<div class="item-entry overflow">
					    <h4><a href="/class/detail?c_no=${rvo.c_no }">${rvo.c_name }</a></h4>
					    <span class="pull-left"><b>${rvo.c_addr1 }</b> </span><br>
					    <span class="proerty-price pull-left">
					    <fmt:formatNumber value="${rvo.c_price }"/> 원
					    </span>
					    <span class="pull-right"> 평점 :  </span>
					    <!-- 위시리스트 버튼 -->
				        <button class="wishlist-btn">
				          <i class="fas fa-heart"></i>
				        </button>
				        <!-- 위시리스트 버튼 -->
						</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
			</c:if>
		<!-- 추천리스트 -->
		<!-- 일반 리스트(슬라이드 리스트) -->
		<div class="row">
		  <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
		    <c:forEach items="${categoryList}" var="vo">
		      <h2>${vo.key }</h2>
		      <div class="proerty-th owl-carousel">
		        <c:forEach items="${vo.value }" var="classVO">
		          <div class="proerty-item">
		            <div class="item-thumb">
		              <a href="/class/detail?c_no=${classVO.c_no }"><img src="/resources/img/no_img.PNG"></a>
		            </div>
		            <div class="item-entry overflow">
		              <h4><a href="/class/detail?c_no=${classVO.c_no}">${classVO.c_name}</a></h4>
		              <span class="pull-left"><b>${classVO.c_addr1}</b> </span><br>
		              <span class="proerty-price pull-left">
		                <fmt:formatNumber value="${classVO.c_price}"/> 원
		              </span>
		              <span class="pull-right"> 평점 : </span>
		              <!-- 위시리스트 버튼 -->
		              <button class="wishlist-btn">
		                <i class="fas fa-heart"></i>
		              </button>
		              <!-- 위시리스트 버튼 -->
		            </div>
		          </div>
		        </c:forEach>
		      </div>
		    </c:forEach>
		  </div>
		</div>
	</div>
</div>
<script type="text/javascript">
// 위시 리스트 
const wishlistBtns = document.querySelectorAll('.wishlist-btn');
wishlistBtns.forEach(function(btn) {
  btn.addEventListener('click', function() {
    btn.classList.toggle('active');
  });
});
// 위시 리스트 

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
$(document).ready(function(){
  $('.owl-carousel').each(function() {
    $(this).owlCarousel({
      loop:false, // 무한 반복 여부
      margin:20, // 사이드 간격
      nav:true, // 네비게이션 활성화 여부
      dots:false, // 도트 활성화 여부
      autoplay:true, // 자동 재생 여부
      autoplayTimeout:5000, // 자동 재생 시간 간격
      autoplayHoverPause:true, // 마우스 오버시 자동 재생 멈춤 여부
      responsive:{
          0:{
              items:1 // 브라우저 창이 0~767px 일때 1개 아이템 출력
          },
          768:{
              items:2 // 브라우저 창이 768~991px 일때 2개 아이템 출력
          },
          992:{
              items:4 // 브라우저 창이 992px 이상 일때 4개 아이템 출력
          }
      }
    });
  });
});
// 슬라이드
</script>

<%@ include file="../include/footer.jsp"%>
