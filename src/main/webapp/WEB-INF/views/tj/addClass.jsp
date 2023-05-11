<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    

<style>
.iCheck-helper {
  display: none;
}

#addClassBtn:hover{
 background-color: #333;
 color: #FDC600;
}
</style>


		<div class="box box-primary" style="width: max-content; margin: auto; min-width: 500px">
<div class="box-header with-border">
<h3 class="box-title">클래스 등록</h3>
</div>

<!-- 오프라인 폼 -->
<div class="form-group">
<label for="offline">오프라인</label>
<input type="radio" class="form-control" id="offline" name="way" value="off" checked>
<label for="online">온라인</label>
<input type="radio" class="form-control" id="online" name="way" value="on">
</div>
<form role="form" id="offlineForm" enctype="multipart/form-data" method="post">
<div class="box-body">
<div class="form-group">
<label for="className">클래스명</label><span style="color: red">(필수)</span>
<input type="text" class="form-control" id="className" placeholder="클래스명을 입력하세요." name="c_name" required>
<div id="c_name_warning"></div>
</div>
<div class="form-group">
<label for="category">카테고리</label><span style="color: red">(필수)</span>
<select class="form-control" id="category" name="c_category" required>
	<option>카테고리를 선택하세요.</option>
	<option>펫 푸드</option>
	<option>펫 훈련</option>
	<option>펫 에티켓</option>
	<option>펫 액세서리</option>
	<option>펫 미용</option>
</select>
<div id="c_category_warning"></div>
</div>

<div class="form-group">
<label for="img1">대표 이미지</label><span style="color: red">(필수)</span>
<input type="file" id="img1" name="c_img1" required>
<div id="img1_warning"></div>
</div>

<div class="form-group" id="imgForm">
<label for="img2">기타 이미지</label>
<input type="button" id="img2" value="이미지 추가" onclick="addFile();">
</div>

<div class="form-group">
<label for="content">상세내용</label><span style="color: red">(필수)</span>
<textarea class="form-control" id="content" name="c_content" placeholder="내용을 입력해주세요." required></textarea>
<div id="c_content_warning"></div>
</div>
<div class="form-group">
<label for="c_level">난이도</label><span style="color: red">(필수)</span>
<input type="radio" id="c_level" name="c_level" value="3">입문
<input type="radio" id="c_level" name="c_level" value="2">초급
<input type="radio" id="c_level" name="c_level" value="1">중급
<div id="c_level_warning"></div>
</div>

<div class="form-group">
<label for="time">소요시간</label><span style="color: red">(필수)</span>
<input type="text" class="form-control" id="time" placeholder="시간을 입력하세요." name="c_time" required>
<div id="c_time_warning"></div>
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
   <input type="text" id="detailAddress" name="c_addr2" placeholder="상세주소" />
   <input type="text" id="sample6_extraAddress" name="c_addrdetails" placeholder="참고항목">
   <span class="error"></span>
  </div>
</div>

<div class="form-group">
<label for="price">금액</label><span style="color: red">(필수)</span>
<input type="text" class="form-control" id="price" placeholder="금액을 입력하세요." name="c_price" required>
<div id="c_price_warning"></div>
</div>
</div>

<div class="form-group">
<label for="maxperson">클래스 참여가능 인원</label><span style="color: red">(필수)</span>
<input type="number" class="form-control" id="maxperson" min="1" name="c_maxperson" required>
<div id="c_maxperson_warning"></div>
</div>

<div class="box-footer">
<button type="submit" class="btn btn-primary" id="addClassBtn" style="width: 100%">등록하기</button>
</div>
</form>
<!-- 오프라인 폼 -->

<!-- 온라인 폼 -->
<form role="form" id="onlineForm" enctype="multipart/form-data" method="post" style="display: none;">
<div class="box-body">
<div class="form-group">
<label for="className">클래스명</label><span style="color: red">(필수)</span>
<input type="text" class="form-control" id="className" placeholder="클래스명을 입력하세요." name="c_name" required>
<div id="c_name_warning"></div>
</div>
<div class="form-group">
<label for="category">카테고리</label><span style="color: red">(필수)</span>
<select class="form-control" id="category" name="c_category" required>
	<option>카테고리를 선택하세요.</option>
	<option>펫 푸드</option>
	<option>펫 훈련</option>
	<option>펫 에티켓</option>
	<option>펫 액세서리</option>
	<option>펫 미용</option>
</select>
<div id="c_category_warning"></div>
</div>

<div class="form-group">
<label for="img1">대표 이미지</label><span style="color: red">(필수)</span>
<input type="file" id="img1" name="c_img1" required>
<div id="img1_warning"></div>
</div>

<div class="form-group" id="imgForm">
<label for="img2">기타 이미지</label>
<input type="button" id="img2" value="이미지 추가" onclick="addFile();">
</div>

<div class="form-group">
<label for="content">상세내용</label><span style="color: red">(필수)</span>
<textarea class="form-control" id="content" name="c_content" placeholder="내용을 입력해주세요." required></textarea>
<div id="c_content_warning"></div>
</div>
<div class="form-group">
<label for="c_level">난이도</label><span style="color: red">(필수)</span>
<input type="radio" id="c_level" name="c_level" value="3">입문
<input type="radio" id="c_level" name="c_level" value="2">초급
<input type="radio" id="c_level" name="c_level" value="1">중급
<div id="c_level_warning"></div>
</div>

