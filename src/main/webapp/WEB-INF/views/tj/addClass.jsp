<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    



		<div class="box box-primary">
<div class="box-header with-border">
<h3 class="box-title">클래스 등록</h3>
</div>

<!-- 오프라인 폼 -->
<form role="form" id="offline">
<div class="box-body">
<div class="form-group">
<label for="exampleInputEmail1">오프라인</label>
<input type="radio" class="form-control" id="exampleInputEmail1" name="way" value="on">
<label for="exampleInputEmail1">온라인</label>
<input type="radio" class="form-control" id="exampleInputEmail1" name="way" value="off">
</div>
<div class="form-group">
<label for="exampleInputPassword1">클래스명(필수)</label>
<input type="text" class="form-control" id="exampleInputPassword1" 
placeholder="클래스명을 입력하세요." name="c_name">
</div>
<div class="form-group">
<label for="exampleInputPassword1">카테고리(필수)</label>
<select class="form-control" id="exampleInputPassword1" name="c_category">
	<option>카테고리를 선택하세요.</option>
	<option>펫 푸드</option>
	<option>펫 훈련</option>
	<option>펫 에티켓</option>
	<option>펫 액세서리</option>
	<option>펫 미용</option>
</select>
</div>

<div class="form-group">
<label for="exampleInputFile">대표 이미지</label>
<input type="file" id="exampleInputFile" name="c_img">
</div>
<div class="form-group">
<label for="exampleInputFile">클래스 이미지</label>
<input type="file" id="exampleInputFile" name="c_img">
</div>

<div class="form-group">
<label for="exampleInputPassword1">상세내용(필수)</label>
<textarea class="form-control" id="exampleInputPassword1" name="c_content" placeholder="내용을 입력해주세요."></textarea>
</div>
<div class="checkbox">
<label>
<input type="radio" name="c_level" value="3">상
<input type="radio" name="c_level" value="2">중
<input type="radio" name="c_level" value="1">하
</label>
</div>
<div class="form-group">
<label for="exampleInputPassword1">소요시간</label>
<input type="text" class="form-control" id="exampleInputPassword1" placeholder="시간을 입력하세요." name="c_time">
</div>

<div class="form-group">
                     <label for="addr_num">주소</label>
                     <div class="group">
                     <input type="text" id="postcode" name="postcode" placeholder="우편번호" />
                     <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
                     </div>
                 <!--     <label for="addr">주소</label> -->
                     <input type="text" id="address" name="c_addr1" placeholder="주소"/><br>
                    <!--  <label for="addr_detail">상세주소</label> -->
                    <div class="group">
                     <input type="text" id="detailAddress" name="c_addrdetails" placeholder="상세주소" />
                    </div>
                  </div>

<div class="form-group">
<label for="exampleInputPassword1">강사소개</label>
<input type="text" class="form-control" id="exampleInputPassword1" placeholder="시간을 입력하세요." name="c_time">
</div>

<div class="form-group">
<label for="exampleInputPassword1">금액(필수)</label>
<input type="text" class="form-control" id="exampleInputPassword1" placeholder="금액을 입력하세요." name="c_price">
</div>
</div>

<div class="form-group">
<label for="exampleInputPassword1">클래스 참여가능 인원(필수)</label>
<input type="number" class="form-control" id="exampleInputPassword1" min="1" max="30" name="c_maxperson">
</div>

<div class="box-footer">
<button type="submit" class="btn btn-primary">등록하기</button>
</div>
</form>
<!-- 오프라인 폼 -->

<!-- 온라인 폼 -->
<form role="form" style="display: none;" id="online">
<div class="box-body">
<div class="form-group">
<label for="exampleInputEmail1">오프라인</label>
<input type="radio" class="form-control" id="exampleInputEmail1" name="way" value="off">
<label for="exampleInputEmail1">온라인</label>
<input type="radio" class="form-control" id="exampleInputEmail1" name="way" value="on">
</div>
<div class="form-group">
<label for="exampleInputPassword1">클래스명(필수)</label>
<input type="text" class="form-control" id="exampleInputPassword1" 
placeholder="클래스명을 입력하세요." name="c_name">
</div>
<div class="form-group">
<label for="exampleInputPassword1">카테고리(필수)</label>
<select class="form-control" id="exampleInputPassword1" name="c_category">
	<option>카테고리를 선택하세요.</option>
	<option>펫 푸드</option>
	<option>펫 훈련</option>
	<option>펫 에티켓</option>
	<option>펫 액세서리</option>
	<option>펫 미용</option>
</select>
</div>

<div class="form-group">
<label for="exampleInputFile">대표 이미지</label>
<input type="file" id="exampleInputFile" name="c_img">
</div>
<div class="form-group">
<label for="exampleInputFile">클래스 이미지</label>
<input type="file" id="exampleInputFile" name="c_img">
</div>

<div class="form-group">
<label for="exampleInputPassword1">상세내용(필수)</label>
<textarea class="form-control" id="exampleInputPassword1" name="c_content" placeholder="내용을 입력해주세요."></textarea>
</div>
<div class="checkbox">
<label>
<input type="radio" name="c_level" value="3">상
<input type="radio" name="c_level" value="2">중
<input type="radio" name="c_level" value="1">하
</label>
</div>
<div class="form-group">
<label for="exampleInputPassword1">소요시간</label>
<input type="text" class="form-control" id="exampleInputPassword1" placeholder="시간을 입력하세요." name="c_time">
</div>

<div class="form-group">
                     <label for="addr_num">주소</label>
                     <div class="group">
                     <input type="text" id="postcode" name="postcode" placeholder="우편번호" />
                     <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
                     </div>
                 <!--     <label for="addr">주소</label> -->
                     <input type="text" id="address" name="c_addr1" placeholder="주소"/><br>
                    <!--  <label for="addr_detail">상세주소</label> -->
                    <div class="group">
                     <input type="text" id="detailAddress" name="c_addrdetails" placeholder="상세주소" />
                    </div>
                  </div>

<div class="form-group">
<label for="exampleInputPassword1">강사소개</label>
<input type="text" class="form-control" id="exampleInputPassword1" placeholder="시간을 입력하세요." name="c_time">
</div>

<div class="form-group">
<label for="exampleInputPassword1">금액(필수)</label>
<input type="text" class="form-control" id="exampleInputPassword1" placeholder="금액을 입력하세요." name="c_price">
</div>
</div>

<div class="form-group">
<label for="exampleInputPassword1">클래스 참여가능 인원(필수)</label>
<input type="number" class="form-control" id="exampleInputPassword1" min="1" max="30" name="c_maxperson">
</div>

<div class="box-footer">
<button type="submit" class="btn btn-primary">등록하기</button>
</div>
</form>
<!-- 온라인 폼 -->

</div>





<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                //변경불가능하게 만들기
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("input[name=detailAddress]").focus(); 
            }
        }).open();
    }
</script>

<script type="text/javascript">
	$(document).ready(function() {
// 	  $('input[name=way]').on('click', function() {
// 	    alert($(this).val());
// 	  });
var a = $(this).val();

alert('d222222');
$('input[name=way]').click(function(){
	if(a == 'on'){
		
	}
});


	});

	
</script>

<%@ include file="../include/footer.jsp" %> 