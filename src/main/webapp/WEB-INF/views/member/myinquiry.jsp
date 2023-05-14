<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

	<div class="col-md-6" style="position: absolute; display: contents;" >
		<div style="min-height: 600px; height: auto;">
			<div class="box-for overflow" style="width: max-content; margin: auto; min-width: 500px; margin-top: 50px;">
				<div class="col-md-12 col-xs-12 login-blocks">
					
					 <div style="text-align: center;">
			               <h2>WolClass(문의)</h2>
		             </div> 
					<form method="post" id="qna_form">
						
						<input type="hidden" value="${sessionScope.id }" name="b_writer">
						
						<div class="form-group">
							<label for="b_title">글 제목</label> <input type="text"
								class="form-control" id="b_title" name="b_title">
						</div>
						<div class="form-group">
							<label for="b_category">카테고리</label> 
							<select name="b_category">
								<option>카테고리를 선택하세요</option>
								<option value="일반">일반</option>
								<option value="공지사항">공지사항</option>
								<option value="모집">모집</option>
							</select>
						</div>
						<div class="form-group">
							<label for="b_reciver">받는사람</label> <input type="text"
								class="form-control" id="b_reciver" name="b_reciver" value="${vo.m_id }" readonly>
						</div>
						<div class="form-group">
							<label for="b_content">문의 내용</label><br> 
							<textarea rows="5" cols="80" name="b_content"></textarea>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-default" id="qnaBtn">문의하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
		  $('#qna_form').submit(function(event) {
		    event.preventDefault();
		    
		    $.ajax({
		      type: 'POST',
		      url: '/member/myinquiry',
		      data: $(this).serialize(),
		      success: function() {
		        alert('문의가 성공적으로 접수되었습니다.');
		        window.location.href = '/member/classList';
		      },
		      error: function() {
		        alert('문의 접수에 실패했습니다.');
		      }
		    });
		  });
		});
	</script>

<%@ include file="../include/footer.jsp" %>