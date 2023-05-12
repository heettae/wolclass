<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/side.jsp" %>
<style>
	#container {
	    width: 70%;
	    margin-left: 100px;
	}
	table {
	    border-collapse: collapse;
	    width: 100%;
	    margin-top: 10px;
	}
	th, td {
	    text-align: center;
	    padding: 8px;
	}
	th {
	    background-color: #353942;    
	    color:white;
	}
	td {
	    border-top: none;
	    border-bottom: 1px solid;
	}
	td:first-child,
	th:first-child {
	    border-left: none;
	}
	td:last-child,
	th:last-child {
	    border-right: none;
	}
	#btn:hover{
 	 background-color: #333;
  	color: #FDC600;
	}
</style>


<div id="container">
	<h2>클래스 내역</h2>
	<input type="button" value="예약한 클래스" style="width: 250px; display: inline-block;" id="btn" class="classbtn1">
	<input type="button" value="지난 클래스" style="width: 250px; display: inline-block;" id="btn" class="classbtn2">
	
	<table id="table1">
	  <thead>
	    <tr>
	      <th>클래스명</th>
	      <th>예약날짜</th>
	      <th>주소</th>
	      <th>1:1 문의</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach var="vo" items="${classList }">
		      <tr>
		        <td>${vo.c_name }</td>
		        <td>${vo.p_rsrvdate.toString().split('\\.')[0] }</td>
		        <td>${vo.c_addr1 }${vo.c_addr2 }${vo.c_addrdetails}</td>
		        <td>
		        	<input type="button" value="문의하기" id="btn"  
		        		 onclick="location.href='/db/myinquiry?m_id=${vo.m_id}&&c_no=${vo.c_no }'">
		        </td>
		      </tr>
	      </c:forEach>
	  </tbody>
	</table>
	<!-- --------------------------------------------------------------------------- -->
	<table id="table2" style="display: none">
	  <thead>
	    <tr>
	      <th>클래스명</th>
	      <th>예약날짜</th>
	      <th>주소</th>
	      <th>상태/리뷰</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach var="vo2" items="${classList2 }">
		      <tr>
		        <td>${vo2.c_name }</td>
		        <td>${vo2.p_rsrvdate.toString().split('\\.')[0] }</td>
		        <td>${vo2.c_addr1 }${vo2.c_addr2 }${vo2.c_addrdetails}</td>
		        <td>
		        	<c:if test="${vo2.p_status != 'paid' }">
			        	<font color="green">수강완료</font>
		        	</c:if>
		        	<c:if test="${vo2.p_status == 'paid' }">
			        	<input type="button" value="리뷰등록" id="btn"  
			        	onclick="location.href='/db/myreview?c_no=${vo2.c_no }&&p_no=${vo2.p_no }'">
		        	</c:if>
		        </td>
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

<script type="text/javascript">
	$('.classbtn2').click(function(){
		$('#table1').css('display','none');
		$('#table2').css('display','inline-table');
	});
	$('.classbtn1').click(function(){
		$('#table1').css('display','inline-table');
		$('#table2').css('display','none');
	});
</script>

<!-- side.jsp -->
</div>
</section>
<!-- side.jsp -->
                
<%@ include file="../include/footer.jsp" %>