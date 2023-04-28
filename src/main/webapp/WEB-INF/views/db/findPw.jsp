<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="col-mda-6">
	<div class="box-for overflow">
		<div class="col-md-12 col-xs-12 login-blocks">
			<h2>비밀번호 찾기</h2>
			<form id="findPwForm" method="post">
				<div class="form-group">
					<label for="m_id">아이디</label>
					 <input type="text" class="form-control" id="m_id" name="m_id">
				</div>
				<div class="form-group">
					<label for="m_email">이메일</label> 
					<input type="text" class="form-control" id="m_email" name="m_email">
					<sapn class="mail_input_box_warn" style="display:none">
					ID 이메일 정보가 일치하지 않습니다</sapn>
				</div>
				<div class="text-center">
					<button type="button" class="btn btn-default" id="findPwBtn">
					  비밀번호 찾기
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
//이메일 인증번호 전송
$("#findPwBtn").click(function(){
	var email = $("#m_email").val();
	var id = $("#m_id").val();
	var warnMsg = $(".mail_input_box_warn");
	
	$.ajax({
		type : "post",
		url : "/db/findPw",
		data : $("#findPwForm").serialize(),
		success : function(data){
			if (data == 0) { // 이메일과 아이디가 일치하지 않을 경우
				$(".mail_input_box_warn").css("color","red");
				$(".mail_input_box_warn").css("display","inline-block");
			} else { // 이메일과 아이디가 일치할 경우
				// 인증번호 전송 성공 처리
				alert("임시 비밀번호가 전송되었습니다. 이메일을 확인해주세요");
				location.href="/db/login";
			}
		}
	});
});
</script>

<%@ include file="../include/footer.jsp"%>