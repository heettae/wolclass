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
							<h3 class="box-title" style="font-size: x-large;">문의 조회</h3>
						</div>
					</div>
					<!-- detail_header  -->
					<div class="board_detail_container">
						<div class="detail_container">
							<input type="hidden" name="b_no" value="${boardVO.b_no}">
							<table>
								<tr>
									<td>제목</td>
									<td colspan="3"><input name="b_title" value="${boardVO.b_title}" 
									readonly="readonly"></td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input value="${boardVO.b_writer}"	readonly="readonly"></td>
									<td>작성일</td>
									<td><input value="${boardVO.b_regdate.toString().split(' ')[0]}"
										readonly="readonly"></td>
								</tr>
								<tr>
										<td colspan="6"><textarea maxlength="1000"
												name="b_content" style="border: none; padding: 5px 20px;" readonly="readonly">${boardVO.b_content}</textarea></td>
								</tr>
							</table>
						</div>



						<!-- button   -->
						<div>
							<div class="button_container"
								style="display: flex; margin: 30px 0 30px; justify-content: space-around;">
								<div>
									<input type="button" id="returnMsgWrite" class="btn-detail" value="답신하기">
								</div>
								<div>
									<input type="button" id="backMsgList" class="btn-detail" value="목록으로">
								</div>
							</div>
						</div>
						<!-- button   -->
				
						
					</div>
				</div>
			</div>
			<!-- content  -->
		</div>
	</div>
	</div>
						<script type="text/javascript">
						
						$(document).ready(function(){
					    	// 답신
							  $("#returnMsgWrite").click(function(){
								  location.href='/admin/writeMsg?b_no=${boardVO.b_no}';			  
							  });
					    	
							// 목록
							  $("#backMsgList").click(function(){
								 	location.href='/admin/msgList';		  
							  });
						});
							
						</script>
<!-- body  -->




<!-- footer  -->
<%@ include file="../include/footer.jsp"%>
<!-- footer  -->