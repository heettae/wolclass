<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header  -->
<%@ include file="../include/header.jsp"%>
<!-- header  -->
 
<style type="text/css">
.clearfix li {
	float: none;
}

.clearfix {
	display: flex;
	justify-content: center;
}

th {
	background: #FDC600;
}
</style>
</head>
<body>

	<!-- body  -->
	<div style="margin: 45px 0;">
		<div style="padding-left: 20px; position: relative;">
			<hr style="width: 8%; position: absolute;">
			<h1 style="margin-left: 10%; line-height: inherit;">커뮤니티</h1>
		</div>
	</div>

	<!-- list  -->
	<div
		style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
		<div class="col-xs-12">
			<div class="box" style="margin-bottom: 10px; padding: 60px 180px 0 180px;">
				<div class="box-header">
					<!-- search  -->
					<div style="display: flex; padding-bottom: 45px;"
						class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글 목록</h3>
						</div>
						<form role="form" method="get"
							style="margin-left: 68%; display: flex;">
							<div class="category-search">
								<select style="width: 100px;" name="b_category" id="b_category1">
									<option value="">전체글</option>
									<option value="일반">일반글</option>
									<option value="모집">모집글</option>
								</select>
							</div>

							<div class="box-tools">
								<div class="input-group input-group-sm hidden-xs">
									<input style="width: 200px; margin-left: 58px;" type="text"
										name="search" class="form-control pull-right"
										placeholder="키워드를 입력해주세요" value="${cmap.search}">

									<div class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
				<!-- search  -->

				<div class="box-body table-responsive no-padding">
					<table class="table table-hover">
						<tbody>


							<tr>
								<th style="width: 10%">글번호</th>
								<th style="width: 20%">카테고리</th>
								<th style="width: 25%">제목</th>
								<th style="width: 20%">작성자</th>
								<th style="width: 10%">조회수</th>
								<th style="width: 15%">작성일</th>
							</tr>
						<c:if test="${boardList.size() >0 && boardList != null && cmap.pageNum != cmap.pageCount}">
								<c:forEach var="i" begin="${(cmap.pageNum-1)*cmap.pageSize}" end="${cmap.pageNum*cmap.pageSize-1}">
									<tr>
										<td>${boardList[i].b_no}</td>
										<td><c:if test="${boardList[i].b_category == '일반'}">
									일반글
									</c:if> <c:if test="${boardList[i].b_category == '모집'}">
									모집글
									</c:if> </td>
										<td><a href="/board/read?b_no=${boardList[i].b_no }&b_category=${cmap.b_category}
										&search=${cmap.search}&pageNum=${cmap.pageNum}">
												${boardList[i].b_title } </a></td>
										<td>${boardList[i].b_writer }</td>
										<td><span class="badge bg-yellow">
												${boardList[i].b_viewcnt } </span></td>
										<td><fmt:formatDate value="${boardList[i].b_regdate}" pattern="yyyy.MM.dd HH:mm"/></td>
									</tr>
								</c:forEach>
							</c:if>
						<c:if test="${cmap.pageNum == cmap.pageCount }">
								<c:forEach var="i" begin="${(cmap.pageNum-1)*cmap.pageSize}" end="${cmap.count-1}">
									<tr>
										<td>${boardList[i].b_no}</td>
											<td><c:if test="${boardList[i].b_category == '일반'}">
									일반글
									</c:if> <c:if test="${boardList[i].b_category == '모집'}">
									모집글
									</c:if> </td>
										<td><a href="/board/read?b_no=${boardList[i].b_no }&b_category=${cmap.b_category}
										&search=${cmap.search}&pageNum=${cmap.pageNum}">
												${boardList[i].b_title } </a></td>
										<td>${boardList[i].b_writer }</td>
										<td><span class="badge bg-yellow">
												${boardList[i].b_viewcnt } </span></td>
										<td>${boardList[i].b_regdate}</td>
									</tr>
								</c:forEach>
							</c:if>
							
						
						</tbody>
					</table>
				</div>
				<div></div>
			</div>

			<a onclick="boardWrite();" style="margin: 10px 0 30px 85%; padding:5px 10px; border: #ddd solid 1px; border-radius: 6px; cursor: pointer;">
				글작성
			</a>
			
		</div>

		<div>
			<!-- 페이징처리  -->
			<div class="box-footer clearfix">
				<div>
					<ul class="pagination pagination-sm no-margin " >
						<c:if test="${cmap.endPage <= cmap.pageBlock}">
						<li></li>
						</c:if>
						<c:if test="${cmap.endPage > cmap.pageBlock}">
						<li><a href="/board/community?b_category=${cmap.b_category}&search=${cmap.search}&pageNum=${cmap.startPage - cmap.pageBlock}" 
						onclick="backPage();">«</a></li>
						</c:if>
						
						
						<c:forEach var="pageNum" begin="${cmap.startPage}" end="${cmap.endPage}">
							<li><a onclick="inputPageNum(pageNum);" href="/board/community?b_category=${cmap.b_category}
							&search=${cmap.search}&pageNum=${cpageNum}">${cpageNum}</a></li>
						</c:forEach>
						
						<c:if test="${cmap.pageCount <= cmap.endPage}">
						<li></li>
						</c:if>
						<c:if test="${cmap.pageCount > cmap.endPage}">
						<li><a href="/board/community?b_category=${cmap.b_category}&search=${cmap.search}&pageNum=${cmap.startPage + cmap.pageBlock}" 
						onclick="nextPage();">»</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<!-- 페이징처리  -->
		</div>
	</div>
	<!-- list  -->

	<!-- body  -->
	<script type="text/javascript">
		var result = "${result}";

		
		
		if (result == "ok") {
			alert("정상적으로 글 작성 완료!");
		}
		if (result == "updOK") {
			alert("글 수정 완료!");
		}
		if (result == "delOK") {
			alert("글 삭제 완료!");
		}
		$(function(){
			$("#b_category1").val("${param.b_category}").attr("selected","selected");
		});
	
		function nextPage(){
		    cmap.put("startPage", cmap.get("startPage") + cmap.get("pageSize"));
		    cmap.put("endPage", cmap.get("endPage") + cmap.get("pageSize"));
		    alert(cmap.get("startPage"));
		    alert(cmap.get("endPage"));   
		};

		function backPage(){
		    cmap.put("startPage", cmap.get("startPage") - cmap.get("pageSize"));
		    cmap.put("endPage", cmap.get("endPage") - cmap.get("pageSize"));
		    alert(cmap.get("startPage"));
		    alert(cmap.get("endPage"));
		};
        
		function inputPageNum(pageNum){
			cmap.put("pageNum", pageNum);
		};
		 
		function boardWrite(){
			if("${sessionScope.id}" == ""){
				return location.href="/db/login";
			}
			return location.href="/board/write";
		}
		
		
       
	</script>



<!-- footer  -->
<%@ include file="../include/footer.jsp"%>
<!-- footer  -->