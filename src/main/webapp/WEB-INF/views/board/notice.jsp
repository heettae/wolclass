<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header  -->
<%@ include file="../include/header.jsp"%>
<!-- header  -->
 
<style type="text/css">
.clearfix li {
	float: none;
}

.clearfix {
	display: flex;
	justify-content: center;
}

th {
	background: #FDC600;
}
</style>

	<!-- body  -->
	<div style="margin: 45px 0;">
		<div style="padding-left: 20px; position: relative;">
			<hr style="width: 8%; position: absolute;">
			<h1 style="margin-left: 10%; line-height: inherit;">공지사항</h1>
		</div>
	</div>

	<!-- list  -->
	<div
		style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
		<div class="col-xs-12">
			<div class="box" style=" height: 800px; margin-bottom: 10px; padding: 60px 180px 0 180px;">
				<div class="box-header">
					<!-- search  -->
					<div style="display: flex; padding-bottom: 45px;"
						class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글 목록</h3>
						</div>
<!-- 						<form role="form" method="get" -->
<!-- 							style="margin-left: 68%; display: flex;"> -->
<!-- 							<div class="category-search"> -->
<!-- 								<select style="width: 100px;" name="b_category" id="b_category1"> -->
<!-- 									<option value="">전체글</option> -->
<!-- 									<option value="일반">일반글</option> -->
<!-- 									<option value="모집">모집글</option> -->
<!-- 								</select> -->
<!-- 							</div> -->

<!-- 							<div class="box-tools"> -->
<!-- 								<div class="input-group input-group-sm hidden-xs"> -->
<!-- 									<input style="width: 200px; margin-left: 58px;" type="text" -->
<!-- 										name="search" class="form-control pull-right" -->
<%-- 										placeholder="키워드를 입력해주세요" value="${nmap.search}"> --%>

<!-- 									<div class="input-group-btn"> -->
<!-- 										<button type="submit" class="btn btn-default"> -->
<!-- 											<i class="fa fa-search"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</form> -->

					</div>
				</div>
				<!-- search  -->

				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody>


							<tr>
								<th style="width: 10%">글번호</th>
								<th style="width: 25%">제목</th>
								<th style="width: 10%">조회수</th>
								<th style="width: 15%">작성일</th>
							</tr>
						<c:if test="${boardVOList != null && boardVOList.size() > 0}">
								<c:forEach var="vo" items="${boardVOList }">
									<tr>
										<td>${vo.b_no}</td>
										<td><a href="/board/readNotice?b_no=${vo.b_no }&pageNum=${nmap.pageNum}">
												${vo.b_title } </a></td>
										<td><span class="badge bg-yellow">
												${vo.b_viewcnt } </span></td>
										<td><fmt:formatDate value="${vo.b_regdate}" pattern="yyyy.MM.dd HH:mm"/></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<!-- 페이징처리  -->
					<div class="pagination">
						<ul>
							<c:if test="${nmap.startPage > nmap.pageBlock }">
							<li><a id="prev" href="/board/notice?pageNum=${nmap.startPage-1}">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${nmap.startPage }" end="${nmap.endPage }">
							<li><a class="pageNumbers" href="/board/notice?pageNum=${i}">${i }</a></li>
							</c:forEach>
							<c:if test="${nmap.pageCount > nmap.endPage }">
							<li><a id="next" href="/board/notice?pageNum=${nmap.endPage+1}">다음</a></li>
							</c:if>
						</ul>
			        </div>
					<!-- 페이징처리  -->
				</div>
			</div>

		</div>
	</div>
	<!-- list  -->

<!-- footer  -->
<%@ include file="../include/footer.jsp"%>
<!-- footer  -->