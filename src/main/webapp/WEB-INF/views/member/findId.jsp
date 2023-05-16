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
	<div style="min-height: 600px; height: auto;">
		<div class="box-for overflow" style="width: max-content; margin: auto; min-width: 500px; margin-top: 50px;">
			<div class="col-md-12 col-xs-12 login-blocks">
				<div style="text-align: center;">
	               	<h2>아이디 찾기</h2>
	           	</div>
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
</div>

<script type="text/javascript">
	// 아이디 찾기(암호화) - 다빈
	$(document).ready(function() {
		$("#findIdBtn").click(function() {
			$.ajax({
				url: "/member/findId",
				type: "POST",
				data: $("#findIdForm").serialize(),
				dataType: "json",
				success: function(data) {
					if (data.check == 0) {
					    var id = data.id;
					    var len = id.length;
					    var visible = id.charAt(0) + id.substring(1, len-1).replace(/./g, "*") + id.charAt(len-1);
					    var randomIndexes = [];
					    while (randomIndexes.length < 4) {
					        var index = Math.floor(Math.random() * (len - 2)) + 1;
					        if (!randomIndexes.includes(index)) {
					            randomIndexes.push(index);
					        }
					    }
					    for (var i = 0; i < randomIndexes.length; i++) {
					        visible = visible.substring(0, randomIndexes[i]) + id.charAt(randomIndexes[i]) + visible.substring(randomIndexes[i]+1, len);
					    }
					    $("#findIdModal .modal-body").html("<h2>귀하의 아이디는</h2><h1>" + visible + "</h1>");
					} else {
					    $("#findIdModal .modal-body").html("<h2>일치하는 정보가 존재하지 않습니다.</h2>");
					}
					$("#findIdModal").modal("show");
				},
				error: function(xhr, status, error) {
					console.log(error);
				}
			});
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
        <div class="modal-body">
	      <div class="col-md-6" style="position: absolute; display: contents;">
			<div class="box-for overflow" >
			</div>
		  </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal 내용 -->













<%@ include file="../include/footer.jsp"%>