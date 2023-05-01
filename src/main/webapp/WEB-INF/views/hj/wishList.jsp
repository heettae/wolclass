<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<!-- 작업 완료 시 헤더로 옮길 예정 -->
<style>
/* 위시리스트 */
.wishlist-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: transparent;
  border: none;
  cursor: pointer;
  outline: none;
  font-size: 24px;
  color: #ccc;
  transition: all 0.3s ease;
}

.wishlist-btn.active i:first-child {
  display: none;
}

.wishlist-btn.active i:last-child {
  display: inline;
  color: #f44336;
}
/* 위시리스트 */
</style>
<!-- 작업 완료 시 헤더로 옮길 예정 -->


<!-- 클래스 리스트 HJ -->
<div class="col-md-12 padding-top-40 properties-page">

	<!-- 리스트 컨테이너 -->
	<div class="col-md-12 "> 
		<div id="list-type" class="proerty-th">
			<!-- 검색된 클래스 데이터 출력 -->
			<c:if test="${classVOList != null && classVOList.size() > 0}">
			<c:forEach var="vo" items="${classVOList }">
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/class/detail?c_no=${vo.c_no }">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/class/detail?c_no=${vo.c_no }">${vo.c_name }</a></h4>
					    <span class="pull-left"><b>${vo.c_addr1 }&nbsp;${vo.c_addr2 }</b> </span><br>
					    <c:if test="${sessionScope.userLat != null && sessionScope.userLat != ''}">
						    <span class="pull-left">
							    <c:if test="${vo.distance > 1}">
							    <b><fmt:formatNumber value="${vo.distance}" pattern="'약' 0.0'km'" /></b> 
							    </c:if>
							    <c:if test="${vo.distance <= 1}">
							    <b><fmt:formatNumber value="${vo.distance}" pattern="'약' 000'm'" /></b> 
							    </c:if>
						    </span><br>
					     </c:if>
					    <span class="proerty-price pull-left"><fmt:formatNumber value="${vo.c_price}" type="currency" currencyCode="KRW" /></span>
					    <span class="pull-right"> 평점 : ${vo.score } </span>
   					    <!-- 위시리스트 버튼 -->
   					    <c:if test="${not empty sessionScope.id }">
				        <button class="wishlist-btn active" value="${vo.c_no }">
				          <i class="fas fa-heart"></i>
				        </button>
				        </c:if>
				        <!-- 위시리스트 버튼 -->
					</div>
			    </div>
			</div> 
			</c:forEach>
			</c:if>
			<!-- 검색된 클래스 데이터 출력 -->

		</div>
	</div>
	<!-- 리스트 컨테이너 -->
</div>
<!-- 클래스 리스트 HJ-->

<%@ include file="../include/footer.jsp" %>