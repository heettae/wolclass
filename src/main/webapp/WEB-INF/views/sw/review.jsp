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
<!-- header  --> --%>

<style type="text/css">
.btn-detail {
	font-weight: bold;
	font-size: 15px;
	border-radius: 6px;
	width: 150px;
	height: 45px;
	background: #C9BA9B;
}

.btn-detail:active {
	border: 3px gray inset;
	background: #A58C59;
	color: white;
}

.review_write_container {
	border: black solid 1px;
	margin: auto;
	width: 85%;
}

.detail_container {
	margin-top: 30px;
}

table {
	border: 1px black solid;
	text-align: center;
	margin: auto;
	width: 80%;
	background: #c2c2c2;
	color: white;
}

td {
	border: 1px solid black;
}

textarea {
	width: 100%;
	height: 30%;
	min-height: 250px;
}

/* 댓글 css  */
.review_write_input {
	display: flex;
	width: 100%;
}

.review_write {
	border: 1px #ddd solid;
	width: 80%;
	border-radius: 6px;
	height: 37px;
	margin: 30px auto;
}

.input_btn1 {
	border-radius: 6px;
	height: 35px;
	width: 80px;
	background: #FDC600;
	color: white;
	font-size: 15px;
}
.input_btn {
	border-radius: 6px;
	height: 30px;
	width: 80px;
	background: #FDC600;
	color: white;
	font-size: 15px;
}

.input_btn:hover {
	background: #c2c2c2;
	transition: all 1s ease;
}

.review_list_container {
	margin: auto;
	width: 80%;
	border: 1px #ddd solid;
	margin-bottom: 50px;
}

.comment {
	display: flex;
}

/* 댓글 css  */
</style>



