<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
    .star {
        font-size: 24px;
        color: gray;
        cursor: pointer;
    }

    .checked {
        color: gold;
    }
</style>

	<div class="col-md-6" style="position: absolute; display: contents;" >
		<div style="min-height: 600px; height: auto;">
			<div class="box-for overflow" style="width: max-content; margin: auto; min-width: 500px; margin-top: 50px;">
				<div class="col-md-12 col-xs-12 login-blocks">
					
					 <div style="text-align: center;">
			               <h2>WolClass(리뷰작성)</h2>${p_no }
		             </div> 
					<form method="post" id="review_form">
						<input type="hidden" value="${sessionScope.id }" name="m_id">
						<input type="hidden" value="${c_no }" name="c_no">
						<input type="hidden" value="${p_no }" name="p_no">
						<div class="form-group">
							<label for="r_content">리뷰 내용</label><br> 
							<textarea rows="5" cols="80" name="r_content" placeholder=" 리뷰 등록시 결제금액 3%할인 + 500 포인트"></textarea>
						</div>
						 <div class="form-group">
					        <label for="r_score">별점</label><br> 
					        <div class="stars">
					            <i class="star fa fa-star" data-value="1"></i>
					            <i class="star fa fa-star" data-value="2"></i>
					            <i class="star fa fa-star" data-value="3"></i>
					            <i class="star fa fa-star" data-value="4"></i>
					            <i class="star fa fa-star" data-value="5"></i>
					        </div>
					        <input type="hidden" name="r_score" id="r_score" value="0">
					    </div>
						
						<div class="text-center">
							<button type="submit" class="btn btn-default" id="reviewBtn">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	  $('#review_form').submit(function(event) {
	    event.preventDefault();
	    const form = $(this);
	    $.ajax({
	      type: 'POST',
	      url: '/db/myreview',
	      data: form.serialize(), 
	      success: function(data) {
	        alert('리뷰가 성공적으로 등록되었습니다!');
	        form.trigger('reset'); 
	        location.href='/db/classList';
	      },
	      error: function() {
	        alert('리뷰 등록에 실패했습니다.'); 
	      }
	    });
	  });
	
	  const stars = document.querySelectorAll('.star');
	  const scoreInput = document.getElementById('r_score');
	
	  stars.forEach(star => {
	    star.addEventListener('click', () => {
	      const value = star.getAttribute('data-value');
	      scoreInput.value = value;
	      stars.forEach((s, i) => {
	        if (i < value) {
	          s.classList.add('checked');
	        } else {
	          s.classList.remove('checked');
	        }
	      });
	    });
	  });
	</script>
	
	

	
<%@ include file="../include/footer.jsp" %>