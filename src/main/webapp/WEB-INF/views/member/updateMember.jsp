<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/side.jsp" %>

			<div class="col-md-6" style="position: absolute; display: contents;">
                    <div class="box-for overflow" style="width: max-content; margin: auto; min-width: 500px">
                        <div class="col-md-12 col-xs-12 register-blocks">
                            <div style="text-align: center;">
	                            <h2>회원정보 수정</h2> 
                        	</div> 
                            <form id="update_form" method="post"> 
                                    <input type="hidden" name="m_id"  value="${vo.m_id }">
                                <div class="form-group">
                                    <label for="m_pw">비밀번호</label>
                                    <input type="password" class="form-control" id="m_pw" name="m_pw" 
                                    placeholder="비밀번호를 입력하세요. (영문,숫자,특수문자 조합하여 8~16자)" maxlength="16">
                                    <span class="final_pw_ck" style="display: none">비밀번호를 입력해주세요.</span>
                					<span class="pwck_input_re_3" style="color: red; display: none">형식에 맞게 입력하시오(영문,숫자,특수문자 조합하여 8~16자)</span>
                                </div>
                                
                                <div class="form-group">
                                    <label for="m_pw2">비밀번호 확인</label> 
                                    <input type="password" class="form-control" id="m_pw2" name="m_pw2"
                                    placeholder="비밀번호를 다시 입력하세요." >
                                    <span class="final_pwck_ck" style="display: none">비밀번호 확인을 입력해주세요.</span>
                                    <span class="pwck_input_re_1" style="color: green; display: none">비밀번호가 일치합니다.</span>
                					<span class="pwck_input_re_2" style="color: red; display: none">비밀번호가 일치하지 않습니다.</span>
                                </div>
                                
                                <div class="form-group">
                                    <label for="m_nick">닉네임</label>
                                    <input type="text" class="form-control" id="m_nick" name="m_nick"
                                     placeholder="닉네임을 입력하세요." value="${vo.m_nick }">
                                </div>
                                
                                <div class="form-group">
                                    <label for="m_phone">전화번호</label>
                                    <input type="text" class="form-control" id="m_phone" name="m_phone"  value="${vo.m_phone }"
                                     oninput="hypenTel(this)" maxlength="13" placeholder="전화번호를 입력하세요">
                                     <span class="phone_input_re_1" style="color: green; display: none">사용 가능한 전화번호입니다.</span>
								     <span class="phone_input_re_2" style="color: red; display: none">전화번호가 이미 존재합니다.</span>
                                     <span class="final_phone_ck" style="display: none">전화번호를 입력해주세요.</span>
                                </div>
                                
                                <div class="form-group">
                                    <label for="m_dogtype">반려견 종류</label> 
                                    <input type="radio" class="form-control" id="m_dogtype" name="m_dogtype" value="대형"
                                    ${vo.m_dogtype eq "대형"  ?  ' checked' : '' }
                                    >대형
                                    <input type="radio" class="form-control" id="m_dogtype" name="m_dogtype" value="중형"
                                    ${vo.m_dogtype eq "중형"  ?  ' checked' : '' }
                                    >중형
                                    <input type="radio" class="form-control" id="m_dogtype" name="m_dogtype" value="소형"
                                    ${vo.m_dogtype eq "소형"  ?  ' checked' : '' }
                                    >소형
                                </div>
                                
                                <div class="form-group">
                                    <label for="m_dogbirth">반려견 생일</label>
                                    <input type="date" class="form-control" id="m_dogbirth" name="m_dogbirth" 
                                    value = "<fmt:formatDate value='${vo.m_dogbirth }' pattern='yyyy-MM-dd'/>"
                                    >
                                </div>
                                
                                <div class="text-center">
                                    <button type="submit" class="btn btn-default" style="width: 100%">회원정보 수정</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var pwCheck = false; // 비번
var pwckCheck = false; // 비번 확인
var pwckcorCheck = false; // 비번 불일치 확인
var phoneCheck = false; // 전화번호 


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
  this.value = autoHypenPhone( this.value );  
}


$(document).ready(function(){
// 	유효성 검사 통과유무 변수

    
	// 회원가입 버튼(기능) - 다빈
	$(".btn-default").click(function(){
		// 최종 유효성 검사
		var pw = $("#m_pw").val(); 			   // 비밀번호 입력란
var pwck = $("#m_pw2").val();		   // 비밀번호 확인 입력란
var phone = $("#m_phone").val();       // 전화번호 입력란
		if(pwCheck&&pwckCheck&&pwckcorCheck&&phoneCheck){
		 	$("#update_form").submit(); 
        }

		
		
		
// 		// 비밀번호 유효성검사
		if(pw == ""){
			$('.final_pw_ck').css('display','block');
			pwCheck = false;
		}else{
			$('.final_pw_ck').css('display','none');
			pwCheck = true;			
		}
// 		// 비밀번호 확인 유효성검사
		if(pwck == ""){
			$('.final_pwck_ck').css('display','block');
			pwckCheck = false;			
		}else{
			$('.final_pwck_ck').css('display','none');
			pwckCheck = true;			
		}
		// 전화번호 유효성 검사
		if(phone == ""){
			$('.final_phone_ck').css('display','block');
			phoneCheck = false;
		}else{
			$('.final_phone_ck').css('display','none');
			phoneCheck = true;
		}

	});
	
	
	
	
	
// 	전화번호 중복검사 - 다빈
	$('#m_phone').on('keyup',function(){
			var m_phone = $('#m_phone').val();
			if(m_phone.length < 13){
				return;
			}
			var data = {m_phone : m_phone}
			
			$.ajax({
				url : "/member/phoneCheck",
				type : "post",
				data : data,
				success : function(result){
					if(result != 'fail'){
						$('.phone_input_re_1').css("display","inline-block");
						$('.phone_input_re_2').css("display", "none");		
						phoneCheck = true;
					} else {
						$('.phone_input_re_2').css("display","inline-block");
						$('.phone_input_re_1').css("display", "none");
						phoneCheck = false;
					}
				}
			});
	});


	// 비밀버호 재확인 - 다빈
	$("#m_pw2").on('input',function(){
		var pw = $("#m_pw").val();
		var pwck = $("#m_pw2").val();
		var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;
		$('.final_pwck_ck').css('display','none');
		
		if(!pwRegex.test(pw)){
			$('.pwck_input_re_3').css("display","inline-block");
			pwCheck = false;
		}else {
			$('.pwck_input_re_3').css("display","none");
			pwCheck = true;
		}
		
		if(pw == pwck){
			$('.pwck_input_re_1').css('display','block');
			$('.pwck_input_re_2').css('display','none');
			pwckcorCheck = true;
		}else{
			$('.pwck_input_re_1').css('display','none');
			$('.pwck_input_re_2').css('display','block');
			pwckcorCheck = false;
		}
	});
});
</script>

<!-- side.jsp -->
</div>
</section>
<!-- side.jsp -->
                
<%@ include file="../include/footer.jsp" %>