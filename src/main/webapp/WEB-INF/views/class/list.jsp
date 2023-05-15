<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<!-- 지도 팝업창 관련 -->
<input type="hidden" id="srchdata" value='${jsonStr}'>
<script type="text/javascript">
function openMap(){
	let popup = window.open('./popupMap','지도 검색','width=500,height=800,top=50%,left=50%,location=no');
	window.addEventListener("beforeunload", function() {
		popup.close();
	});
}
function openLocation(){
	if('${sessionScope.userLat}' == '') {
		alert('위치 정보를 사용할 수 없습니다');
		return;
	}
	let popup = window.open('./popupLocation','주변 검색','width=500,height=800,top=50%,left=50%,location=no');
	window.addEventListener("beforeunload", function() {
		popup.close();
	});
}
</script>
<!-- 지도 팝업창 관련 -->

<style>
	.col-xs-10 {
    width: 100%;
	}

	#btnMap{
	border: 1.5px solid #fff;
    /* background: transparent none repeat scroll 0% 0%; */
    border-radius: 5px;
    padding: 9px 25px;
    margin-top: 10px;
    margin-right: 5px;
    background-color: lightgray;
	}

 	#best { 
     border: 1.5px solid #777777; 
     border-radius: 200px; 
     padding: 9px 25px; 
     margin-top: 10px; 
     margin-right: 5px; 
 	} 

	#orderSelector{
	border: 1px solid lightgrey;
    padding-left: 10px;
    padding-right: 10px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: gray;
    margin-right: 0px;
    margin-left: 703px;
    }
    
    #mapDiv{
    display: contents;
    }
    
    #btnPage{
      display: flex;
	  justify-content: center;
  	  align-items: center;
    
    }

</style>

<div class="content-area recent-property" style="padding-bottom: 60px; background-color: rgb(252, 252, 252);">
<div class="container">   
<div class="row">

<!-- 클래스 컨테이너 -->
<div class="col-md-12 padding-top-40 properties-page">
	<!-- 버튼 컨테이너 -->
	<div class="col-md-12 "> 
		<!-- 인기검색어 출력  -->
		<div class="col-xs-10 page-subheader sorting pl0">
			인기 검색어<br>
			<c:if test="${psList != null && psList.size() > 0}">
			<c:forEach var="ps" items="${psList }">
				<button class="btn border-btn more-black bestBtn" id="best">${ps }</button>
			</c:forEach>
			</c:if>
		</div>
		<!-- 인기검색어 출력  -->
		<!-- 정렬 조건 설정  -->
		<div class="col-xs-10 page-subheader sorting pl0">
		<hr>
	        <div id="mapDiv">
	            <button class="btn border-btn more-black" id="btnMap" onclick="openLocation()"><i class="fa fa-map-marker" ></i> 내 주변 검색</button>
	            <button class="btn border-btn more-black" id="btnMap" onclick="openMap()"><i class="fa fa-map-marker" ></i> 지도 열기</button>
	        </div>
			<select id="orderSelector">
		  		<option value="0" ${map.order == 0 ? 'selected' : ''}>최신순</option>
				<option value="1" ${map.order == 1 ? 'selected' : ''}>인기순</option>
				<option value="2" ${map.order == 2 ? 'selected' : ''}>거리순</option>
				<option value="3" ${map.order == 3 ? 'selected' : ''}>낮은 가격순</option>
				<option value="4" ${map.order == 4 ? 'selected' : ''}>높은 가격순</option>
			</select>
		</div>
		<!-- 정렬 조건 설정  -->
		<!-- 지도 열기 버튼  -->
		<!-- 지도 열기 버튼  -->
	</div>
	<!-- 버튼 컨테이너 -->
	<!-- 리스트 컨테이너 -->
	<div class="col-md-12 "> 
		<div id="list-type" class="proerty-th">
			<!-- 검색된 클래스 데이터 출력 -->
			<c:if test="${classVOList == null || classVOList.size() == 0}">
			<div style="height: 800px">검색결과없음</div>
			</c:if>
			<c:if test="${classVOList != null && classVOList.size() > 0}">
			<c:forEach var="vo" items="${classVOList }">
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/class/detail?c_no=${vo.c_no }">
		                	<img src="/resources/img/${vo.c_img.split(',')[0] }" 
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
				        <button class="wishlist-btn ${wishList.contains(vo.c_no) ? 'active' : ''}" value="${vo.c_no }">
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
		
			<!-- 페이징 처리  -->
			<div class="col-md-12" id="btnPage"> 
			    <div class="pull-right">
			        <div class="pagination">
						<ul>
							<c:if test="${map.startPage > map.pageBlock }">
							<li><a style="cursor: pointer;" id="prev">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPage }" end="${map.endPage }">
							<li><a style="cursor: pointer;" class="pageNumbers">${i }</a></li>
							</c:forEach>
							<c:if test="${map.pageCount > map.endPage }">
							<li><a style="cursor: pointer;" id="next">다음</a></li>
							</c:if>
						</ul>
			        </div>
			    </div>                
			</div>
			<!-- 페이징 처리 -->
			
			<!-- 페이지 이동시 데이터 처리 -->
			<script type="text/javascript">
			$(document).ready(function(){
				var formObj = $("form[role='srch_frm']");
				
				// 인기검색어			
				$(".bestBtn").click(function(){
					$('input[name="pageNum"]').val(1);
					$('input[name="search"]').val($(this).html());
					formObj.submit();
				});	
				
				// prev
				$("#prev").click(function(){
					$('input[name="pageNum"]').val("${map.startPage-1}");
					formObj.submit();
				});
				
				// pageNum			
				$(".pageNumbers").click(function(){
					$('input[name="pageNum"]').val($(this).html());
					formObj.submit();
				});	
				
				// next
				$("#next").click(function(){
					$('input[name="pageNum"]').val("${map.endPage+1}");
					formObj.submit();
				});	
				
				// 정렬기준 변경
				$("#orderSelector").change(function(){
					$('input[name="pageNum"]').val(1);
					$('input[name="order"]').val($(this).val());
					formObj.submit();
				});	
			});
			</script> 
			<!-- 페이지 이동시 데이터 처리 -->
		</div>
	</div>
	<!-- 리스트 컨테이너 -->
</div>
<!-- 클래스 리스트 HJ-->
</div>
</div>
</div>

<%@ include file="../include/footer.jsp" %>