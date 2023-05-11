<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<script type="text/javascript">
var p_no;
$(document).ready(function(){
	$('#subs').click(function(){
		alert("구독하기 버튼 클릭!");

	
		/////////////////////////////////////////////////////////////////////////////
		
		 
			 alert('결제창띄우기');
		        var IMP = window.IMP; 
		        IMP.init("imp75550270"); 
		       	
		        
		        $.ajax({
						url:"/th/getP_no",
						type:"post",
					 	//contentType: "application/json; charset=utf-8",
						dataType:"json",
						success:function(data){
							alert("p_no 가져오기");
							console.log(data);
							p_no = data;
						
						},	
						error:function(data){
							alert("실패");
							// 페이지 이동 후 실패했을 때 동작
						}
					}); // p_no ajax

						

					IMP.request_pay({
				    pg : 'html5_inicis.INIpayTest',
				    pay_method : 'card',
				    merchant_uid: p_no,
				    name : "월클래스 구독",
				    amount : 100, //구독료 수정하기
				    buyer_email: "${memberVO.m_email}", //
				    buyer_name: "${memberVO.m_name}",   //
				    buyer_tel: "${memberVO.m_phone}"    //
				   // ,buyer_addr : '서울특별시 강남구 삼성동',
				   // buyer_postcode : '123-456'
				}, function(rsp) {
					if ( rsp.success ) {
				    alert("결제까지 성공했음");
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
				    		url: "/thr/insertPaymentInfo", //cross-domain error가 발생하지 않도록 주의해주세요
				    		type: 'POST',
					    		//contentType : "application/json",
				    		data: JSON.stringify(result),
				    		contentType:'application/json;',
					        success: function(res){
						        console.log(res);
					        	if (res === "ok") {
					        	
					        	alert("insert ok!");
					        	
								
					        	
					        	
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
				    	            url: "/thr/complete",
				    	            type: "POST",
						    		data: JSON.stringify(result),
						    		contentType:'application/json;',
							        success: function(r){
							        	alert("complete 호출")
							        	console.log("r : "+r);
							        	
							        	 if (r === "success") {
							        		
								    		 $.ajax({
								    	            url: "/th/orderSuccess",
								    	            type: "POST",
										    		data: JSON.stringify(result),
										    		contentType:'application/json;',
											        success: function(orderSuccessCnt){
											        	console.log(orderSuccessCnt);
											        	if(orderSuccessCnt > 1) {
											        		var msg = '결제가 완료되었습니다.';
											    			msg += '\n고유ID : ' + rsp.imp_uid;
											    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
											    			msg += '\n결제 금액 : ' + rsp.paid_amount;
											    			//msg += '\n카드 승인번호 : ' + rsp.apply_num;
											    			
											    			alert(msg);
											    			location.href='/th/payments';
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
							

				  
	
		
		/////////////////////////////////////////////////////////////////////////////
		
		
	});
		
}); // jQuery


</script>
<body>
	<h1> Subscription.jsp </h1>
	
	<input type="button" value="구독하기" id="subs" >
	

</body>
</html>