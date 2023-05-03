-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Footer area-->
<div class="footer-area" style="position: relative; bottom: 0; width: 100%;">

    <div class=" footer">
        <div class="container">
            <div class="row">

                <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                    <div class="single-footer">
                       <a href="#"> <h4>이용약관</h4> </a>
                     </div>
                </div>
                
                <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                    <div class="single-footer">
                        <a href="#"> <h4>개인정보처리방침</h4> </a>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                    <div class="single-footer">
                       <a href="#"> <h4>사업자정보확인</h4> </a>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                    <div class="single-footer">
                       <a href="#"> <h4>문의하기</h4> </a>
                    </div>
                </div>

            </div>
        </div>
    </div>

	<div class="footer-copy text-center">
	    <div class="container">
	        <div class="row">
	            <div class="pull-left">
	                <span> WolClass , All rights reserved 2016  </span> 
	            </div> 
	        </div>
	    </div>
	</div>
	
</div>
<!-- Footer area-->

<!-- 위시 리스트 버튼 동작 및 서버요청 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var hj = $.noConflict();
hj(document).ready(function() {
	let url;
	let cno;
	const wishlistBtns = document.querySelectorAll('.wishlist-btn');
	wishlistBtns.forEach(function(btn) {
	  btn.addEventListener('click', function() {
		cno = hj(this).val();
		if (btn.classList.contains('active')) url = '/wish/del';
		else url = '/wish/add';
	    wishChange(btn);
	  });
	});
	function wishChange(btn){
		hj.ajax({
			  url: url,
			  type: 'POST',
			  data: {c_no:cno},
			  success: function(data) {
			    btn.classList.toggle('active');
			  },
			  error: function() {
			    console.error('요청 실패');
			  }
		});
	}
});
</script>
<!-- 위시 리스트 버튼 동작 및 서버요청 -->

<!-- 사용자 위치정보 받아오기 -->
<script type="text/javascript">
hj(document).ready(function() {
	let lat = '${sessionScope.userLat}';
	// 위치 정보가 없는 경우
	if(lat == null || lat == '') {
	//내 위치 찾기
		if (navigator.geolocation) {
		   // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		   navigator.geolocation.getCurrentPosition(function(position) {
		       var lat = position.coords.latitude, // 위도
		           lon = position.coords.longitude; // 경도
		           
		           hj.ajax({
		    	   url: "/location",
		    	   type: "POST",
		    	   data: {
		    	     "userLat": lat,
		    	     "userLng": lon
		    	   },
		    	   success: function(data) {
		    		   console.log("위치정보 데이터 처리 성공");
		    	   },
		    	   error: function(data) {
		    		   console.log("위치정보 데이터 처리 실패 : "+data);
		    	   }
		    	 });
		     });
		   
		} else {
			console.log('geolocation을 사용할수 없어요..');
		}
	// 내 위치 찾기
	}
	// 위치 정보가 없는 경우
});
</script>
<!-- 사용자 위치정보 받아오기 -->
<script src="/resources/assets/js/modernizr-2.6.2.min.js"></script>
<script src="/resources/assets/js/jquery-1.10.2.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/assets/js/bootstrap-select.min.js"></script>
<script src="/resources/assets/js/bootstrap-hover-dropdown.js"></script>
<script src="/resources/assets/js/easypiechart.min.js"></script>
<script src="/resources/assets/js/jquery.easypiechart.min.js"></script>
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/wow.js"></script>
<script src="/resources/assets/js/icheck.min.js"></script>
<script src="/resources/assets/js/price-range.js"></script>
<script src="/resources/assets/js/main.js"></script>
        
<!-- adminlte -->
<!-- <script src="/resources/adminlte/bower_components/chart.js/Chart.js"></script> 혹시 차트만 따로 써지나 싶어서 일단 보류 -->
<!-- <script src="/resources/adminlte/dist/js/pages/dashboard.js"></script> 혹시 차트만 따로 써지나 싶어서 일단 보류 -->
<!-- adminlte -->

</body>
</html>