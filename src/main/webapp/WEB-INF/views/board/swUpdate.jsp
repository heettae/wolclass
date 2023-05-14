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

.input_btn {
	border-radius: 6px;
	height: 35px;
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
						<div class="detail_container">
							<input type="hidden" name="b_no" value="${resultVO.b_no}">
							<table>
								<tr>
									<td>제목</td>
									<td colspan="3"><input name="b_title"
										value="${resultVO.b_title}"></td>
									<td>작성자</td>
									<td><input name="b_writer" value="${resultVO.b_writer}"
										readonly="readonly"></td>
								</tr>
								<tr>
									<td>카테고리</td>
									<td><input name="b_category"
										value="${resultVO.b_category}" readonly="readonly"></td>
									<td>조회수</td>
									<td><input name="b_viewcnt" value="${resultVO.b_viewcnt}"
										readonly="readonly"></td>
									<td>작성일</td>
									<td><input name="b_regdate" value="${resultVO.b_regdate.toString().split(' ')[0]}"
										readonly="readonly"></td>
								</tr>
								<tr>
									<td colspan="6"><textarea maxlength="1000"
											name="b_content" style="border: none;">${resultVO.b_content}</textarea></td>
								</tr>

							</table>
						</div>



						<!-- button   -->
						<div>
							<div class="button_container"
								style="display: flex; margin: 30px 0 30px; justify-content: space-around;">
								<div>
									<button type="submit" class="btn-detail">수정하기</button>
								</div>
								<div>
									<button type="submit" class="btn-detail">삭제하기</button>
								</div>
								<div>
									<button class="btn-detail" onclick="backList();">목록으로</button>
								</div>
							</div>
						</div>
						<!-- button   -->
						<script type="text/javascript">
							function backList() {
								window.location.href="/board/community?b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}"
							}
							
							
							
							
						</script>

						<input type="hidden" value="${requestScope.b_category}" name="b_category">
						<input type="hidden" value="${requestScope.search}" name="search">
						<hr style="width: 80%; margin: 50px auto;">
						<div class="comment_write">
							<form role="form" method="post">
								<div class="detail_comment_write">
									<input type="hidden" value="${resultVO.b_no}" name="b_no">
									<input type="hidden" value="test1234" name="m_id">
									<div style="width: 100%;">
										<input type="text" name="r_content" placeholder="댓글을 작성해주세요.">
									</div>
									<div>
										<button type="submit"  class="input_btn">댓글작성</button>
									</div>
								</div>
							</form>
						</div>

						<div class="detail_comment_list">
							<div class="comment_list">
								<c:if test="${replyList.size() >0 && replyList != null && map.pageNum != map.pageCount}">
								<c:forEach var="i" begin="${(map.pageNum-1)*map.pageSize}" end="${map.pageNum*map.pageSize-1}">
								<div
									style="display: flex; border: 1px solid; padding: 5px; justify-content: space-between;">


									<div style="width: 15%;">
										<div>
											<img src="../../../resources/img/no_img.PNG">
										</div>
										<input style="text-align: center;" type="text"
											readonly="readonly" value="${replyList[i].m_id}">
									</div>
									<div style="width: 65%;">
										<div style="height: 80%;">
											<input type="text" readonly="readonly"
												value="${replyList[i].r_content }">
										</div>
											<input style="height:20%; padding-left: 50%;" type="text" readonly="readonly"
												value="작성일 : ${replyList[i].r_regdate.toString().split(' ')[0]}">
									</div>
									<div
										style="list-style: none; padding: 5px; margin: 0; display: flex; flex-direction: column; justify-content: space-around;">
										<div class="input_btn">
											<button class="input_btn">수정</button>
										</div>
										<div class="input_btn">
											<button class="input_btn">삭제</button>
										</div>
									</div>
								</div>
								</c:forEach>
							</c:if>
							<c:if test="${map.pageNum == map.pageCount }">
								<c:forEach var="i" begin="${(map.pageNum-1)*map.pageSize}" end="${map.count-1}">
								<div
									style="display: flex; border: 1px solid; padding: 5px 20px 5px 5px; justify-content: space-between;">


									<div style="width: 15%;">
										<div>
											<img src="../../../resources/img/no_img.PNG">
										</div>
										<input style="text-align: center;" type="text"
											readonly="readonly" value="${replyList[i].m_id}">
									</div>
									<div style="width: 65%;">
										<div style="height: 80%;">
											<input type="text" readonly="readonly"
												value="${replyList[i].r_content }">
										</div>
											<input style="height:20%; padding-left: 50%;" type="text" readonly="readonly"
												value="작성일 : ${replyList[i].r_regdate.toString().split(' ')[0]}">
									</div>
									<div
										style="list-style: none; padding: 5px; margin: 0; display: flex; flex-direction: column; justify-content: space-around;">
										<div class="input_btn">
											<button class="input_btn">수정</button>
										</div>
										<div class="input_btn">
											<button class="input_btn">삭제</button>
										</div>
									</div>
								</div>
								
								</c:forEach>
							</c:if>
							</div>
							<div class="box-footer clearfix" style="margin-top:30px; ">
								<div style="width: 100%;display: flex;">
									<ul class="pagination pagination-sm no-margin pull-right" style="margin: auto;">
										<c:if test="${map.endPage <= map.pageBlock}">
						<li></li>
						</c:if>
						<c:if test="${map.endPage > map.pageBlock}">
						<li><a href="/board/swRead?b_no=${map.b_no}&pageNum=${map.startPage - map.pageBlock}" 
						onclick="backPage();">«</a></li>
						</c:if>
						
						
						<c:forEach var="pageNum" begin="${map.startPage}" end="${map.endPage}">
							<li><a onclick="inputPageNum(pageNum);" href="/board/swRead?b_no=${map.b_no}&pageNum=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						
						<c:if test="${map.pageCount <= map.endPage}">
						<li></li>
						</c:if>
						<c:if test="${map.pageCount > map.endPage}">
						<li><a href="/board/swRead?b_no=${map.b_no}&pageNum=${map.startPage + map.pageBlock}" 
						onclick="nextPage();">»</a></li>
						</c:if>
									</ul>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- content  -->
		</div>
	</div>
</div>
<!-- body  -->




<!-- footer  -->
<%@ include file="../include/footer.jsp"%>
<!-- footer  -->