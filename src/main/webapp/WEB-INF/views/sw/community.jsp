<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>

<meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/assets/fonts/icon-7-stroke/css/helper.css">
        <link rel="stylesheet" href="/resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css">
        <link rel="stylesheet" href="/resources/assets/css/normalize.css">
        <link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="/resources/assets/css/fontello.css">
        <link rel="stylesheet" href="/resources/assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="/resources/assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="/resources/assets/css/price-range.css">
        <link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="/resources/assets/css/owl.theme.css">
        <link rel="stylesheet" href="/resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="/resources/assets/css/jquery.slitslider.css">
        <link rel="stylesheet" href="/resources/assets/css/style.css">
        <link rel="stylesheet" href="/resources/assets/css/responsive.css">
        <noscript>
        <link rel="stylesheet" type="text/css" href="/resources/assets/css/styleNoJS.css"/>
        </noscript>
        <!-- Font Awesome CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-......" crossorigin="anonymous" />
        <!-- Font Awesome CSS -->
        
        <!-- jQuery cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jQuery cdn -->

<%-- <!-- header  -->
<%@ include file="../include/header.jsp"%>
<!-- header  -->
 --%>
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
									<option value="board">일반글</option>
									<option value="recruit">모집글</option>
									<option value="announcement">공지사항</option>
								</select>
							</div>

							<div class="box-tools">
								<div class="input-group input-group-sm hidden-xs">
									<input style="width: 200px; margin-left: 58px;" type="text"
										name="search" class="form-control pull-right"
										placeholder="키워드를 입력해주세요" value="${map.get('search')}">

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
						<c:if test="${boardList.size() >0 && boardList != null && map.pageNum != map.pageCount}">
								<c:forEach var="i" begin="${(map.pageNum-1)*map.pageSize}" end="${map.pageNum*map.pageSize-1}">
									<tr>
										<td>${boardList[i].b_no}</td>
										<td><c:if test="${boardList[i].b_category == 'board'}">
									일반글
									</c:if> <c:if test="${boardList[i].b_category == 'recruit'}">
									모집글
									</c:if> <c:if test="${boardList[i].b_category =='announcement'}">
												<strong>공지사항</strong>
											</c:if></td>
										<td><a href="/sw/swRead?b_no=${boardList[i].b_no }&b_category=${map.b_category}
										&search=${map.search}&pageNum=${map.pageNum}">
												${boardList[i].b_title } </a></td>
										<td>${boardList[i].b_writer }</td>
										<td><span class="badge bg-yellow">
												${boardList[i].b_viewcnt } </span></td>
										<td><fmt:formatDate value="${boardList[i].b_regdate}" pattern="yyyy.MM.dd HH:mm"/></td>
									</tr>
								</c:forEach>
							</c:if>
						<c:if test="${map.pageNum == map.pageCount }">
								<c:forEach var="i" begin="${(map.pageNum-1)*map.pageSize}" end="${map.count-1}">
									<tr>
										<td>${boardList[i].b_no}</td>
										<td><c:if test="${boardList[i].b_category == 'board'}">
									일반글
									</c:if> <c:if test="${boardList[i].b_category == 'recruit'}">
									모집글
									</c:if> <c:if test="${boardList[i].b_category =='announcement'}">
												<strong>공지사항</strong>
											</c:if></td>
										<td><a href="/sw/swRead?b_no=${boardList[i].b_no }&b_category=${map.b_category}
										&search=${map.search}&pageNum=${map.pageNum}">
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
			<%-- <c:if test="${Sessionscope.id} = null">
			<button style="margin: 10px 0 30px 85%; width: 100px; height: 30px;">
				<a href="/sw/login">글작성</a>
			</button>
			</c:if> --%>
			<%-- <c:if test="${Sessionscope.id} != null"> --%>
			<a href="/sw/swWrite" style="margin: 10px 0 30px 85%; padding:5px 10px; border: #ddd solid 1px; border-radius: 6px;">
				글작성
			</a>
			<%-- </c:if> --%>
		</div>

		<div>
			<!-- 페이징처리  -->
			<div class="box-footer clearfix">
				<div>
					<ul class="pagination pagination-sm no-margin " >
						<c:if test="${map.endPage <= map.pageBlock}">
						<li></li>
						</c:if>
						<c:if test="${map.endPage > map.pageBlock}">
						<li><a href="community?b_category=${map.b_category}&search=${map.search}&pageNum=${map.startPage - map.pageBlock}" 
						onclick="backPage();">«</a></li>
						</c:if>
						
						
						<c:forEach var="pageNum" begin="${map.startPage}" end="${map.endPage}">
							<li><a onclick="inputPageNum(pageNum);" href="community?b_category=${map.b_category}
							&search=${map.search}&pageNum=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						
						<c:if test="${map.pageCount <= map.endPage}">
						<li></li>
						</c:if>
						<c:if test="${map.pageCount > map.endPage}">
						<li><a href="community?b_category=${map.b_category}&search=${map.search}&pageNum=${map.startPage + map.pageBlock}" 
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
		    map.put("startPage", map.get("startPage") + map.get("pageSize"));
		    map.put("endPage", map.get("endPage") + map.get("pageSize"));
		    alert(map.get("startPage"));
		    alert(map.get("endPage"));   
		};

		function backPage(){
		    map.put("startPage", map.get("startPage") - map.get("pageSize"));
		    map.put("endPage", map.get("endPage") - map.get("pageSize"));
		    alert(map.get("startPage"));
		    alert(map.get("endPage"));
		};
        
		function inputPageNum(pageNum){
			map.put("pageNum", pageNum);
		};
		 
		
		
		
       
	</script>



<!-- footer  -->
<%@ include file="../include/footer.jsp"%>
<!-- footer  -->