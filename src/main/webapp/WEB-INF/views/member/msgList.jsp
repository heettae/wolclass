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
	#popup {
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    z-index: 9999;
	    display: none;
	    background-color: white;
	    border: 1px solid black;
	    padding: 20px;
	    width: 400px;
	}
</style>


<div id="container">
	<h2>메시지</h2>
	<input type="button" value="받은메세지" style="width: 250px; display: inline-block;" id="btn" class="msgbtn1">
	<input type="button" value="보낸메세지" style="width: 250px; display: inline-block;" id="btn" class="msgbtn2">
	
	<table id="table1">
	  <thead>
	    <tr>
	      <th>제목</th>
	      <th>카테고리</th>
	      <th>보낸사람</th>
	      <th>등록일</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach var="vo" items="${msgList1 }">
		      <tr>
			        <td>
				      <a class="popup-trigger" data-title="${vo.b_title }"  
							data-contents="${vo.b_content }"
							>${vo.b_title }</a>
			        </td>
		        <td>${vo.b_category }</td>
		        <td>${vo.b_writer }</td>
		        <td>${vo.b_regdate.toString().split('\\.')[0] }</td>
		      </tr>
	      </c:forEach>
	  </tbody>
	</table>
	<!-- --------------------------------------------------------------------------- -->
	<table id="table2" style="display: none">
	  <thead>
	    <tr>
	      <th>제목</th>
	      <th>카테고리</th>
	      <th>받는사람</th>
	      <th>등록일</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach var="vo2" items="${msgList2 }">
		      <tr>
			        <td>
						<a class="popup-trigger" data-title="${vo2.b_title }"  
							data-contents="${vo2.b_content }"
							>${vo2.b_title }</a>
			        </td>
		        <td>${vo2.b_category }</td>
		        <td>${vo2.b_reciver}</td>
		        <td>${vo2.b_regdate.toString().split('\\.')[0] }</td>
		      </tr>
	      </c:forEach>
	  </tbody>
	</table>
	<!-- 페이징처리  -->
		<div class="pagination">
			<ul>
				<c:if test="${amap.startPage > amap.pageBlock }">
				<li><a id="prev" href="/member/msgList?pageNum=${amap.startPage-1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${amap.startPage }" end="${amap.endPage }">
				<li><a class="pageNumbers" href="/member/msgList?pageNum=${i}">${i }</a></li>
				</c:forEach>
				<c:if test="${amap.pageCount > amap.endPage }">
				<li><a id="next" href="/member/msgList?pageNum=${amap.endPage+1}">다음</a></li>
				</c:if>
			</ul>
	    </div>
	<!-- 페이징처리  -->
</div>

<div id="popup" style="display: none;">
	<h3>제목</h3>
    <h5>Title</h5>
	<h3>글 내용</h3>
    <p>Contents</p>
    <button class="close-btn">Close</button>
</div>


<script type="text/javascript">
	$('.msgbtn2').click(function(){
		$('#table1').css('display','none');
		$('#table2').css('display','inline-table');
	});
	$('.msgbtn1').click(function(){
		$('#table1').css('display','inline-table');
		$('#table2').css('display','none');
	});
	
	// 태그에 대한 클릭 이벤트 등록
	document.querySelectorAll('.popup-trigger').forEach(trigger => {
	    trigger.addEventListener('click', function(e) {
	        e.preventDefault();

	        // 팝업창 요소 선택
	        const popup = document.getElementById('popup');

	        // 타이틀, 컨텐츠 데이터 전달
	        const title = this.getAttribute('data-title');
	        const contents = this.getAttribute('data-contents');

	        // 팝업창 요소 내용 변경
	        popup.querySelector('h5').innerHTML = title;
	        popup.querySelector('p').innerHTML = contents;

	        // 팝업창 보이기
	        popup.style.display = 'block';
	    });
	});

	// 팝업창 닫기 버튼에 대한 클릭 이벤트 등록
	document.querySelector('#popup .close-btn').addEventListener('click', function() {
	    // 팝업창 숨기기
	    document.getElementById('popup').style.display = 'none';
	});

</script>

<!-- side.jsp -->
</div>
</section>
<!-- side.jsp -->
                
<%@ include file="../include/footer.jsp" %>