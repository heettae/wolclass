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
				       <a href="#">${vo.b_title }</a>
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
			        	<a href="#">${vo2.b_title }</a>
			        </td>
		        <td>${vo2.b_category }</td>
		        <td>${vo2.b_reciver}</td>
		        <td>${vo2.b_regdate.toString().split('\\.')[0] }</td>
		      </tr>
	      </c:forEach>
	  </tbody>
	</table>
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
</script>

<!-- side.jsp -->
</div>
</section>
<!-- side.jsp -->
                
<%@ include file="../include/footer.jsp" %>