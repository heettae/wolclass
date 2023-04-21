<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="col-md-6" style="position: absolute; display: contents;">
                    <div class="box-for overflow">
                        <div class="col-md-12 col-xs-12 register-blocks">
                            <h2>회원가입 </h2> 
                            <form id="join_form" method="post" enctype="multipart/form-data"> 
                                <div class="form-group">
                                    <label for="m_id">아이디</label> <span style="color: red">(필수)</span> 
                                    <input type="text" class="form-control" id="m_id" name="m_id" required
                                      placeholder="아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)">
                                      <div><font id="id_feedback" size="2"></font></div>
                                </div>
								
                                <div class="form-group">
                                    <label for="m_pw">비밀번호</label>  <span style="color: red">(필수)</span>
                                    <input type="password" class="form-control" id="m_pw" name="m_pw" required
                                    placeholder="비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)">
                                </div>
                                <div class="form-group">
                                    <label for="m_pw2">비밀번호 확인</label> 
                                    <input type="password" class="form-control" id="m_pw2" name="m_pw2"
                                    placeholder="비밀번호를 다시 입력하세요.">
                                    <div><font id="checkPw" size="2"></font></div>
                                </div>
                                <div class="form-group">
                                    <label for="m_email">이메일</label>  <span style="color: red">(필수)</span>
                                    <input type="text" class="form-control" id="m_email" name="m_email" required>
                                    <button class="btn btn-warning" id="email_auth_btn">인증번호 전송</button>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="email_auth_key"  placeholder="인증번호 입력">
                                </div>
                                  <div class="form-group">
                                    <label for="m_name">이름</label>  <span style="color: red">(필수)</span>
                                    <input type="text" class="form-control" id="m_name" name="m_name"
                                    placeholder="이름을 입력하세요.">
                                </div>
                                  <div class="form-group">
                                    <label for="m_nick">닉네임</label>  <span>(선택)</span>
                                    <input type="text" class="form-control" id="m_nick" name="m_nick"
                                     placeholder="닉네임을 입력하세요.">
                                </div>
                                  <div class="form-group">
                                    <label for="m_phone">전화번호</label>  <span style="color: red">(필수)</span>
                                    <input type="text" class="form-control" id="m_phone" name="m_phone" required
                                     oninput="hypenTel(this)" maxlength="13" placeholder="전화번호를 입력하세요">
                                </div>
                                  <div class="form-group">
                                    <label for="m_dogtype">반려견 종류</label>   <span>(선택)</span>
                                    <input type="radio" class="form-control" id="m_dogtype" name="m_dogtype" value="대형">대형
                                    <input type="radio" class="form-control" id="m_dogtype" name="m_dogtype" value="중형">중형
                                    <input type="radio" class="form-control" id="m_dogtype" name="m_dogtype" value="소형">소형
                                </div>
                                  <div class="form-group">
                                    <label for="m_dogbirth">반려견 생일</label>  <span>(선택)</span>
                                    <input type="date" class="form-control" id="m_dogbirth" name="m_dogbirth">
                                </div>
                                  <div class="form-group">
                                    <label for="m_profile">프로필 사진</label>  <span>(선택)</span>
                                    <input type="file" class="form-control" id="m_profile" name="m_profile">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-default">회원가입</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"/>         -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
// 전화번호 - 자동 붙이기 - 다빈
var autoHypenPhone = function(str){
      str = str.replace(/[^0-9]/g, '');
      var tmp = '';
      if( str.length < 4){
          return str;
      }else if(str.length < 7){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3);
          return tmp;
      }else if(str.length < 11){
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 3);
          tmp += '-';
          tmp += str.substr(6);
          return tmp;
      }else{              
          tmp += str.substr(0, 3);
          tmp += '-';
          tmp += str.substr(3, 4);
          tmp += '-';
          tmp += str.substr(7);
          return tmp;
      }
      return str;
}


var phoneNum = document.getElementById('m_phone');

phoneNum.onkeyup = function(){
  console.log(this.value);
  this.value = autoHypenPhone( this.value ) ;  
}

$(document).ready(function(){
	// 회원가입 버튼(기능) - 다빈
	$(".btn-default").click(function(){
		$("#join_form").submit();
	});
	
	$(".btn-warning").click(function(){
		var email = $('#m_email').val();
		$.ajax({
			type : "GET",
			url : "mailCheck?email="+email
		});
	});
	
});

// 아이디 중복검사 - 다빈
$('#m_id').on('input',function(){
	let m_id = $("#m_id").val();
	
	$.ajax({
		url : "/db/memberIdChk",
		type : "post",
		data : {m_id : m_id},
		dataType : 'json',
		success : function(result){
			if(result == 1){
				$("#id_feedback").html('이미 사용중인 아이디입니다.');
				$("#id_feedback").css('color','#dc3545');
			} else {
				$("#id_feedback").html('사용할 수 있는 아이디입니다.');
				$("#id_feedback").css('color','#2fb380');
			}
		},
		error : function(){
			alert("서버요청실패");
		}
	});
});

// 비밀버호 재확인 - 다빈
$("input[type ='password']").keyup(function(){
	let pass1 = $("#m_pw").val();
	let pass2 = $("#m_pw2").val();
	
	if(pass1 != "" && pass2 != ""){
		if(pass1 == pass2){
			$("#checkPw").html('일치');
			$("#checkPw").attr('color','green');
		}else {
			$("#checkPw").html('불일치');
			$("#checkPw").attr('color','red');
		}
	}else{
		$("#checkPw").html('');
	}
});


</script>
                
<%@ include file="../include/footer.jsp" %>