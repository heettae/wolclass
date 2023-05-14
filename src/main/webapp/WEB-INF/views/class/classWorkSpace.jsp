<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
#wrapper {
  display: flex;
}

#sidebar {
  flex-basis: 20%;
  border-right: 1px solid #ccc; /* 세로선 추가 */
  position: relative;
  z-index: 1;
  height: auto;
  min-height: 750px;
}


#content {
  flex-basis: 80%;
  margin-left: 20px;
}

/* 리스트 스타일링 */
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    font-size: 20px;
}

li {
    float: left;
}

li a {
    display: block;
    color: #000;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

#sidebar li a:hover {
    background-color: #ddd;
}

/* 시간 등록 버튼 */
.time-register-btn {
  background-color: #FDC600;
  color: #fff;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  padding: 10px 20px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.time-register-btn:hover {
  background-color: #E05105;
}

/* 시간 등록 버튼 */

/* 시간 등록 모달 */
.modal {
  display: none; /* 모달 창 숨김 */
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.4);
}

.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 50%;
  height: 50%;
  box-sizing: border-box;
  border-radius: 5px;
  transform: translate(-50%, -50%);
  position: absolute;
  left: 50%;
  top: 50%;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

/* 시간 등록 모달 */

/* 클래스 등록하기 박스 */
.register-box {
    width: 300px;
    height: 300px;
    background-color: #ffffff;
    border: 1px solid #dcdcdc;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    margin-left: 30px;
    margin-top: 30px;
    
  }
  
  .register-box:hover {
    background-color: #f5f5f5;
  }
  
  .register-box .register-icon {
    font-size: 48px;
    color: #3c3c3c;
    margin-bottom: 16px;
  }
  
  .register-box .register-text {
    font-size: 24px;
    color: #3c3c3c;
    text-align: center;
  }
/* 클래스 등록하기 박스 */


</style>

<div id="wrapper">
  <div id="sidebar">
    <h3 style="text-align: center;">클래스 워크스페이스</h3>
    <ul style="display: flex; flex-direction: column;">
	  <li style="margin-bottom: 10px;"><a href="/class/addClass" style="font-size: 18px;">클래스 등록</a></li>
	  <li style="margin-bottom: 10px;"><a href="#" style="font-size: 18px;">등록 완료 클래스</a></li>
	</ul>
  </div>
  <div id="content">
  <div class="row">
		  <div class="proerty-th">
		  <c:if test="${not empty registerList }">
  <c:forEach items="${registerList}" var="vo">
    <div class="col-sm-6 col-md-3 p0">
      <div class="box-two proerty-item">
        <div class="item-thumb">
          <a href="#"><img src="/resources/img/${vo.c_img.split(',')[0] }"></a>
        </div>
        <div class="item-entry overflow">
          <h4><a href="/class/detail?c_no=${vo.c_no}">${vo.c_name}</a></h4>
          <span class="pull-left"><b>${vo.c_addr1}</b> </span><br>
          <span class="proerty-price pull-left">
            <fmt:formatNumber value="${vo.c_price}"/> 원
          </span> 
          <span class="pull-right">
            <button class="time-register-btn" data-c-no="${vo.c_no}" data-c-maxperson="${vo.c_maxperson}">시간 등록</button>
          </span>  
        </div>
        <input type="hidden" name="c_no" value="${vo.c_no }">
        <input type="hidden" name="c_maxperson" value="${vo.c_maxperson}">
      </div>
    </div>
  </c:forEach>
</c:if>

		    
		    <!-- 등록하기 박스 -->
<%-- 		    <c:if test="${empty registerList }"> --%>
			<div class="col-sm-6 col-md-3 p0">
				<div class="register-box">
				  <div class="register-icon">+</div>
				  <div class="register-text"><h3> 클래스 등록하기 </h3></div>
				</div>
			</div>
<%-- 		    </c:if> --%>
		    <!-- 등록하기 박스 -->
		    
		    
		  </div>
		</div>
		<!-- 모달 창 -->
						<div id="modal" class="modal">
						  <div class="modal-content">
						    <span class="close" onclick="closeModal()">&times;</span>
						    <h2>시간 등록</h2>
						    <form id="timeForm" method="post">
						      <input type="hidden" name="c_no">
						      <input type="hidden" name="t_rem_p">
						      <div class="form-group">
						        <label for="date">날짜</label>
						        <input type="date" id="date" name="t_date" min="<?php echo date('Y-m-d'); ?>">
						      </div>
						      <div class="form-group">
						        <label for="start-time">시작 시간</label>
						        <input type="time" id="start-time" name="t_start">
						      </div>
						      <div class="form-group">
						        <label for="end-time">끝나는 시간</label>
						        <input type="time" id="end-time" name="t_end">
						      </div>
						      <button type="button" class="btn btn-primary" id="addTime">등록</button>
						    </form>
						  </div>
						</div>
  </div>
  
</div>
<script type="text/javascript">

$(document).ready(function() {
	  $(".time-register-btn").click(function() {
	    var cNo = $(this).data('c-no');
	    var cMaxperson = $(this).data('c-maxperson');
	    console.log(cNo);
	    console.log(cMaxperson);
	    $("#timeForm input[name='c_no']").val(cNo);
	    $("#timeForm input[name='t_rem_p']").val(cMaxperson);
	    openModal();
	  });
	});

// 시간 등록 모달	
function openModal() {
  document.getElementById("modal").style.display = "block";
}

function closeModal() {
  document.getElementById("modal").style.display = "none";
}
// 시간 등록 모달	

// 오늘 날짜 전 미출력
var today = new Date().toISOString().split('T')[0];
document.getElementsByName("t_date")[0].setAttribute('min', today);
// 오늘 날짜 전 미출력

$(document).ready(function(){
	
	
		$('#addTime').click(function(){
			$.ajax({
				type : 'POST',
				url : '/class/addTime',
				data : $('#timeForm').serialize(),
				success : function(result){
					if(result == 1){
						alert('시간이 등록되었습니다.');
						location.reload();
					}else{
						alert('이미 등록된 시간과 겹칩니다. 다시 시간을 선택해주세요.');
					}
				},
				error : function(){
					alert('등록 실패');
				}
			});
		});
	
	$('.register-box').click(function(){
		location.href="/class/addClass";
	});
});


</script>


<%@ include file="../include/footer.jsp" %>
    