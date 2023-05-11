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
							<h3 class="box-title" style="font-size: x-large;">리뷰 목록</h3>
						</div>
					</div>
				</div>
				<!-- search  -->

				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody>


							<tr>
								<th style="width: 10%; background: #FDC600;border-right: 1px #ddd solid;">리뷰번호</th>
								<th style="width: 15%; background: #FDC600;border-right: 1px #ddd solid;">클래스번호</th>
								<th style="width: 25%; background: #FDC600;border-right: 1px #ddd solid;">멤버아이디</th>
								<th style="width: 20%; background: #FDC600;border-right: 1px #ddd solid;">내용</th>
								<th style="width: 15%; background: #FDC600;border-right: 1px #ddd solid;">등록일</th>
								<th style="width: 15%; background: #FDC600;border-right: 1px #ddd solid;">평점</th>
								<th style="width: 15%; background: #FDC600;border-right: 1px #ddd solid;">버튼</th>
							</tr>
							<c:if test="${replyVOList != null && replyVOList.size() > 0}">
							<c:forEach var="reviewList" items="${replyVOList}">
							<tr>
								<td>${reviewList.r_no}</td>
								<td>${reviewList.c_no}</td>
								<td>${reviewList.m_id}</td>
								<td>${reviewList.r_content}</td>
								<td>${reviewList.r_regdate}</td>
								<td>${reviewList.r_score}</td>
								<td><input type="button" value="삭제"></td> 
							</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			<!-- 페이징처리  -->
			<div class="box-footer clearfix pagination" style="margin: auto; width: 100%;">
				<div style="display: flex; justify-content: center;">
						<ul>
							<c:if test="${amap.startPage > amap.pageBlock }">
							<li><a id="prev" href="/admin/payList?pageNum=${amap.startPage-1}">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${amap.startPage }" end="${amap.endPage }">
							<li><a class="pageNumbers" href="/admin/payList?pageNum=${i}">${i }</a></li>
							</c:forEach>
							<c:if test="${amap.pageCount > amap.endPage }">
							<li><a id="next" href="/admin/payList?pageNum=${amap.endPage+1}">다음</a></li>
							</c:if>
						</ul>
				</div>
			</div>
			<!-- 페이징처리  -->
			</div>
		</div>

	</div>

<!-- content -->


<%@ include file="../include/adminFooter.jsp" %>