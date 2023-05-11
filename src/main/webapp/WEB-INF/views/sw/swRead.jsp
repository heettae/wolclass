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
					style="display: block; width: 80%; border: solid 1px gray; padding: 55px; border-radius: 5px; margin: auto;">
					<!-- detail_header  -->
					<div style="display: flex; padding-bottom: 30px; margin-left: 13%;"
						class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글 조회</h3>
						</div>
					</div>
					<!-- detail_header  -->
					<div class="board_detail_container">
					<form id="board">
						<div class="detail_container">
							<input type="hidden" name="b_no" value="${resultVO.b_no}">
							<table>
								<tr>
									<td>제목</td>
									<td colspan="3"><input name="b_title" value="${resultVO.b_title}" 
									${sessionScope.id == resultVO.b_writer ? '' : 'readonly' }></td>
									<td>작성자</td>
									<td><input value="${resultVO.b_writer}"	readonly="readonly"></td>
								</tr>
								<tr>
									<td>카테고리</td>
									<td><input value="${resultVO.b_category}" readonly="readonly"></td>
									<td>조회수</td>
									<td><input value="${resultVO.b_viewcnt}"
										readonly="readonly"></td>
									<td>작성일</td>
									<td><input value="${resultVO.b_regdate.toString().split(' ')[0]}"
										readonly="readonly"></td>
								</tr>
								<tr>
										<td colspan="6"><textarea maxlength="1000"
										${sessionScope.id == resultVO.b_writer ? '' : 'readonly' }
												name="b_content" style="border: none;">${resultVO.b_content}</textarea></td>
								</tr>
							</table>
						</div>



						<!-- button   -->
						<div>
							<div class="button_container"
								style="display: flex; margin: 30px 0 30px; justify-content: space-around;">
								<c:if test="${sessionScope.id == resultVO.b_writer}">
										<div>
											<button id="boardUpdate" class="btn-detail">수정하기</button>
										</div>
										<div>
											<button id="boardRemove" class="btn-detail">삭제하기</button>
										</div>
								</c:if>
								<div>
									<input type="button" id="backBoardList" class="btn-detail" value="목록으로">
								</div>
							</div>
						</div>
						<!-- button   -->
						</form>
						<hr style="width: 80%; margin: 50px auto;">
						<form id="comment" method="post">
							<input type="hidden" id="r_no1" name="r_no">
							<input type="hidden" name="b_no" value="${resultVO.b_no}">
							<input type="hidden" name="m_id" value="${sessionScope.id}">
							<input type="hidden" id="search1" name="search" value="${requestScope.search}">
							<input type="hidden" id="b_category1" name="b_category" value="${requestScope.b_category}">
							<input type="hidden" id="pageNum1" name="pageNum" value="${requestScope.pageNum}">
							<input type="hidden" id="r_content1" name="r_content">
						<div class="comment_write">
								<div class="detail_comment_write">
									<div style="width: 100%;">
										<input type="text" id="comment_content" name="r_content_w" placeholder="댓글을 작성해주세요.">
									</div>
									<div>
										<input type="button" value="댓글작성" id="commentWrite" class="input_btn1">
									</div>
								</div>
						</div>

						<div class="detail_comment_list">
							<div class="comment_list">
								<c:if test="${replyList.size() >0 && replyList != null && map.cPageNum != map.pageCount}">
									<c:forEach var="i" begin="${(map.cPageNum-1)*map.pageSize}"	end="${map.cPageNum*map.pageSize-1}">
										<div style=" border: 1px solid; padding: 5px 20px 5px 5px; height: 100px; display:flex ;justify-content: space-between;">
											<div style="width: 15%; text-align: center; border-right: #ddd 1px double;">
												<div>
												<p style="padding-top: 1rem;">작성자 ID</p>
												</div>
												<input name="m_id" style="text-align: center;" type="text"
													readonly="readonly" value="${replyList[i].m_id}">
											</div>
											<div style="width: 65%;">
												<div style="height: 80%;">
													<input id="content_${replyList[i].r_no}" type="text" readonly="readonly"
														value="${replyList[i].r_content }">
												</div>
												<input style="height: 20%; padding-left: 50%;" type="text"
													readonly="readonly"
													value="작성일 : ${replyList[i].r_regdate.toString().split(' ')[0]}">
											</div>
													<c:if test="${sessionScope.id == replyList[i].m_id}">
											<div
												style="list-style: none; padding: 5px; margin: 0; display: flex; flex-direction: column; justify-content: space-around;">
													<div class="input_btn"  id="commentUpdate">
														<input id="upok" type="button" class="input_btn upok" value="수정완료">
													</div>
													<div class="input_btn" id="commentDelete">
														<input id="comdel" type="button" class="input_btn comdel" value="삭제">
													</div>
											</div>
													</c:if>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${map.cPageNum == map.pageCount }">
									<c:forEach var="i" begin="${(map.cPageNum-1)*map.pageSize}"
										end="${map.count-1}">
										<div style=" border: 1px solid; padding: 5px 20px 5px 5px; height: 100px; display:flex ;justify-content: space-between;">
											<div style="width: 15%; text-align: center; border-right: #ddd 1px double;">
												<div>
												<p style="padding-top: 1rem;">작성자 ID</p>
												</div>
												<input name="m_id" style="text-align: center;" type="text"
													readonly="readonly" value="${replyList[i].m_id}">
											</div>
											<div style="width: 65%;">
												<div style="height: 80%;">
													<input id="content_${replyList[i].r_no}" type="text" 
														value="${replyList[i].r_content }"
														${sessionScope.id == replyList[i].m_id ? '' : 'readonly' }>
												</div>
												<input style="height: 20%; padding-left: 50%;" type="text"
													readonly="readonly"
													value="작성일 : ${replyList[i].r_regdate.toString().split(' ')[0]}">
											</div>
													<c:if test="${sessionScope.id == replyList[i].m_id}">
											<div
												style="list-style: none; padding: 5px; margin: 0; display: flex; flex-direction: column; justify-content: space-around;">
													<div class="input_btn"  id="commentUpdate">
														<input id="${replyList[i].r_no}" type="button" class="input_btn upok" value="수정완료">
													</div>
													<div class="input_btn" id="commentDelete">
														<input id="${replyList[i].r_no}" type="button" class="input_btn comdel" value="삭제">
													</div>
											</div>
													</c:if>
										</div>
									</c:forEach>
								</c:if>
							</div>
							<div class="box-footer clearfix" style="margin-top: 30px;">
								<div style="width: 100%; display: flex;">
									<ul class="pagination pagination-sm no-margin pull-right"
										style="margin: auto;">
										<c:if test="${map.endPage <= map.pageBlock}">
											<li></li>
										</c:if>
										<c:if test="${map.endPage > map.pageBlock}">
											<li><a
												href="swRead?b_no=${map.b_no}&cPageNum=${map.startPage - map.pageBlock}
												&b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}"
												onclick="backPage();">«</a></li>
										</c:if>


										<c:forEach var="cPageNum" begin="${map.startPage}"
											end="${map.endPage}">
											<li><a onclick="inputcPageNum(cPageNum);"
												href="swRead?b_no=${map.b_no}&cPageNum=${cPageNum}&b_category=${param.b_category}
												&search=${param.search}&pageNum=${param.pageNum}">${cPageNum}</a></li>
										</c:forEach>

										<c:if test="${map.pageCount <= map.endPage}">
											<li></li>
										</c:if>
										<c:if test="${map.pageCount > map.endPage}">
											<li><a
												href="swRead?b_no=${map.b_no}&cPageNum=${map.startPage + map.pageBlock}
												&b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}"
												onclick="nextPage();">»</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!-- content  -->
		</div>
	</div>
	</div>
						<script type="text/javascript">
						
						var result = "${result}";
						
						if (result == "ok") {
							alert("정상적으로 댓글 작성 완료!");
						}
						if (result == "updOK") {
							alert("댓글 수정 완료!");
						}
						if (result == "delOK") {
							alert("댓글 삭제 완료!");
						}
						
						var queryString = window.location.search;
						var params = new URLSearchParams(queryString);
						var b_category = params.get('b_category');
						var search = params.get('search');
						var pageNum = parseInt(params.get('pageNum'));
						var m_id = "${sessionScope.id}";
						
						document.getElementById("b_category1").value = b_category;
						document.getElementById("search1").value = search;
						document.getElementById("pageNum1").value = pageNum; 
		
						function backList() {
						 window.location.href = "community?b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}";
						}
						
						$(document).ready(function(){
					    	 var formObj = $("#board");
					    	 // alert(formObj);
					    	 console.log(formObj);
					    	 
					    	 
					    	// 수정
							  $("#boardUpdate").click(function(){
								  formObj.attr("action","/sw/boardUpdate");
								  // 폼태그 이동방식 설정 POST
								  formObj.attr("method","post");
								  // 폼태그 정보 저장해서 페이지 이동
								  formObj.submit();			  
							  });
					    	
					    	//삭제
							  $("#boardRemove").click(function(){
								  // 폼태그 이동주소 설정 /boards/modify
								  formObj.attr("action","/sw/boardRemove");
								  // 폼태그 이동방식 설정 POST
								  formObj.attr("method","post");
								  // 폼태그 정보 저장해서 페이지 이동
								  formObj.submit();			  
							  });
					    	
							// 목록
							  $("#backBoardList").click(function(){
								 	location.href='/sw/community?b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}';		  
							  });
						});
						
						$(document).ready(function(){
					    	 var formObj = $("#comment");
					    	 // alert(formObj);
					    	 console.log(formObj);
					    	 
					    	// 댓글 작성
							  $("#commentWrite").click(function(){
						       if(document.getElementById("comment_content").value == ""){
						    		alert("댓글 내용을 입력해주세요!");
						   			document.getElementById("comment_content").focus();
						   			return;
						       }
						       if(m_id == ""){
						    	   alert("로그인 후 댓글 작성이 가능합니다!");
						    	   return location.href="/db/login";
						       }
								// 폼태그 이동주소 설정 /boards/modify
								formObj.attr("action","/sw/commentWrite");
								// 폼태그 이동방식 설정 POST
								formObj.attr("method","post");
								// 폼태그 정보 저장해서 페이지 이동
								formObj.submit();			
							  });
					    	 
								
							// 댓글수정
							$(".upok").click(function(){
								var rno = $(this).attr('id');
								var content = $('#content_'+rno).val();
								if(confirm("정말로 수정하시겠습니까?")){
									$.ajax({
										  url: '/sw/comUpdate',
										  method: 'post',
										  data: {r_no:rno,r_content:content},
										  success: function(response) {
										    // 요청이 성공한 경우 처리할 로직
										    setTimeout(function(){
										   		location.reload();
										    },50);
										  },
										  error: function(xhr, status, error) {
										    // 요청이 실패한 경우 처리할 로직
										    console.log('댓글 수정 실패');
										  }
										});
								}
											
							});
							
							// 댓글삭제
							$(".comdel").click(function(){
								var rno = $(this).attr('id');
									if(confirm("정말로 삭제하시겠습니까?")){
									     		$.ajax({
													  url: '/sw/comRemove',
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