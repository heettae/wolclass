<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>


<%@ include file="../include/adminSide.jsp" %>


<!-- content -->
<div
		style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
		<div class="col-xs-12" style="background: #FDC600;height: 99%;padding: 0 0 0 3px;
		">
			<div class="box" style="margin-bottom: 10px; padding: 60px 180px 0 180px; height: 100%">
				<div class="box-header">
					<!-- search  -->
					<div style="display: flex; padding-bottom: 45px;"
						class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글 목록</h3>
						</div>
					</div>
				</div>
				<!-- search  -->

				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody>


							<tr>
								<th style="width: 10%; background: #FDC600;border-right: 2px solid;">글번호</th>
								<th style="width: 20%; background: #FDC600;border-right: 2px solid;">카테고리</th>
								<th style="width: 25%; background: #FDC600;border-right: 2px solid;">제목</th>
								<th style="width: 20%; background: #FDC600;border-right: 2px solid;">작성자</th>
								<th style="width: 15%; background: #FDC600;border-right: 2px solid;">작성일</th>
								<th style="width: 10%; background: #FDC600;border-right: 2px solid;">버튼</th>
							</tr>
							<c:forEach var='vo' items='${boardVOList }'>
							<tr>
								<td>${vo.b_no}</td>
								<td>${vo.b_category}</td>
								<td><a href="/admin/readBoard?b_no=${vo.b_no}">${vo.b_title}</a></td>
								<td>${vo.b_writer}</td>
								<td>${vo.b_regdate}</td>
								<td><input type="button" value="삭제"></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이징처리  -->
					<div class="pagination">
						<ul>
							<c:if test="${amap.startPage > amap.pageBlock }">
							<li><a id="prev" href="/admin/boardList?pageNum=${amap.startPage-1}">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${amap.startPage }" end="${amap.endPage }">
							<li><a class="pageNumbers" href="/admin/boardList?pageNum=${i}">${i }</a></li>
							</c:forEach>
							<c:if test="${amap.pageCount > amap.endPage }">
							<li><a id="next" href="/admin/boardList?pageNum=${amap.endPage+1}">다음</a></li>
							</c:if>
						</ul>
			        </div>
					<!-- 페이징처리  -->
				</div>
			</div>
		</div>
	</div>

<!-- content -->


<%@ include file="../include/adminFooter.jsp" %>