<!-- body  -->
<div
	style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">

				<!-- content  -->

				<div
					style="display: block; width: 80%; border: solid 1px gray; padding: 55px; border-radius: 5px; margin: auto;">
					<!-- detail_header  -->
					<div style="display: flex; padding-bottom: 30px; margin-left: 13%;"
						class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글 조회</h3>
						</div>
					</div>
					<!-- detail_header  -->
					<div class="review_write_container">
						<div class="review_write">
							<form role="form" method="post">
								<div class="review_write_input">
									<div style="width: 100%;">
										<input type="text" name="r_content" placeholder="댓글을 작성해주세요.">
									</div>
									<div>
										<button type="submit" class="input_btn1">댓글작성</button>
									</div>
								</div>
							</form>
						</div>

						<div class="review_list_container">
							<div class="review_list">
								<c:if test="${reviewList.size() >0 && reviewList != null && map.pageNum != map.pageCount}">
									<c:forEach var="i" begin="${(map.pageNum-1)*map.pageSize}"	end="${map.pageNum*map.pageSize-1}">
										<div
											style=" border: 1px solid; padding: 5px 20px 5px 5px; height: 100px;">
												<form id="comment" method="post" style="display: flex;justify-content: space-between;">
											<div style="width: 15%; text-align: center; border-right: #ddd 1px double;">
												<div>
												<p style="padding-top: 1rem;">작성자 ID</p>
												</div>
												<input style="text-align: center;" type="text"
													readonly="readonly" value="${reviewList[i].m_id}">
											</div>
												<input type="hidden" name="r_no" value="${reviewList[i].r_no}">
											<div style="width: 65%;">
												<div style="height: 80%;">
													<input id="r_content1" name="r_content" type="text" readonly="readonly"
														value="${reviewList[i].r_content }">
												</div>
												<input style="height: 20%; padding-left: 50%;" type="text"
													readonly="readonly"
													value="작성일 : ${reviewList[i].r_regdate.toString().split(' ')[0]}">
											</div>
											<div
												style="list-style: none; padding: 5px; margin: 0; display: flex; flex-direction: column; justify-content: space-around;">
												
													<div class="input_btn" id="commentRegist">
														<button onclick="comUp();" class="input_btn">수정</button>
													</div>
													<div class="input_btn" style="display: none;" id="commentUpdate">
														<button onclick="upOK();" class="input_btn">수정완료</button>
													</div>
													<div class="input_btn" id="commentDelete">
														<button onclick="comDel();" class="input_btn">삭제</button>
													</div>
													<div style="display: none;" class="input_btn" id="updateCancel">
														<button onclick="upCan();" class="input_btn">수정취소</button>
													</div>
											</div>
												</form>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${map.pageNum == map.pageCount }">
									<c:forEach var="i" begin="${(map.pageNum-1)*map.pageSize}"
										end="${map.count-1}">
										<div
											style=" border: 1px solid; padding: 5px 20px 5px 5px; height: 100px;">
											<form id="review" method="post" style="display: flex;justify-content: space-between;">
												<div style="width: 15%; text-align: center; border-right: #ddd 1px double;">
													<div>
													<p style="padding-top: 1rem;">작성자 ID</p>
													</div>
													<input style="text-align: center;" type="text"
														readonly="readonly" value="${reviewList[i].m_id}">
												</div>
												<div style="width: 65%;">
													<div style="height: 80%;">
														<input id="r_content1" name="r_content" type="text" readonly="readonly"
															value="${reviewList[i].r_content }">
													</div>
													<input style="height: 20%; padding-left: 50%;" type="text"
														readonly="readonly"
														value="작성일 : ${reviewList[i].r_regdate.toString().split(' ')[0]}">
												</div>
												<div
													style="list-style: none; padding: 5px; margin: 0; display: flex; flex-direction: column; justify-content: space-around;">
													<div class="input_btn" id="reviewRegist">
															<button onclick="comUp();" class="input_btn">수정</button>
														</div>
														<div class="input_btn" style="display: none;" id="commentUpdate">
															<button onclick="upOK();" class="input_btn">수정완료</button>
														</div>
														<div class="input_btn" id="commentDelete">
															<button onclick="comDel();" class="input_btn">삭제</button>
														</div>
														<div style="display: none;" class="input_btn" id="updateCancel">
															<button onclick="upCan();" class="input_btn">수정취소</button>
														</div>
												</div>
											</form>
										</div>

									</c:forEach>
								</c:if>
							</div>
							<div class="box-footer clearfix" style="margin-top: 30px;">
								<div style="width: 100%; display: flex;">
									<ul class="pagination pagination-sm no-margin pull-right"
										style="margin: auto;">
										<c:if test="${map.endPage <= map.pageBlock}">
											<li></li>
										</c:if>
										<c:if test="${map.endPage > map.pageBlock}">
											<li><a
												href="swRead?b_no=${map.b_no}&pageNum=${map.startPage - map.pageBlock}"
												onclick="backPage();">«</a></li>
										</c:if>


										<c:forEach var="pageNum" begin="${map.startPage}"
											end="${map.endPage}">
											<li><a onclick="inputpageNum(pageNum);"
												href="review?c_no=${map.c_no}&pageNum=${pageNum}">${pageNum}</a></li>
										</c:forEach>

										<c:if test="${map.pageCount <= map.endPage}">
											<li></li>
										</c:if>
										<c:if test="${map.pageCount > map.endPage}">
											<li><a
												href="swRead?b_no=${map.b_no}&pageNum=${map.startPage + map.pageBlock}"
												onclick="nextPage();">»</a></li>
										</c:if>
									</ul>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- content  -->
		</div>
	</div>
						<script type="text/javascript">
						var result = "${result}";
						
						if (result == "ok") {
							alert("정상적으로 댓글 작성 완료!");
						}
						if (result == "updOK") {
							alert("댓글 수정 완료!");
						}
						if (result == "delOK") {
							alert("댓글 삭제 완료!");
						}

						
						
						
						
							function backList() {
								window.location.href = "community?b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}";
							}
							
							function comUp() {
								
								  document.getElementById("commentRegist").style.display = "none";
								  document.getElementById("commentDelete").style.display = "none";
								  
								  document.getElementById("commentUpdate").style.display = "block";
								  document.getElementById("updateCancel").style.display = "block";
								  document.getElementById("r_content1").readOnly = false;
								  document.getElementById("r_content1").focus();

								}
							function upCan() {
								location.reload();
								}
							
							function upOK() {
								if(confirm("정말로 진행하시겠습니까?")){
									$(document).ready(function(){
								    	 // 글번호를 저장한 폼태그
								    	 var formObj = $("#comment");
								    	 // alert(formObj);
								    	 console.log(formObj);
								    	 
								    	 // 글삭제하기
							     		formObj.attr("action","/sw/comUpdate");
							     		// submit
							     		formObj.submit();
								     		
								     	});
								  
								return window.location.href = "swRead?b_no=${map.b_no}&b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}";
								}else
								return window.location.href = "swRead?b_no=${map.b_no}&b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}";
									
							}
							function comDel() {
								if(confirm("정말로 진행하시겠습니까?")){
									$(document).ready(function(){
								    	 // 글번호를 저장한 폼태그
								    	 var formObj = $("#comment");
								    	 // alert(formObj);
								    	 console.log(formObj);
								    	 // 글삭제하기
							     		formObj.attr("action","/sw/comRemove");
							     		// submit
							     		formObj.submit();
								     		
								     	});
								    	 
								return window.location.href = "swRead?b_no=${map.b_no}&b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}";
									} else {
								return window.location.href = "swRead?b_no=${map.b_no}&b_category=${param.b_category}&search=${param.search}&pageNum=${param.pageNum}";
									
									}
								  
								}
							
							
							
							
							
							$(document).ready(function(){
						    	 // 글번호를 저장한 폼태그
						    	 var formObj = $("#commentRemove");
						    	 // alert(formObj);
						    	 console.log(formObj);
						    	 
						    	 
						    	// 수정
								  $(".btn-warning").click(function(){
									  // 수정 - 기존의 정보 출력(GET)
									  // 폼태그 이동주소 설정 /boards/modify
									  formObj.attr("action","/boards/modify");
									  // 폼태그 이동방식 설정 GET
									  formObj.attr("method","post");
									  // 폼태그 정보 저장해서 페이지 이동
									  formObj.submit();			  
								  });
							});
							
							
							
							
							
							
							$(document).ready(function(){
						    	 // 글번호를 저장한 폼태그
						    	 var formObj = $("#commentRemove");
						    	 // alert(formObj);
						    	 console.log(formObj);
						    	 
						    	 
						    	// 수정
								  $(".btn-warning").click(function(){
									  // 수정 - 기존의 정보 출력(GET)
									  // 폼태그 이동주소 설정 /boards/modify
									  formObj.attr("action","/boards/modify");
									  // 폼태그 이동방식 설정 GET
									  formObj.attr("method","post");
									  // 폼태그 정보 저장해서 페이지 이동
									  formObj.submit();			  
								  });
							});
							
							
							
							
						</script>
</div>
<!-- body  -->