<div class="form-group">
<label for="time">소요시간</label><span style="color: red">(필수)</span>
<input type="text" class="form-control" id="time" placeholder="시간을 입력하세요." name="c_time" required>
<div id="c_time_warning"></div>
</div>

<div class="form-group">
<label for="price">금액</label><span style="color: red">(필수)</span>
<input type="text" class="form-control" id="price" placeholder="금액을 입력하세요." name="c_price" required>
<div id="c_price_warning"></div>
</div>
</div>

<div class="box-footer">
<button type="submit" class="btn btn-primary" id="addClassBtn" style="width: 100%">등록하기</button>
</div>
</form>
<!-- 온라인 폼 -->
</div>





<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 주소 api
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
            document.querySelector("input[name=c_addr1]").focus(); 
        }
    }).open();
}
//주소 api

// 파일 추가
var cnt = 2;
function addFile() {
	if(cnt == 5) {
		alert('4개까지 등록가능');
	}else{
	    var html = "<div class='input-file-container'>";
	    html += "<input type='file' name='c_img" + cnt + "' required>";
	    html += "<button class='delete-file-btn'>삭제</button>";
	    html += "</div>";
	    $("#imgForm").append(html);
	    cnt++;
	}
}

$(document).on("click", ".delete-file-btn", function() {
    $(this).parent().remove();
    cnt--;
    if(cnt < 2) cnt = 2;
});
// 파일 추가
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var tj = $.noConflict();
	tj(document).ready(function() {
		// iCheck-helper 클래스가 선택되었을 때 이벤트 처리
		tj('.iCheck-helper').on('click', function() {
		  // parent() 사용해서 부모 요소 div 태그 선택 후 find 사용해서 하위 input[name=way] 요소의 value값 가져오기
		  var selectedValue = tj(this).parent().find('input[name="way"]:checked').val();
		  
		  if(selectedValue == 'on'){
			  tj('#onlineForm').css('display', 'block');
			  tj('#offlineForm').css('display', 'none');
		  }else{
			  tj('#offlineForm').css('display', 'block');
			  tj('#onlineForm').css('display', 'none');
		  }
		});

var formObj = tj('form[role="form"]');
		
		
// 클래스 등록 유효성 체크
  // 클래스명 체크
  $('input[name=c_name]').on('input', function(event) {
	  var c_name = $('input[name=c_name]').val();
	  if (c_name.trim() === '') {
	    $('#c_name_warning').text('클래스명을 입력하세요.').css('color', 'red');
	    $('input[name=c_name]').val('');
	  } else {
	    $('#c_name_warning').text('').css('color', 'black');
	  }
	});
  // 클래스명 체크
	
  // 카테고리 체크
  $('select[name=c_category]').on('change', function() {
	    var c_category = $('select[name=c_category]').val();
	    if (c_category == '카테고리를 선택하세요.') {
	      $('#c_category_warning').text('카테고리를 선택하세요.').css('color', 'red');
	    } else {
	      $('#c_category_warning').text('').css('color', 'black');
	    }
	  });
  // 카테고리 체크
  
  // 상세내용 체크
   $('textarea[name=c_content]').on('blur', function() {
    var c_content = $('textarea[name=c_content]').val();
    if (c_content.trim() === '') {
      $('#c_content_warning').text('상세내용을 입력하세요.').css('color', 'red');
    } else {
      $('#c_content_warning').text('').css('color', 'black');
    }
  });
  // 상세내용 체크 
  
  // 소요시간 체크
  $('input[name=c_time]').on('input', function(){
	 var c_time = $(this).val();
	 if(c_time.trim() === ''){
		 $('#c_time_warning').text('소요시간을 입력하세요.').css('color', 'red');
	 } else {
		 $('#c_time_warning').text('').css('color','black');
	 }
  });
  // 소요시간 체크
  
  // 가격 체크
  $('input[name=c_price]').on('input', function(){
	  var c_price = $(this).val();
	 if(c_price.trim() === ''){
		 $('#c_price_warning').text('가격을 입력하세요.').css('color', 'red');
	 } else{
		 $('#c_price_warning').text('').css('color', 'black');
	 }
  });
  // 가격 체크
  
  $('input[name=c_maxperson]').on('input', function(){
	  var c_maxperson = $(this).val();
	 if(c_maxperson.trim() === ''){
		 $('#c_maxperson_warning').text('최대 인원을 선택하세요.').css('color', 'red');
	 } else{
		 $('#c_maxperson_warning').text('').css('color', 'black');
	 }
  });
  // 가격 체크
// 클래스 유효성 체크

// 클래스 등록 폼 전송
  $('#addClassBtn').click(function(){
		formObj.attr("action","/tj/addClass");
		formObj.attr("method","post");
	});
// 클래스 등록 폼 전송
});
	
</script>

<%@ include file="../include/footer.jsp" %> 