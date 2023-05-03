<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 구글 api -->
<!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
<!-- <meta name="google-signin-client_id" content="769868272546-b2725ggq4ditmolppovfkpmgqqtbnovc.apps.googleusercontent.com"> -->

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
				<a href="/db/findId" style="color: black;">아이디 찾기</a>/<a href="/db/findPw" style="color: black;">비밀번호 찾기</a>  
				<a href="/db/join" style="margin-left: 3px; color: black;">회원가입</a>	
			</div>
	
			<br>
			
			<p>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=c6c8f231f2997186bfd65955c7b8f1ab&redirect_uri=http://localhost:8080/db/kakao&response_type=code">
				<img src="../resources/img/kakao_login_btn.png"/></a>
<!-- 				<div class="g-signin2" data-onsuccess="onSignIn"></div> -->
				    <script src="https://accounts.google.com/gsi/client" async defer></script>
				    <div id="g_id_onload"
				         data-client_id="769868272546-b2725ggq4ditmolppovfkpmgqqtbnovc.apps.googleusercontent.com"
				         data-callback="handleCredentialResponse">
				    </div>
				    <div class="g_id_signin" data-type="standard"></div>
<!-- 				<img src="../resources/img/btn_google_signin_dark_normal_web.png"/> -->
<a href="#" onclick="signOut();">Sign out</a>
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

<script type="text/javascript">
	$("#loginBtn").click(function(){
		  $("#login_form").submit();
	});
	
	$(document).ready(function(){
       <% if (request.getAttribute("result") != null && (int)request.getAttribute("result") == 0) { %>
       		alert("사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.");
       <% } %>
    });
	
	// auth2 is initialized with gapi.auth2.init() and a user is signed in.

// 	if (auth2.isSignedIn.get()) {
// 	  var profile = auth2.currentUser.get().getBasicProfile();
// 	  console.log('ID: ' + profile.getId());
// 	  console.log('Full Name: ' + profile.getName());
// 	  console.log('Given Name: ' + profile.getGivenName());
// 	  console.log('Family Name: ' + profile.getFamilyName());
// 	  console.log('Image URL: ' + profile.getImageUrl());
// 	  console.log('Email: ' + profile.getEmail());
// 	}
// function onSignIn(googleUser) {
// 	console.log(1);
// 	console.log(googleUser);
// 	  var profile = googleUser.getBasicProfile();
// 	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
// 	  console.log('Name: ' + profile.getName());
// 	  console.log('Image URL: ' + profile.getImageUrl());
// 	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
// 	}
// 	function signOut() {
// 		var auth2 = gapi.auth2.getAuthInstance();
// 		auth2.signOut().then(function() {
// 			console.log('User signed out.');
// 		});
// 	}
</script>
<%@ include file="../include/footer.jsp"%>