<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->


<!-- 트리거 버튼 -->
<!-- <button type="button" class="btn btn-default" data-toggle="modal" data-target="#loginModal" > -->
<!--   Login -->
<!-- </button> -->

<!-- Modal 내용 -->
<!-- <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true"> -->
<!--   <div class= "modal-dialog modal-dialog-centered" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="loginModalLabel">Wolclass</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
      <div class="col-md-6" style="position: absolute; display: contents;">
	<div class="box-for overflow" >
		<div class="col-md-12 col-xs-12 login-blocks" >
			<h2>Login</h2>
			<form method="post" id="login_form">
				<div class="form-group">
					<label for="m_id">아이디</label> 
					<input type="text" class="form-control" id="m_id" name="m_id">
				</div>
				<div class="form-group">
					<label for="m_pw">비밀번호</label> 
					<input type="password" class="form-control" id="m_pw" name="m_pw">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-default" id="loginBtn">로그인</button>
				</div>
			</form>
			<div class="text-center">
				<a href="/member/findId" style="color: black;">아이디 찾기</a>/<a href="/member/findPw" style="color: black;">비밀번호 찾기</a>  
				<a href="/member/join" style="margin-left: 3px; color: black;">회원가입</a>	
			</div>
	
			<br>
			
			<p>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=c6c8f231f2997186bfd65955c7b8f1ab&redirect_uri=http://localhost:8080/member/kakao&response_type=code">
				<img src="../resources/img/kakao_login_btn.png"/></a>
<!-- 				<a onclick="loginKakao()"><img src="../resources/img/kakao_login_btn.png"/></a> -->
				<a class="login-social" href="#"><i class="fa fa-google-plus"></i>&nbsp;Gmail</a>
				<a class="login-social" href="#"><i class="fa fa-twitter"></i>&nbsp;Twitter</a>
			</p>
		</div>
	</div>
</div>
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!-- <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script> -->
<script type="text/javascript">
	$("#loginBtn").click(function(){
		  $("#login_form").submit();
	});
	
	$(document).ready(function(){
       <% if (request.getAttribute("result") != null && (int)request.getAttribute("result") == 0) { %>
       		alert("사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.");
       <% } %>
    });
	
	// 초기화 시키기
// 	$(document).ready(function(){
// 		Kakao.init('8d69e5bb9b3085415d58016c4cee636e');
// 		Kakao.isInitialized();
// 	});
	
// 	function loginKakao(){
// 		Kakao.Auth.authorize({
// 			redirectUri:'http://localhost:8080/db/kakao'
// 		});
// 	}
	
	
</script>
<%@ include file="../include/footer.jsp"%>