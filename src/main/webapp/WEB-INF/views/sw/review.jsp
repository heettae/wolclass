<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header  -->
<%@ include file="../include/header.jsp"%>
<!-- header  -->

<style type="text/css">
/* .btn-detail { */
/* 	font-weight: bold; */
/* 	font-size: 15px; */
/* 	border-radius: 6px; */
/* 	width: 150px; */
/* 	height: 45px; */
/* 	background: #C9BA9B; */
/* } */

/* .btn-detail:active { */
/* 	border: 3px gray inset; */
/* 	background: #A58C59; */
/* 	color: white; */
/* } */

/* .review_write_container { */
/* 	border: black solid 1px; */
/* 	margin: auto; */
/* 	width: 100%;	 */
/* } */

/* .detail_container { */
/* 	margin-top: 30px; */
/* } */

/* table { */
/* 	border: 1px black solid; */
/* 	text-align: center; */
/* 	margin: auto; */
/* 	width: 80%; */
/* 	background: #c2c2c2; */
/* 	color: white; */
/* } */

/* td { */
/* 	border: 1px solid black; */
/* } */

/* textarea { */
/* 	width: 100%; */
/* 	height: 30%; */
/* 	min-height: 250px; */
/* } */

/* /* 댓글 css  */ */
/* .review_write_input { */
/* 	display: flex; */
/* 	width: 100%; */
/* } */

/* .review_write { */
/* 	border: 1px #ddd solid; */
/* 	width: 80%; */
/* 	border-radius: 6px; */
/* 	height: 37px; */
/* 	margin: 30px auto; */
/* } */

/* .input_btn1 { */
/* 	border-radius: 6px; */
/* 	height: 35px; */
/* 	width: 80px; */
/* 	background: #FDC600; */
/* 	color: white; */
/* 	font-size: 15px; */
/* } */

/* .input_btn { */
/* 	border-radius: 6px; */
/* 	height: 30px; */
/* 	width: 80px; */
/* 	background: #FDC600; */
/* 	color: white; */
/* 	font-size: 15px; */
/* } */

/* .input_btn:hover { */
/* 	background: #c2c2c2; */
/* 	transition: all 1s ease; */
/* } */

/* .review_list_container { */
/* 	margin: auto; */
/* 	width: 100%; */
/* 	border: 1px #ddd solid; */
/* } */

/* .comment { */
/* 	display: flex; */
/* } */

/* 댓글 css  */
</style>



<!-- body  -->

<div class="section property-features">
	<h4 class="s-property-title">Review</h4>

	<div class="review_write_container">
		<div class="review_list_container">
			<div class="review_list">
				<c:if test="${reviewList.size() >0 && reviewList != null && map.pageNum != map.pageCount}">
					<c:forEach var="i" begin="${(map.pageNum-1)*map.pageSize}" end="${map.pageNum*map.pageSize-1}">
						<div style="border: 1px solid #ddd; height: 150px;">
								<div style="width: 100%; display: flex; font-weight: 600; justify-content: space-between;	border-bottom: 1px solid #ddd; height: 30%;">
									<div style="width: 15%;">
									<input style=" text-align: center;" type="text"
										readonly="readonly" value="작성자 ID : ${reviewList[i].m_id}">
									</div>
									<input type="hidden" name="r_no" value="${reviewList[i].r_no}">
									<div style="width: 60%;">
									별점
									</div>
									<div style="width: 25%">
									<input type="text"
										readonly="readonly"
										value="작성일 : ${reviewList[i].r_regdate.toString().split(' ')[0]}">
									</div>
								</div>
								<div style="width: 100%;">
									<div style="height: 80%;">
										<input id="r_content1" name="r_content" type="text"
											readonly="readonly" value="${reviewList[i].r_content }">
									</div>
								</div>
						</div>
					</c:forEach>
				</c:if>
				
				
				<c:if test="${map.pageNum == map.pageCount }">
					<c:forEach var="i" begin="${(map.pageNum-1)*map.pageSize}"
						end="${map.count-1}">
						<div
							style="border: 1px solid; padding: 5px 20px 5px 5px; height: 100px;display: flex; justify-content: space-between;">
								<div
									style="width: 15%; text-align: center; border-right: #ddd 1px double; 
									background: #A5A5A5; color: white; font-weight: 600; ">
									<div>
									<input style="text-align: center;" type="text"
										readonly="readonly" value="작성자 ID : ${reviewList[i].m_id}">
									</div>
									<input type="hidden" name="r_no" value="${reviewList[i].r_no}">
									<div>
									별점
									</div>
									<div>
									<input style="height: 20%; padding-left: 50%;" type="text"
										readonly="readonly"
										value="작성일 : ${reviewList[i].r_regdate.toString().split(' ')[0]}">
									</div>
								</div>
								<div style="width: 100%;">
									<div style="height: 80%;">
										<input id="r_content1" name="r_content" type="text"
											readonly="readonly" value="${reviewList[i].r_content }">
									</div>
								</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			
			
			
			<div class="box-footer clearfix">
				<div style="width: 100%; display: flex;margin: 10px 0;">
					<ul class="pagination pagination-sm no-margin pull-right"
						style="margin: auto;">
						<c:if test="${map.endPage <= map.pageBlock}">
							<li></li>
						</c:if>
						<c:if test="${map.endPage > map.pageBlock}">
							<li><a
								href="swRead?b_no=${map.b_no}&pageNum=${map.startPage - map.pageBlock}"
								onclick="backPage();">«</a></li>
						</c:if>


						<c:forEach var="pageNum" begin="${map.startPage}"
							end="${map.endPage}">
							<li><a onclick="inputpageNum(pageNum);"
								href="review?c_no=${map.c_no}&pageNum=${pageNum}">${pageNum}</a></li>
						</c:forEach>

						<c:if test="${map.pageCount <= map.endPage}">
							<li></li>
						</c:if>
						<c:if test="${map.pageCount > map.endPage}">
							<li><a
								href="swRead?b_no=${map.b_no}&pageNum=${map.startPage + map.pageBlock}"
								onclick="nextPage();">»</a></li>
						</c:if>
					</ul>

				</div>
			</div>
		</div>
	</div>
</div>


<!-- content  -->

<!-- body  -->