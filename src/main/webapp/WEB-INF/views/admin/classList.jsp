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
							<h3 class="box-title" style="font-size: x-large;">클래스 목록 (승인대기)</h3>
						</div>
					</div>
				</div>
				<!-- list  -->

				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody>


							<tr>
								<th style="width: 26%; background: #FDC600;border-right: 1px #ddd solid;">클래스명</th>
								<th style="width: 25%; background: #FDC600;border-right: 1px #ddd solid;">개설자</th>
								<th style="width: 25%; background: #FDC600;border-right: 1px #ddd solid;">신청날짜</th>
								<th style="width: 12%; background: #FDC600;border-right: 1px #ddd solid;">개설승인</th>
								<th style="width: 12%; background: #FDC600;border-right: 1px #ddd solid;">개설거부</th>
							</tr>
							<c:forEach var='vo' items='${classVOList }'>
							<tr>
								<td><a onclick="javascript:window.open('/admin/classDetail?c_no=${vo.c_no}','_blank','height=800,width=1000,left=300,top=100');">${vo.c_name}</a></td>
								<td>${vo.m_id}</td>
								<td><fmt:formatDate value="${vo.c_regdate}" pattern="yyyy.MM.dd HH:mm"/></td>
								<td><input id="${vo.c_no}" class="confirm" type="button" value="승인" ></td>
								<td><input id="${vo.c_no}" class="delete" type="button" value="취소" ></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
						</div>
		    <!-- list  -->
			<!-- 페이징처리  -->
			<div class="box-footer clearfix pagination" style="margin: auto; width: 100%;">
				<div style="display: flex; justify-content: center;">
						<ul>
							<c:if test="${amap.startPage > amap.pageBlock }">
							<li><a id="prev" href="/admin/classList?pageNum=${amap.startPage-1}">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${amap.startPage }" end="${amap.endPage }">
							<li><a class="pageNumbers" href="/admin/classList?pageNum=${i}">${i}</a></li>
							</c:forEach>
							<c:if test="${amap.pageCount > amap.endPage }">
							<li><a id="next" href="/admin/classList?pageNum=${amap.endPage+1}">다음</a></li>
							</c:if>
						</ul>
				</div>
			</div>
			<!-- 페이징처리  -->
			</div>
		</div>
	</div>

<!-- content -->
	<script type="text/javascript">
	$(document).ready(function(){
		
		 /* 삭제  */
		 $(".delete").click(function(){
			 if(confirm("개설 승인을 거절하시겠습니까?")){
			 var id = $(this).attr('id');
			 $.ajax({
				  url: '/admin/deleteClass',
				  method: 'post',
				  data: {c_no:id},
				  success: function(response) {
				    // 요청이 성공한 경우 처리할 로직
				    setTimeout(function(){
				   		location.reload();
				    },50);
				  },
				  error: function(xhr, status, error) {
				    // 요청이 실패한 경우 처리할 로직
				    console.log('승인거부를 실패 하였습니다.');
				  }
				});
			 }
		 });
		 
		 /* 삭제  */
		 $(".confirm").click(function(){
			 if(confirm("클래스 개설을 하시겠습니다?")){
			 var id = $(this).attr('id');
			 $.ajax({
				  url: '/admin/confirmClass',
				  method: 'post',
				  data: {c_no:id},
				  success: function(response) {
				    // 요청이 성공한 경우 처리할 로직
				    setTimeout(function(){
				   		location.reload();
				    },50);
				  },
				  error: function(xhr, status, error) {
				    // 요청이 실패한 경우 처리할 로직
				    console.log('승인 실패');
				  }
				});
			 }
		 });
		 
		 
	});
	</script>

<%@ include file="../include/adminFooter.jsp" %>