<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="col-md-6" style="position: absolute; display: contents;" >
	<div style="min-height: 600px; height: auto;">
		<div class="box-for overflow" style="width: max-content; margin: auto; min-width: 500px; margin-top: 50px;">
			<div class="col-md-12 col-xs-12 login-blocks">
				
				 <div style="text-align: center;">
		               <h2>WolClass(Login)</h2>
	             </div> 
				<form method="post" id="login_form">
					<div class="form-group">
						<label for="m_id">아이디</label> <input type="text"
							class="form-control" id="m_id" name="m_id">
					</div>
					<div class="form-group">
						<label for="m_pw">비밀번호</label> <input type="password"
							class="form-control" id="m_pw" name="m_pw">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-default" id="loginBtn">로그인</button>
					</div>
				</form>
				<div class="text-center">
					<a href="/member/findId" style="color: black;">아이디 찾기</a>/<a
						href="/member/findPw" style="color: black;">비밀번호 찾기</a>/<a
						href="/member/join" style="margin-left: 3px; color: black;">회원가입</a>
				</div>
	
				<br>
				
				<p style=" display: flex; justify-content: center;">
					<!-- 카카오 로그인 -->
					<a
						href="https://kauth.kakao.com/oauth/authorize?client_id=c6c8f231f2997186bfd65955c7b8f1ab&redirect_uri=http://localhost:8080/member/kakao&response_type=code">
						<img src="../resources/img/kakao_login_btn.png" width="190px"/>
					</a>
					<!-- 카카오 로그인 -->
					<!-- 네이버 -->
						<div id="naverIdLogin" style="width: 190px; margin: 0 auto;"></div>
					<!-- 네이버 -->
				</p>
			</div>
		</div>
	</div>
</div>
<!-- 네이버 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- 네이버 -->
<script type="text/javascript">
	$("#loginBtn").click(function(){
		  $("#login_form").submit();
	});
	
	$(document).ready(function(){
       <% if (request.getAttribute("result") != null && (int)request.getAttribute("result") == 0) { %>
       		alert("사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.");
       <% } %>
    });
	
	// 네이버
	var naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "eGvYqWZMB4smx8mntk57",
              // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
            callbackUrl: "http://localhost:8080/member/callback",
              // 본인의 callBack url로 수정하세요.
            isPopup: false,
            loginButton: {color: "green", type: 3, height: 60}
        }
    );
	naverLogin.init();
	// 네이버
	
</script>
<%@ include file="../include/footer.jsp"%>