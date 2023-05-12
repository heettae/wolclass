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
							<h3 class="box-title" style="font-size: x-large;">결제내역 목록</h3>
						</div>
					</div>
				</div>
				<!-- search  -->

				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody>


							<tr>
								<th style="width: 6%; background: #FDC600;border-right: 1px #ddd solid;">예약번호</th>
								<th style="width: 13%; background: #FDC600;border-right: 1px #ddd solid;">성명</th>
								<th style="width: 20%; background: #FDC600;border-right: 1px #ddd solid;">클래스명</th>
								<th style="width: 15%; background: #FDC600;border-right: 1px #ddd solid;">예약일</th>
								<th style="width: 6%; background: #FDC600;border-right: 1px #ddd solid;">인원</th>
								<th style="width: 15%; background: #FDC600;border-right: 1px #ddd solid;">금액</th>
								<th style="width: 15%; background: #FDC600;border-right: 1px #ddd solid;">결제일</th>
								<th style="width: 10%; background: #FDC600;border-right: 1px #ddd solid;">취소여부</th> 
							</tr>
							<c:if test="${rsrvPayVOList != null && rsrvPayVOList.size() > 0}">
							<c:forEach var="payList" items="${rsrvPayVOList}">
								<tr>
								<td>${payList.p_no}</td>
								<td>${payList.m_id}</td>
								<td>${payList.c_name == null ? '구독' : payList.c_name}</td>
								<td><fmt:formatDate value="${payList.p_rsrvdate}" pattern="yyyy.MM.dd HH:mm"/></td>
								<td>${payList.p_peoplenum}</td>
								<td>${payList.p_price}</td>
								<td><fmt:formatDate value="${payList.p_paydate}" pattern="yyyy.MM.dd HH:mm"/></td>
<!-- 								p_status (string): 결제상태. ready:미결제, complete,paid:결제완료, cancelled:결제취소, failed:결제실패 = ['ready', 'paid', 'cancelled', 'failed'] -->
								<c:if test="${payList.p_status == 'ready'}">
								<td>미결제</td>
								</c:if>
								<c:if test="${payList.p_status == 'cancelled'}">
								<td>결제취소</td>
								</c:if>
								<c:if test="${payList.p_status == 'failed'}">
								<td>결제실패</td>
								</c:if>
								<c:if test="${payList.p_status == 'complete' || payList.p_status == 'paid'}">
								<td>결제완료</td>
								</c:if>
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
							<li><a id="prev" href="/admin/payList?pageNum=${amap.startPage-1}">«</a></li>
							</c:if>
							<c:forEach var="i" begin="${amap.startPage }" end="${amap.endPage }">
							<li><a class="pageNumbers" href="/admin/payList?pageNum=${i}">${i }</a></li>
							</c:forEach>
							<c:if test="${amap.pageCount > amap.endPage }">
							<li><a id="next" href="/admin/payList?pageNum=${amap.endPage+1}">»</a></li>
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