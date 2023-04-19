<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<!-- 클래스 리스트 메인 / 최형준 -->
<div class="col-md-12  padding-top-40 properties-page">
	
	<div class="col-md-12 "> 
		<!-- 인기검색어 출력  -->
		<div class="col-xs-10 page-subheader sorting pl0">
			인기 검색어<br>
			<c:if test="${keywordList != null && keywordList.size() > 0}">
			<c:forEach var="vo" items="${popularSearchVOList }">
				<a href="/hj/list?search=${keyword }">${vo.ps_text }</a>
			</c:forEach>
			</c:if>
				<a href="/hj/list?search=${keyword }">키워드</a>
			테스트&nbsp;테스트테스트
		</div>
		<!-- 인기검색어 출력  -->
		
		<!-- 지도선택버튼  -->
        <div class="col-xs-2 layout-switcher">
            <a class="layout-list" href="javascript:void(0);"> <i class="fa fa-th-list"></i>  </a>
            <a class="layout-grid active" href="javascript:void(0);"> <i class="fa fa-th"></i> </a>                          
        </div><!--/ .layout-switcher-->
		<!-- 지도선택버튼  -->
	</div>
	
	<!-- 리스트 컨테이너 -->
	<div class="col-md-12 "> 
		<div id="list-type" class="proerty-th">
			<!-- 검색된 클래스 데이터 출력 -->
			<c:if test="${classVOList != null && classVOList.size() > 0}">
			<c:forEach var="vo" items="${classVOList }">
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=${vo.c_no }">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=${vo.c_no }">${vo.c_name }</a></h4>
					    <span class="pull-left"><b>${vo.c_addr1 }&nbsp;${vo.c_addr2 }</b> </span><br>
					    <span class="proerty-price pull-left">${vo.c_price }</span>
					    <span class="pull-right"> 평점 : ${vo.score } </span>
					</div>
			    </div>
			</div> 
			</c:forEach>
			</c:if>
			<!-- 검색된 클래스 데이터 출력 -->
			
			<!-- 삭제할 부분 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 하드코딩 테스트중 -->
			<div class="col-sm-6 col-md-3 p0">
		        <div class="box-two proerty-item">
		            <div class="item-thumb">
		                <a href="/th/detail?c_no=1">
		                	<img src="/resources/img/${vo.c_img }" 
		                	onerror="this.onerror=null; this.src='/resources/img/no_img.PNG'">
	                	</a>
		            </div>
					<div class="item-entry overflow">
					    <h4><a href="/th/detail?c_no=1">클래스 이름</a></h4>
					    <span class="pull-left"><b>서울시 동작구 상도동</b> </span><br>
					    <span class="proerty-price pull-left"> 30,000원</span>
					    <span class="pull-right"> 평점 : 4.5 </span>
					</div>
			    </div>
			</div>
			<!-- 하드코딩 테스트중 -->
			<!-- 삭제할 부분 -->
			<!-- 페이징 처리  -->
			<div class="col-md-12"> 
			    <div class="pull-right">
			        <div class="pagination">
			            <ul>
			                <li><a href="#">Prev</a></li>
			                <li><a href="#">1</a></li>
			                <li><a href="#">2</a></li>
			                <li><a href="#">3</a></li>
			                <li><a href="#">4</a></li>
			                <li><a href="#">Next</a></li>
			            </ul>
			        </div>
			    </div>                
			</div>
			<!-- 페이징 처리 -->
		</div>
	</div>
	<!-- 리스트 컨테이너 -->
</div>
<!-- 클래스 리스트 부분 / 최형준 -->

<%@ include file="../include/footer.jsp" %>