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
					<button class="btn btn-warning" id="email_auth_btn">인증번호 전송</button>
					<sapn class="mail_input_box_warn"></sapn>
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
$(".btn-warning").click(function(){
	var email = $("#m_email").val();
	var warnMsg = $(".mail_input_box_warn");
	
	$.ajax({
		type : "GET",
		url : "pwMailCheck?email="+email,
		success : function(data){
		}
	});
});
</script>

<%@ include file="../include/footer.jsp"%>