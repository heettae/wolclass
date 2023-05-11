<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/side.jsp" %>
<style>
	#container {
	    width: 70%;
	    margin-left: 100px;
	}
	table {
	    border-collapse: collapse;
	    width: 100%;
	    margin-top: 50px;
	}
	th, td {
	    text-align: center;
	    padding: 8px;
	}
	th {
	    background-color: #353942;    
	    color:white;
	}
	td {
	    border-top: none;
	    border-bottom: 1px solid;
	}
	td:first-child,
	th:first-child {
	    border-left: none;
	}
	td:last-child,
	th:last-child {
	    border-right: none;
	}
	#btn:hover{
 	 background-color: #333;
  	color: #FDC600;
	}
</style>

<div id="container">
	<h2>결제내역</h2>
	<table>
	  <thead>
	    <tr>
	      <th>예약번호</th>
	      <th>예약자</th>
	      <th>클래스명</th>
	      <th>총 인원</th>
	      <th>총 금액</th>
	      <th>결제일</th>
	      <th>예약날짜</th>
	      <th>결제상태</th>
	      <th>환불여부</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach var="vo" items="${payList }">
		      <tr>
		        <td>${vo.p_no }</td>
		        <td>${vo.m_id }</td>
		        <td>${vo.c_name }</td>
		        <td>${vo.p_peoplenum }</td>
		        <td>${vo.p_price }</td>
		        <td>${vo.p_paydate.toString().split('\\.')[0] }</td>
		        <td>${vo.p_rsrvdate.toString().replaceAll('\\.0','') }</td>
		        <td>
			        <c:if test="${vo.p_status == 'paid'}">
			        	<font color="green">결제완료</font>
			        </c:if>
			        <c:if test="${vo.p_status == 'cancelled'}">
			        	<font color="red">결제취소</font>
			        </c:if>
		        </td>
		         <td>
		          <c:if test="${vo.p_status == 'paid'}">
		          	<input type="button" onclick="payCancel('${vo.p_no }')" value="환불하기" id="btn">
		          </c:if> 
				</td>
		      </tr>
	      </c:forEach>
	  </tbody>
	</table>
</div>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script type="text/javascript">
function payCancel(pno){
	alert("취소 버튼 클릭!");

	   jQuery.ajax({
		      url: "/thr/checkPayment", 
		      type: "POST",
		      contentType: "application/json",
		      data: pno, // p_no 값 넣기
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
}
// $(document).ready(function(){
// 	$('#cancel').click(function(){
// 		alert("취소 버튼 클릭!");

// 		   jQuery.ajax({
// 			      url: "/thr/checkPayment", 
// 			      type: "POST",
// 			      contentType: "application/json",
// 			      data: "20230510026", // p_no 값 넣기
// 			      success: function(p_no) {
// 			    	      console.log(p_no)
// 			    	  	  jQuery.ajax({
// 			    	        url: "/thr/refund", 
// 			    	        type: "POST",
// 			    	        contentType: "application/json",
// 			    	        data: p_no,
// 			    	        success: function(refundResponse) {
// 			    	          // refund ajax 실행 후 작업 수행
			    	          
// 			    	        	  if(refundResponse === "ok"){	
// 			    	                  alert('환불 요청이 완료되었습니다.');
// 			    	               // 예약취소 버튼 수정하기
// 			    	              } else{
// 			    	                  alert('실패: 관리자에게 문의해주세요');
// 			    	              }	


			    	          
			    	          
// 			    	        },
// 			    	        error: function(error) {
// 			    	          // refund ajax 실행 중 에러 발생 시 처리
// 			    	        }
// 			    	      }); // refund ajax
// 			      } // ajax-check-success
// 			    }); // ajax-check
			  

// 	}) // cancel.click
// }); // jQuery


</script>
<!-- side.jsp -->
</div>
</section>
<!-- side.jsp -->
                
<%@ include file="../include/footer.jsp" %>