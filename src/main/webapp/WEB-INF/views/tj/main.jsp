<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<style>
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

</style>


<div class="slider-area">
	<div class="slider">
		<div id="bg-slider" class="owl-carousel owl-theme"
			style="opacity: 1; display: block;">

			<div class="owl-wrapper-outer">
				<div class="owl-wrapper"
					style="width: 11418px; left: 0px; display: block; transition: all 0ms ease 0s; transform: translate3d(-3806px, 0px, 0px); transform-origin: 4757.5px center; perspective-origin: 4757.5px center;">
					<div class="owl-item" style="width: 1903px;">
						<div class="item">
							<img src="/resources/img/sub.PNG" alt="구독">
						</div>
					</div>
					<div class="owl-item" style="width: 1903px;">
						<div class="item">
							<a href="/tj/sub"> <img src="/resources/img/review.PNG"
								alt="리뷰"> </a>
						</div>
					</div>
					<div class="owl-item" style="width: 1903px;">
						<div class="item">
							<a href="/tj/sub"> <img src="/resources/img/review.PNG"
								alt="리뷰"> </a>
						</div>
					</div>
				</div>
			</div>



			<div class="owl-controls clickable">
				<div class="owl-pagination">
					<div class="owl-page">
						<span class=""></span>
					</div>
					<div class="owl-page">
						<span class=""></span>
					</div>
					<div class="owl-page active">
						<span class=""></span>
					</div>
				</div>
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
				<h2>Top submitted property</h2>
				<p>Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu
					nec pretium. Nullam sed arcu ultricies .</p>
			</div>ㅉ
		</div>

		<div class="row">
			<div class="proerty-th">
				<c:forEach items="${classVOList}" var="vo">
				  <div class="col-sm-6 col-md-3 p0">
				    <div class="box-two proerty-item">
				      <div class="item-thumb">
				        <a href="/class/detail?c_no=${vo.c_no }"><img src="/resources/img/no_img.PNG"></a>
				      </div>
				      <div class="item-entry overflow">
				        <h4><a href="/class/detail?c_no=${vo.c_no}">${vo.c_name}</a></h4>
				        <span class="pull-left"><b>${vo.c_addr1}</b> </span><br>
				        <span class="proerty-price pull-left">
				          <fmt:formatNumber value="${vo.c_price}"/> 원
				        </span>
				        <span class="pull-right"> 평점 : </span>
				        <button class="wishlist-btn">
				          <i class="fas fa-heart"></i>
				        </button>
				      </div>
				    </div>
				  </div>
				</c:forEach>
				<div class="col-sm-6 col-md-3 p0">
					<div class="box-tree more-proerty text-center">
						<div class="item-tree-icon">
							<i class="fa fa-th"></i>
						</div>
						<div class="more-entry overflow">
							<h5>
								<a href="property-1.html">CAN'T DECIDE ? </a>
							</h5>
							<h5 class="tree-sub-ttl">Show all properties</h5>
							<button class="btn border-btn more-black" value="All properties">All
								properties</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
const wishlistBtns = document.querySelectorAll('.wishlist-btn');
wishlistBtns.forEach(function(btn) {
  btn.addEventListener('click', function() {
    btn.classList.toggle('active');
  });
});

</script>

<%@ include file="../include/footer.jsp"%>
