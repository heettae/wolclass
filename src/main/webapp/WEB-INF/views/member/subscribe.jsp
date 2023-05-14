<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/side.jsp" %>

<style>
	.box-big {
		background-image: url("../resources/img/subimg.png");
		background-size: contain;
		background-position: center;
		background-repeat: unset;
		width: 100%;
		height: 500px;
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: auto;
	}
	.box-content {
		color: #fff;
		text-align: center;
		position: absolute;
	}
	.box-content button {
		background-color: darkorange;
		color: white;
		font-size: 1.2rem;
		padding: 1rem 2rem;
		border: none;
		cursor: pointer;
	}
	.box-content button:hover{
 	 background-color: #333;
  	color: #FDC600;
	}
	.box-big h1 {
	  position: relative;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  z-index: 1;
	  color: black;
	}
	.box-small {
	  display: flex;
	  justify-content: center; 
	  align-items: center; 
	  width: 350px;
	  height: 50px;
	  margin: 10px;
	  background-color: antiquewhite;
	  border-radius: 10px;
	  font-size: 18px;
	  font-weight: bold;
	  text-align: center;
	  line-height: 50px;
	}
</style>
<!-- 구독시 5번 50% 할인 -->
<c:set var="vo" value="${sub }"/>
	<div class="container">
		 <div class="box-big">
		  <div class="box-content">
		    <h1>구독시 5번 50% 할인<br>9,900원</h1>
		    <c:if test="${vo == null }">
		    	<button type="button" id="subs">구독하기</button>
		    </c:if>
		  </div>
		</div>
		<div style="margin: auto; width: 450px; padding-left: 45px" >
			<c:if test="${vo != null }">
			  <div class="box-small" style="display: inline-block;">
			  	잔여기간 : ${vo.s_start.toString().split(' ')[0] }~${vo.s_end.toString().split(' ')[0] }
			  </div>
			  <div class="box-small" style="display: inline-block;">잔여횟수 : ${vo.s_cnt }번</div>
			</c:if>
		</div>
	</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
var p_no;
$(document).ready(function(){
	$('#subs').click(function(){
		// 구독 버튼
        var IMP = window.IMP; 
        IMP.init("imp75550270"); 
       	
        $.ajax({
				url:"/payrest/getP_no",
				type:"post",
				dataType:"json",
				success:function(data){
					console.log("p_no:"+data);
					p_no = data;
				
				},	
				error:function(data){
					// 페이지 이동 후 실패했을 때 동작
					console.log("p_no 가져오기 실패");
				}
			}); // p_no ajax


			IMP.request_pay({
		    pg : 'html5_inicis.INIpayTest',
		    pay_method : 'card',
		    merchant_uid: p_no,
		    name : "월클래스 구독",
		    amount : 9900 //구독료 수정하기
		}, function(rsp) {
			if ( rsp.success ) {
		    //alert("결제까지 성공했음");
		    //alert($("#pNum").val());
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	var result = {
				"imp_uid" : rsp.imp_uid,
				"merchant_uid" : rsp.merchant_uid,
				"p_no" : p_no,
				"m_id" : "${id}",
				"price" : rsp.paid_amount,
				"status" : rsp.status
				}
		   		console.log(result);

		    	jQuery.ajax({
		    		url: "/payrest/insertPaymentInfo", //cross-domain error가 발생하지 않도록 주의해주세요
		    		type: 'POST',
		    		data: JSON.stringify(result),
		    		contentType:'application/json;',
			        success: function(res){
				        console.log(res);
			        	if (res === "ok") { 	
			        	 console.log("insert ok!");   	
			        	}else{
				         console.log("Insert Fail!!!");
				        }
				     },
			        error:function(){
			          console.log("Insert ajax 통신 실패!!!");
			        }

		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		console.log("done"+data);
		    		console.log("done"+rsp.imp_uid);
		    		
		    		 $.ajax({
		    	            url: "/payrest/complete",
		    	            type: "POST",
				    		data: JSON.stringify(result),
				    		contentType:'application/json;',
					        success: function(r){
					        	console.log("complete 호출 성공 : "+r);
					        	
					        	 if (r === "success") {	
						    		 $.ajax({
					    	            url: "/payrest/orderSuccess",
					    	            type: "POST",
							    		data: JSON.stringify(result),
							    		contentType:'application/json;',
								        success: function(orderSuccessCnt){
								        	console.log(orderSuccessCnt);
								        	if(orderSuccessCnt >= 1) {
								        		var msg = '결제가 완료되었습니다.';
								    			msg += '\n고유ID : ' + rsp.imp_uid;
								    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
								    			msg += '\n결제 금액 : ' + rsp.paid_amount;
								    			alert(msg);
								    			location.reload();
								        	}
								        }
					        		});

					    		} else {
					    			//[3] 아직 제대로 결제가 되지 않았습니다.
					    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					    		}
					        } // complete success
		    		 }); // ajax

		    	}); // done
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		        alert(msg);
		    }
		});					

	});
		
}); // jQuery


</script>



<!-- side.jsp -->
</div>
</section>
<!-- side.jsp -->
                
<%@ include file="../include/footer.jsp" %>