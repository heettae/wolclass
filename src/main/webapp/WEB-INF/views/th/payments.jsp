<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../include/header.jsp" %> --%>
<html>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#cancel').click(function(){
		alert("취소 버튼 클릭!");

		   jQuery.ajax({
			      url: "/thr/checkPayment", 
			      type: "POST",
			      contentType: "application/json",
			      data: "20230511016", // p_no 값 넣기
			      success: function(p_no) {
			    	      console.log(p_no)
			    	  	  jQuery.ajax({
			    	        url: "/thr/refund", 
			    	        type: "POST",
			    	        contentType: "application/json",
			    	        data: p_no,
			    	        success: function(refundResponse) {
			    	          // refund ajax 실행 후 작업 수행
			    	          
			    	        	  if(refundResponse === "ok"){	
			    	                  alert('환불 요청이 완료되었습니다.');
			    	               // 예약취소 버튼 수정하기
			    	              } else if(refundResponse === "already refund"){ 
			    	            	  alert('이미 환불 처리된 주문 건입니다.');
			    	              } else{
			    	                  alert('실패: 관리자에게 문의해주세요');
			    	              }	


			    	          
			    	          
			    	        },
			    	        error: function(error) {
			    	          // refund ajax 실행 중 에러 발생 시 처리
			    	        }
			    	      }); // refund ajax
			      } // ajax-check-success
			    }); // ajax-check
			  

	}) // cancel.click
}); // jQuery


</script>
<body>
<h1>payList</h1>
<h2>결제 완료</h2>
<input type="button" value="예약취소" id="cancel" >

</body>
</html>