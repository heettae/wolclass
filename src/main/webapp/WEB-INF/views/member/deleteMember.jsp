<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/side.jsp" %>



<div class="col-md-6" style="position: absolute; display: contents;">
	<div class="box-for overflow" style="width: max-content; margin: auto; min-width: 400px;">
		<div class="col-md-12 col-xs-12 login-blocks">
			 <div style="text-align: center;">
	               <h2>회원탈퇴</h2>
             </div> 
			<form method="post" id="deleteMember_form">
				<div class="form-group">
					<label for="m_pw">비밀번호</label> <input type="password"
						class="form-control" id="m_pw" name="m_pw">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-default" id="loginBtn">회원탈퇴</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
// 	$(".btn-default").click(function(){
// 		  $("#deleteMember_form").submit();
// 	});
	$(document).ready(function() {
		  $('#deleteMember_form').submit(function(event) {
		    
		    event.preventDefault(); 

		    var password = $('#m_pw').val();
		    $.ajax({
		      url: '/member/deleteMember',
		      type: 'POST',
		      data: { m_pw: password },
		      success: function(response) {
		        if (response === 'success') {
		          if (confirm('회원 탈퇴를 진행하시겠습니까?')) {
		            	$.ajax({
		            		url:'/member/CheckPW',
		            		type:'POST',
		            		success: function(data){
		            			if(data === "success"){
		            			 	$('#deleteMember_form')[0].submit();
		            			}
		            			location.href="/";
		            		}
		            	});
		          }
		        } else {
		        	alert("비밀번호 오류!");
		        }
		      },
		      error: function() {
		        alert('서버와 통신 중 오류가 발생했습니다.');
		      }
		    });
		  });
		});

</script>

<!-- side.jsp -->
</div>
</section>
<!-- side.jsp -->
                
<%@ include file="../include/footer.jsp" %>