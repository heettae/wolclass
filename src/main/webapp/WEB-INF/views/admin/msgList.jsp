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
							<h3 class="box-title" style="font-size: x-large;">문의 목록</h3>
						</div>
					</div>
				</div>
				<!-- search  -->

				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody>


							<tr>
								<th style="width: 10%; background: #FDC600;border-right: 1px #ddd solid;">글번호</th>
								<th style="width: 25%; background: #FDC600;border-right: 1px #ddd solid;">제목</th>
								<th style="width: 20%; background: #FDC600;border-right: 1px #ddd solid;">작성자</th>
								<th style="width: 15%; background: #FDC600;border-right: 1px #ddd solid;">작성일</th>
							</tr>
							<c:if test="${boardVOList != null && boardVOList.size() > 0}">
								<c:forEach var="msgList" items="${boardVOList}">
									<tr>
										<td>${msgList.b_no}</td>
										<td><a href="/admin/readMsg?b_no=${msgList.b_no}">${msgList.b_title}</a></td>
										<td>${msgList.b_writer}</td>
										<td>${msgList.b_regdate.toString().split(' ')[0]}</td>
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
							<li><a id="prev" href="/admin/msgList?pageNum=${amap.startPage-1}">«</a></li>
							</c:if>
							<c:forEach var="i" begin="${amap.startPage }" end="${amap.endPage }">
							<li><a class="pageNumbers" href="/admin/msgList?pageNum=${i}">${i }</a></li>
							</c:forEach>
							<c:if test="${amap.pageCount > amap.endPage }">
							<li><a id="next" href="/admin/msgList?pageNum=${amap.endPage+1}">»</a></li>
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