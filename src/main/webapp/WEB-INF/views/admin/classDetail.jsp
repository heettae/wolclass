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
  <title>WolClass</title>
<meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/animate.css" media="screen">
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
        <link rel="stylesheet" type="text/css" href="/resources/assets/css/styleNoJS.css" />
        </noscript>
        
        <!-- Font Awesome CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" 
		integrity="sha512-......" 
		crossorigin="anonymous" />
        <!-- Font Awesome CSS -->
	
		<!-- noUiSlider cdn -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.4/nouislider.min.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.4/nouislider.min.js"></script>
		<!-- noUiSlider cdn -->
		
        
        <!-- jQuery cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jQuery cdn -->

<title>Insert title here</title>
</head>
	<body>
		<div>
		 	<div class="box-body table-responsive no-padding" style="width: 1000px;">
					<table class="table table-hover">
						<tbody>
							<tr>
								<td>클래스 이름</td>
								<td colspan="2">${classVO.c_name}</td>
								<td>클래스 번호</td>
								<td colspan="2">${classVO.c_no}</td>
							</tr>
				
							<tr>
								<td>신청자 ID</td>
								<td colspan="2">${classVO.m_id}</td>
								<td>클래스level</td>
								<td colspan="2">
								<c:if test="${classVO.c_level == 1}">입문</c:if>
								<c:if test="${classVO.c_level == 2}">초급</c:if>
								<c:if test="${classVO.c_level == 3}">중급</c:if>
								</td>
							</tr>
							<tr>
								<td>최대 신청인원</td>
								<td colspan="2">${classVO.c_maxperson}</td>
								<td>카테고리</td>
								<td colspan="2">${classVO.c_category}</td>
							</tr>
							<tr>
								<td>클래스 시간</td>
								<td colspan="2">${classVO.c_time}</td>
								<td>가격</td>
								<td colspan="2">${classVO.c_price}</td>
							</tr>
							<tr>
								<td>신청날짜</td>
								<td colspan="5">${classVO.c_regdate}</td>
							</tr>
							<tr>
								<td>주소</td>
								<td colspan="5">${classVO.c_addr1}</td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td colspan="5">${classVO.c_addr2} ${classVO.c_addrdetails}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="5"><textarea rows="10" cols="120" style="border: none;" readonly="readonly">${classVO.c_content}</textarea></td>
							</tr>
							
						
						</tbody>
					</table>
				</div>
					<!-- 이미지  -->
				<label>이미지</label>	
				<div class="img_info">		
					<div class="form-group" id="imgForm">
					<c:forEach var='imgs' items='${classVO.c_img.split(",") }'>
						<img alt="img" src="/resources/img/${imgs}">
					</c:forEach>
					</div>
				</div>
				<!-- 이미지  -->
				
		
		</div>
	
	</body>
</html>