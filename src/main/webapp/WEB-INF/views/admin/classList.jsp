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
								<th style="width: 26%; background: #FDC600;border-right: 2px solid;">클래스명</th>
								<th style="width: 25%; background: #FDC600;border-right: 2px solid;">개설자</th>
								<th style="width: 25%; background: #FDC600;border-right: 2px solid;">신청날짜</th>
								<th style="width: 12%; background: #FDC600;border-right: 2px solid;">버튼1</th>
								<th style="width: 12%; background: #FDC600;border-right: 2px solid;">버튼2</th>
							</tr>
							<c:forEach var='vo' items='${classVOList }'>
							<tr>
<%-- 								<td hidden="">${vo.c_no}</td> --%>
								<td><a href="/admin/classDetail?c_no=${vo.c_no}">${vo.c_name}</a></td>
								<td>${vo.m_id}</td>
								<td>${vo.c_regdate}</td>
								<td>버튼1</td>
								<td>버튼2</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이징처리  -->
					<div class="pagination">
						<ul>
							<c:if test="${amap.startPage > amap.pageBlock }">
							<li><a id="prev" href="/admin/classList?pageNum=${amap.startPage-1}">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${amap.startPage }" end="${amap.endPage }">
							<li><a class="pageNumbers" href="/admin/classList?pageNum=${i}">${i }</a></li>
							</c:forEach>
							<c:if test="${amap.pageCount > amap.endPage }">
							<li><a id="next" href="/admin/classList?pageNum=${amap.endPage+1}">다음</a></li>
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