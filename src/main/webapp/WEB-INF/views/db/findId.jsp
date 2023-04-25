<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<div class="col-mda-6">
	<div class="box-for overflow">
		<div class="col-md-12 col-xs-12 login-blocks">
			<h2>아이디 찾기</h2>
			<form id="findIdForm" method="post">
				<div class="form-group">
					<label for="m_name">이름</label>
					 <input type="text" class="form-control" id="m_name" name="m_name">
				</div>
				<div class="form-group">
					<label for="m_email">이메일</label> 
					<input type="text" class="form-control" id="m_email" name="m_email">
				</div>
				<div class="text-center">
					<button type="button" class="btn btn-default" data-toggle="modal" data-target="#findIdModal" id="findIdBtn">
					  아이디 찾기
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("#findIdBtn").click(function(){
		$.ajax({
			url: "/db/findId",
			type: "POST",
			data: {m_name : $("#m_name").val(), m_email : $("#m_email").val()},
			success: function(data) {
				if (data != null) {
					console.log(data);
				} else {
					console.log(data);
				}
			},
			error: function(xhr, status, error) {
				console.log(error);
			}
		});		
	});
</script>

<!-- Modal 내용 -->
<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class= "modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="findIdModalLabel">Wolclass</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	      <div class="col-md-6" style="position: absolute; display: contents;">
			<div class="box-for overflow" >
				<!-- 이름과 이메일이 일치하지 않을때 -->
				<c:if test="${check == 1 }">
					<h2>일치하는 정보가 존재하지 않습니다.</h2>
				</c:if>
				
				<!-- 이름과 이메일이 일치할때 -->
				<c:if test="${check == 0 }">
					<h2>귀하의 아이디는</h2>
					<h1>${id }</h1>
				</c:if>
			</div>
		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>













<%@ include file="../include/footer.jsp"%>