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
		<h1 style="margin-left: 10%; line-height: inherit;">커뮤니티 - 글 조회</h1>
	</div>
</div>



<div
	style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">

				<!-- content  -->

				<div
					style="display: block; width: 80%; padding: 55px; border-radius: 5px; margin: auto;">
					<!-- detail_header  -->
					<div style="display: flex; padding-bottom: 30px; margin-left: 13%;"
						class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글 조회</h3>
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
									<td>작성자</td>
									<td><input value="${boardVO.b_writer}"	readonly="readonly"></td>
								</tr>
								<tr>
									<td>카테고리</td>
									<td colspan="3"><input value="${boardVO.b_category}" readonly="readonly"></td>
									<td>작성일</td>
									<td><input value="${boardVO.b_regdate.toString().split(' ')[0]}"
										readonly="readonly"></td>
								</tr>
								<tr>
										<td colspan="6"><textarea maxlength="1000"
										readonly="readonly"	name="b_content" style="border: none;">${boardVO.b_content}</textarea></td>
								</tr>
							</table>
						</div>



						<!-- button   -->
						<div>
							<div class="button_container"
								style="display: flex; margin: 30px 0 30px; justify-content: space-around;">
								<%-- <div>
									<input type="button" id="${boardVO.b_no}" class="btn-detail delete" value="삭제하기">
								</div> --%>
								<div>
									<input type="button" id="backBoardList" class="btn-detail" value="목록으로">
								</div>
							</div>
						</div>
						<!-- button   -->
						<hr style="width: 80%; margin: 50px auto;">
	
							<div class="detail_comment_list">
								<div class="comment_list">
									<c:if test="${replyVOList != null && replyVOList.size() > 0}">
										<c:forEach var="comment" items="${replyVOList }">
											<div style=" border: 1px solid; padding: 5px 20px 5px 5px; height: 100px; display:flex ;justify-content: space-between;">
												<div style="width: 15%; text-align: center; border-right: #ddd 1px double;">
													<div>
													<p style="padding-top: 1rem;">작성자 ID</p>
													</div>
													<input name="m_id" style="text-align: center;" type="text"
														readonly="readonly" value="${comment.m_id}">
												</div>
												<div style="width: 65%;">
													<div style="height: 80%;">
														<input id="content_${comment.r_no}" type="text" readonly="readonly"
															value="${comment.r_content }">
													</div>
													<input style="height: 20%; padding-left: 50%;" type="text"
														readonly="readonly"
														value="작성일 : ${comment.r_regdate.toString().split(' ')[0]}">
												</div>
												<div
													style="list-style: none; padding: 5px; margin: 0; display: flex; flex-direction: column; justify-content: space-around;">
														<div class="input_btn" id="commentDelete">
															<input id="${comment.r_no}" type="button" class="input_btn comdel" value="삭제">
														</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
								<!-- 페이징처리  -->
								<div class="box-footer clearfix pagination" style="margin: auto; width: 100%;">
									<div style="display: flex; justify-content: center;">
											<ul>
												<c:if test="${amap.startPage > amap.pageBlock }">
												<li><a id="prev" href="/admin/readBoard?pageNum=${amap.startPage-1}&b_no=${amap.b_no}">«</a></li>
												</c:if>
												<c:forEach var="i" begin="${amap.startPage }" end="${amap.endPage }">
												<li><a class="pageNumbers" href="/admin/readBoard?pageNum=${i}&b_no=${amap.b_no}">${i}</a></li>
												</c:forEach>
												<c:if test="${amap.pageCount > amap.endPage }">
												<li><a id="next" href="/admin/readBoard?pageNum=${amap.endPage+1}&b_no=${amap.b_no}">»</a></li>
												</c:if>
											</ul>
									</div>
								</div>
								<!-- 페이징처리  -->
							</div>
					</div>
				</div>
			</div>
			<!-- content  -->
		</div>
	</div>
	</div>
						<script type="text/javascript">
				
						$(document).ready(function(){
							
							// 목록으로
							  $("#backBoardList").click(function(){
								 	location.href='/admin/boardList';		  
							  });
					    	
							/* // 글삭제하기
							 $(".delete").click(function(){
								 if(confirm("게시물을 삭제 하시겠습니까?")){
								 var b_no = $(this).attr('id');
								 $.ajax({
									  url: '/admin/deleteBoard',
									  method: 'post',
									  data: {b_no:b_no},
									  success: function(response) {
									    // 요청이 성공한 경우 처리할 로직
									    setTimeout(function(){
									   		location.reload();
									    },50);
									  },
									  error: function(xhr, status, error) {
									    // 요청이 실패한 경우 처리할 로직
									    console.log('게시물 삭제 실패 하였습니다.');
									  }
									});
								 }
							 });   */
							// 삭제는되는데 오류메세지가 떠서 이동이 안됨
							
							  
							
							// 댓글삭제
							$(".comdel").click(function(){
								var rno = $(this).attr('id');
									if(confirm("정말로 삭제하시겠습니까?")){
							     		$.ajax({
												  url: '/admin/deleteReply',
												  method: 'post',
												  data: {r_no:rno},
												  success: function(response) {
											      // 요청이 성공한 경우 처리할 로직
													  setTimeout(function(){
													   		location.reload();
													    },50);
													  },
												  error: function(xhr, status, error) {
									              // 요청이 실패한 경우 처리할 로직
										          console.log('댓글 삭제 실패');
										        }
											});
											
										}
								 
								});
							});
						
						
							
						</script>
<!-- body  -->




<!-- footer  -->
<%@ include file="../include/footer.jsp"%>
<!-- footer  -->