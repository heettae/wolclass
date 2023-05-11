<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header  -->
<%@ include file="../include/header.jsp"%>
<!-- header  -->

<style type="text/css">
.btn-detail {
	font-weight: bold;
	font-size: 15px;
	border-radius: 6px;
	width: 150px;
	height: 45px;
	background: #C9BA9B;
}

.btn-detail:active {
	border: 3px gray inset;
	background: #A58C59;
	color: white;
}

.board_detail_container {
	border: black solid 1px;
	margin: auto;
	width: 85%;
}

.detail_container {
	margin-top: 30px;
}

table {
	border: 1px black solid;
	text-align: center;
	margin: auto;
	width: 80%;
	background: #c2c2c2;
	color: white;
}

td {
	border: 1px solid black;
}

textarea {
	width: 100%;
	height: 30%;
	min-height: 250px;
}

/* 댓글 css  */
.detail_comment_write {
	display: flex;
	width: 100%;
}

.comment_write {
	border: 1px #ddd solid;
	width: 80%;
	border-radius: 6px;
	height: 37px;
	margin: 30px auto;
}

.input_btn1 {
	border-radius: 6px;
	height: 35px;
	width: 80px;
	background: #FDC600;
	color: white;
	font-size: 15px;
}
.input_btn {
	border-radius: 6px;
	height: 30px;
	width: 80px;
	background: #FDC600;
	color: white;
	font-size: 15px;
}

.input_btn:hover {
	background: #c2c2c2;
	transition: all 1s ease;
}

.detail_comment_list {
	margin: auto;
	width: 80%;
	border: 1px #ddd solid;
	margin-bottom: 50px;
}

.comment {
	display: flex;
}

/* 댓글 css  */
</style>



<!-- body  -->
<div style="margin: 45px 0;">
	<div style="padding-left: 20px; position: relative;">
		<hr style="width: 8%; position: absolute;">
		<h1 style="margin-left: 10%; line-height: inherit;">문의관리</h1>
	</div>
</div>



<div
	style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">

				<!-- content  -->

				<div
					style="display: block; width: 80%; border: solid 1px gray; padding: 55px; border-radius: 5px; margin: auto;">
					<!-- detail_header  -->
					<div style="display: flex; padding-bottom: 30px; margin-left: 13%;"
						class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">문의 답신</h3>
						</div>
					</div>
					<!-- detail_header  -->
					<div class="board_detail_container">
					<form id="board">
						<div class="detail_container">
							<table>
								<tr>
									<td>글 제목</td>
									<td><input type="text" name="b_title" placeholder="글 제목을 입력해주세요."></td>
									<td>받는사람</td>
									<td><input type="text" name="b_reciver" readonly="readonly" value="${boardVO.b_writer}"></td>
								</tr>
								<tr>
										<td colspan="4"><textarea maxlength="1000"
												name="b_content" style="border: none; padding: 5px 20px;" placeholder="내용을 입력해주세요."></textarea></td>
								</tr>
							</table>
						</div>



						<!-- button   -->
						<div>
							<div class="button_container"
								style="display: flex; margin: 30px 0 30px; justify-content: space-around;">
								<div>
									<input type="button" id="returnMsg" class="btn-detail" value="답신하기">
								</div>
								<div>
									<input type="button" id="backMsgDetail" class="btn-detail" value="목록으로">
								</div>
							</div>
						</div>
						<!-- button   -->
						</form>
						
					</div>
				</div>
			</div>
			<!-- content  -->
		</div>
	</div>
	</div>
						<script type="text/javascript">
						$(document).ready(function(){
					    	 var formObj = $("#board");
					    	 // alert(formObj);
					    	 console.log(formObj);
					    	 
					    	 
					    	// 답신
							  $("#returnMsg").click(function(){
								  formObj.attr("action","/admin/writeMsg");
								  // 폼태그 이동방식 설정 POST
								  formObj.attr("method","post");
								  // 폼태그 정보 저장해서 페이지 이동
								  formObj.submit();			  
							  });
					    	
							// 취소하기
							  $("#backMsgDetail").click(function(){
								    alert("답신취소!");
								 	return location.href="/admin/readMsg?b_no=${boardVO.b_no}"; 
							  });
						});
							
						</script>
<!-- body  -->




<!-- footer  -->
<%@ include file="../include/footer.jsp"%>
<!-- footer  -->