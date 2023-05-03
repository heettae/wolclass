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
		
		var vo = { cancel_request_amount : 100, merchant_uid : 44 };
		
		$.ajax({
			url:"",
			type:"POST",
			contentType:"application/json",
			//data: vo,
			data: JSON.stringify(vo),
// 			dataType: "json",
			success:function(){
				alert("성공~!");
			},
			error:function(){
				alert("실패");
			}
		});

	})
});


</script>
<body>
<h1>payList</h1>
<h2>결제 완료</h2>
<input type="button" value="예약취소" id="cancel" >

</body>
</html>