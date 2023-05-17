<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<meta charset="UTF-8">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>


<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<title>Insert title here</title>
  <style>
  
  	body{
  	font-size: 18px;
  	}
  
    .sidebar-property {
    background-color: #EEE;
    padding: 15px 25px 25px;
    margin-left: 15px;
    border-radius: 15px;
    }
	.blog-asside-right {
    padding-top: 15px;
    padding-bottom: 15px;
    }

    h4[id*=toggle]{
    margin-top: 20px;
    margin-bottom: 10px;
    }

	#toggle4{
	border-top: 1px solid #cdcdcd;
    padding-top: 10px;
    border-bottom: 0;
    }
	
	h6{
	margin-top: 1px;
    margin-bottom: 1px;
	}


	.property-info-entry .property-info-label{
	font-size: 20px;
    margin-bottom: 3px;
    color: #FFA500;
    padding-bottom: 5px;
	}
	
	.single-property-header{
	padding-top: 50px;
	}


	#menu{
	border-bottom: 5px solid #e7e7e7;
	font-size: 20px;

	}
	
	#menu a{
	font-size: 20px;
	}

	#div_review{
	border-bottom: 5px solid #e7e7e7;
    margin-bottom: 15px;
	}
	
	.review_list{
	height: 350px;
	}
	
	#div_review ul {
     list-style: none;
     display: table;
 	 width: 100%;
 	 padding-inline-start : 0px;
	}
	
	#div_review li {
	display: inline-block;

	}
	#div_review li:first-child {
  	width: 150px
	}
	
	#div_review li:last-child {
	display: table-cell;
  	text-align: right;
  	width: 150px;
	}
	
	.s-property-title {
    margin-bottom: 25px;
    color: #FFA500;
    font-size: 25px;
    }
	.pagination{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    justify-content: center;
	}


  </style>
<script type="text/javascript">
//특정날짜들 배열
//var disabledDays = ["2023-4-23","2023-4-24","2023-5-1"];
var ableDays = new Array();
var c_no = ${classVO.c_no};
var date = null;
var time = null;
var t_start = new Array();
var pNum = null;
var price;
var p_no = null;
$(document).ready(function() {
	console.log(date)
	$("#time").hide();
	$("#pNum").hide();
 	$("#toggle2, #toggle3,#toggle4, #discount").hide();

	
	
	
    $( "#thdatepicker" ).datepicker({
    	 dateFormat: 'yy-mm-dd',
         prevText: '이전 달',
         nextText: '다음 달',
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         dayNames: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
         showMonthAfterYear: true,
         yearSuffix: '년',
         minDate: 0,
         beforeShowDay: ableAllTheseDays,
         onSelect: getTime

    });
    

    function getTime() { 
           
   	  $('#selectedDate').val(date);
   	 date = $.datepicker.formatDate("yy-mm-dd",$("#thdatepicker").datepicker("getDate")); 
   	 date = $("#thdatepicker").val();
   	 
   	 
//         alert(date);
        if(date!=null){
       	 console.log(date+"null아님~!1111");
       	 
       	 //시간 선택
       	 $.ajax({
				url:"/class/getTime",
				type:"post",
			 	data: JSON.stringify({t_date:date, c_no:c_no}),
			 	contentType: "application/json; charset=utf-8",
				dataType:"json",
				success:function(data){
// 					alert("성공");
					console.log(data);

					
				 	//$("#time").show();
				 	
				 	//$("#toggle1").click();
				 	$("#toggle2").show();
				 	$("#toggle2").click();
			        var $time = $("#time");
			        $time.empty(); // 기존 옵션을 모두 지웁니다.
			       	var $dft = $("<option>").text("시간 선택").val(null);
			        $time.append($dft);
			        $.each(data, function(index, time) {
			            var $option = $("<option>").text(time.t_start).val(time.t_start); 
			            $time.append($option);
			          
			        }); // each문 닫기

				},	
				error:function(data){
					alert("실패");
					// 페이지 이동 후 실패했을 때 동작
				}
			}); // 시간 선택 ajax
        }
 
    } 
/*     time = $time.val();
    if(time!=null){
    	alert(time+"dd");
    getPNum
    }
    function getPNum(){
    	 // 인원 선택 
    	 alert("getPNum");
    	 
    } */

    
    
}); // function() 끝
function timeSelected(){
	   // if($("#time").val()!=null){
	    	time = $("#time").val();
	    	
// 	    	alert(time+"dd");
	    	
	    	
	       	 // 최대 인원 가져오기ajax
	       	 $.ajax({
					url:"/class/getPNum",
					type:"post",
				 	data: JSON.stringify({t_date:date, c_no:c_no, t_start:time}),
				 	contentType: "application/json; charset=utf-8",
					dataType:"json",
					success:function(data){
// 						alert("인원 가져오기 성공");
						console.log(data.t_rem_p);
						pNum=data.t_rem_p;
						let t_no = data.t_no;
						$("#t_no").val(t_no);
						console.log(pNum);
					 	//$("#pNum").show();
					 	
						//$("#toggle2").click();
					 	$("#toggle3").show();
					 	$("#toggle3").click();
					 	$("#toggle4").show();
					 	$("#toggle4").click();
					 	$("#pNum").attr('max', pNum);
					 	$('#pNumS').text('예약 가능한 최대 인원은 '+pNum+'명 입니다');
					 	


					},	
					error:function(data){
						alert("실패");
						// 페이지 이동 후 실패했을 때 동작
					}
				}); // 최대 인원 가져오기 ajax

	    };

	function changePNum(){
// 	 	if($("#pNum").val()>pNum){
		 	
// 		 	alert(pNum+"명 이하로 입력하세요");
// 		 	$("#pNum").val(1);
// 		 	// 여기 바꾸기
// 		 	}
	}
	
	function changePoint(){
	
	// 	let point = ${memberVO.m_point };
	// 	 	if($("#point").val()>point){
	// 		 	alert("보유 포인트 초과 (보유 포인트 : "+point+"p)");
	// 		 	}
	}
	
	$(document).ready(function(){
		  let memberPoint = Number('${memberVO.m_point }');
	  $('#time, #pNum, #point, #subs').on('input', function(){
// 		  if(!($('#point').val()>=0)){
// 			  $('#point').val(0);
// 		  }
// 		  if(!($('#pNum').val()>=1)){
// // 			  $('#pNum').val(0);
// 			  parseInt($("#pNum").val(0));
// 		  }

		  var point = $('#point').val() ? $('#point').val() : 0;
		  var subs = $('#subs').prop('checked') ? 0.5 : 1;
		  var bPrice = ${classVO.c_price};
		  price = (bPrice*subs)+(bPrice*($("#pNum").val()-1)) - point;
		  if($("#point").val()>memberPoint){
			 	alert("보유 포인트 초과 (보유 포인트 : "+memberPoint+"p)");
			 	$('#point').val(memberPoint);
		 	}
		  
// 	 	  if($("#pNum").val()>pNum){
// 		 	alert(pNum+"명 이하로 입력하세요");
// 		 	parseInt($("#pNum").val(0));
// 		  }
		  
		  if(price < 0){
			   $('#point').val(0);
			   $('#subs').prop('checked', false);
			   $("#priceDisplay").text(bPrice + "원");
			   
		  }else{
			  
	        var formattedPrice = new Intl.NumberFormat('ko-KR').format(price); // 가격 포맷
	        $("#priceDisplay").text(formattedPrice + "원"); // 가격 출력
		  }
	  
	   
	  })
	});
	    
	$(document).ready(function(){
      fnDatepicker("#thdatepicker");
      $("#thdatepicker").val(getToday('yyyy-mm-dd'));
    });


    // 현재 날짜
    function getToday(type){
      var date = new Date();
      var year = date.getFullYear();
      var month = date.getMonth()+1;
      var day = date.getDate();
      if(month < 10){
        month = "0"+month;
      }
      if(day < 10){
        day = "0"+day;
      }

      var today = '';
      if(type == 'yyyy-mm-dd'){
        today = year + "-" + month + "-" + day;
      }else {
        today = year + "" + month + "" + day;
      }

      return today;
    }
    
    // 특정일 선택막기
    function disableAllTheseDays(date) {
        var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
        for (i = 0; i < disabledDays.length; i++) {
            if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
                return [false];
            }
        }
        return [true];
    }
	 
	 // 특정일 선택막기
    function ableAllTheseDays(date) {
        var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
        for (i = 0; i < ableDays.length; i++) {
            if($.inArray(y + '-' +(m+1) + '-' + d,ableDays) != -1) {
                return [true];
            }
        }
        return [false];
    }
	 
var vaildDates = '${dateList }';
var vaildDatesArr = vaildDates.split('t_date=');
for(var i=1; i<vaildDatesArr.length; i++){
	ableDays.push(vaildDatesArr[i].split(',')[0].replaceAll('-0','-'));
}


for(var i=0; i<ableDays.length; i++){
	console.log(ableDays[i]);
}

$(document).ready(function(){
	$("#toggle1").click(function(){
		$("#thdatepicker").slideToggle();
	});

	
	$("#toggle2").click(function(){
		 $("#time").slideToggle();
	});
	$("#toggle3").click(function(){
		$("#pNum").slideToggle();
	});
	$("#toggle4").click(function(){
		$("#discount").slideToggle();
	});
	
});


</script>
<body>
<%-- <h1>${id }</h1> --%>
<%-- ${memberVO } --%>
<%-- ${memberVO.m_point } --%>


        <!-- property area -->
        <div class="content-area single-property" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">   

                <div class="clearfix padding-top-40" >

                    <div class="col-md-8 single-property-content prp-style-1 " id="main">
                        <div class="row">
 
                            <div class="light-slide-item">            
                                <div class="clearfix">
                                    <div class="favorite-and-print">
                                    
                                    <!-- 위시리스트 -->
									<c:if test="${not empty sessionScope.id }">
							        <button class="wishlist-btn ${wishList.contains(classVO.c_no) ? 'active' : ''}" value="${classVO.c_no }">
							          <i class="fas fa-heart"></i>
							        </button>
							        </c:if>

                                    </div> 
                                    <div style="height:500px;">
                                    <img src="../resources/img/${classVO.c_img.split(',')[0] }" width="100%"/>
									</div>
                          	  </div>
                        	</div>

						</div>


                        <div class="single-property-wrapper">
                            <div class="single-property-header">                                          
                                <h1 class="property-title pull-left">${classVO.c_name }</h1>
                                <span class="property-price pull-right">
                               <fmt:formatNumber value="${classVO.c_price }" groupingUsed="true"/>원
                                </span>
                            </div>

     

                            <div class="property-meta entry-meta clearfix ">   

                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-entry">
                                        <span class="property-info-label">주소</span>
                                        <span class="property-info-value">${classVO.c_addr1 }</span>
                                    </span>
                                </div>
                                
                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-entry">
                                        <span class="property-info-label">수업소요시간</span>
                                        <span class="property-info-value">${classVO.c_time }</span>
                                    </span>
                                </div>


                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-entry">
                                        <span class="property-info-label">난이도</span>
                                        <c:if test="${classVO.c_level==1 }">
                                        <span class="property-info-value">입문</span>
                                        </c:if>
                                        <c:if test="${classVO.c_level==2 }">
                                        <span class="property-info-value">중급</span>
                                        </c:if>
                                        <c:if test="${classVO.c_level==3 }">
                                        <span class="property-info-value">고급</span>
                                        </c:if>
                                    </span>
                                </div>

                                <div class="col-xs-6 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-entry">
                                        <span class="property-info-label">최대인원</span>
                                        <span class="property-info-value">${classVO.c_maxperson }명</span>
                                    </span>
                                </div>


                            </div>
                            <!-- .property-meta -->


							 <div class="section property-features">      

<!--                                 <h4 class="s-property-title">Features</h4>                             -->
                                <ul id="menu">
                                    <li class="wow fadeInDown animated" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInDown;"><a href="#detail">클래스 소개</a></li>  
                                    <li class="wow fadeInDown animated" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInDown;"><a href="#address">위치</a></li>  
                                    <li class="wow fadeInDown animated" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInDown;"><a href="#review">후기</a></li>  

                                </ul>

                            </div>
                          
                            <!-- End features area  -->


						<!-- 클래스 소개 -->
                            <div class="section" id="detail">
                                <h3 class="s-property-title">클래스 소개</h3>
                                
								<c:if test="${not empty classVO.c_img}">
								  <c:set var="images" value="${fn:split(classVO.c_img, ',')}" />
								  <c:forEach items="${images}" var="image" begin="1">
								    <c:if test="${not empty image}">
								      <img style="padding-bottom: 10px;" src="../resources/img/${image}"  width="100%"/>
								    </c:if>
								  </c:forEach>
								</c:if>
	
                                <div class="s-property-content">
									<p style="white-space: pre-line; font-size: 16px;">${classVO.c_content }</p>
                                </div>
                            </div>
                         <!-- 클래스 소개  -->
                            
         			
         			
         				 <!-- 주소 -->
                            <div class="section additional-details">

                            <h4 class="s-property-title" id="address">위치</h4>
                            <div id="map" style="width:100%;height:350px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0855a981db011b9c4778f98b0871b031"></script>
							<script>
							var lat = Number('${classVO.c_lati}');
							var lng = Number('${classVO.c_longi}');
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = { 
							        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };
							
							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
// 							map.setDraggable(false);
// 							map.setZoomable(false);
							
							var markerPosition  = new kakao.maps.LatLng(lat, lng); 

							var marker = new kakao.maps.Marker({
							    position: markerPosition
							});

							marker.setMap(map);
							
							</script>

							<p style="font-size: 16px; padding-top: 10px;">${classVO.c_addr1 } ${classVO.c_addr2 } ${classVO.c_addrdetails }</p>
                                
                            </div>  
                            <!-- 주소  -->

                 

                            <div class="section property-video"> 
                                <h4 class="s-property-title" id="review">후기</h4> 
							<!-- 후기 -->

							<div class="review_write_container">
									<div class="review_list_container">
										<div class="review_list">
										<c:if test="${reviewList.size() == 0}">
										<div style="text-align-last: center;">아직 등록된 후기가 없어요</div>
										</c:if>

										<c:if test="${reviewList != null && reviewList.size() > 0}">
											<c:forEach var="vo" items="${reviewList }">
												<div id="div_review">
													<div>
													<ul>
														<li>${vo.m_id}</li>
														<li>
														<c:forEach begin="1" end="${vo.r_score }">
														   <img alt="별" src="/resources/img/star5.png">
														   </c:forEach>
														<c:if test="${vo.r_score < 5}">
														   <c:forEach begin="1" end="${5-vo.r_score}">
														   <img alt="빈별" src="/resources/img/star6.png">
														   </c:forEach>
														</c:if>
														</li>
														<li>
														${vo.r_regdate.toString().split(' ')[0]}
														</li>
														</ul>
													</div>
													<div>${vo.r_content }</div>
													</div>
												</c:forEach>
											</c:if>
										</div>
							        <!-- 후기페이징  -->
									<div class="pagination">
										<ul>
											<c:if test="${map.startPage > map.pageBlock }">
												<li><a style= "cursor: pointer;" onclick="getList(${map.startPage-1})">이전</a></li>
											</c:if>
											
											<c:forEach var="i" begin="${map.startPage }" end="${map.endPage }">
												<li><a style= "cursor: pointer;" onclick="getList(${i})">${i }</a></li>
											</c:forEach>
											
											<c:if test="${map.pageCount > map.endPage }">
												<li><a style= "cursor: pointer;" onclick="getList(${map.endPage+1})">다음</a></li>
											</c:if>
										</ul>
									</div>
									<!-- 페이지 이동시 데이터 처리 -->
									<script type="text/javascript">
									const criteria = new Object();
									criteria.c_no = Number('${map.c_no}');
									criteria.pageNum = 1;
									criteria.startPage = Number('${map.startPage}');
									criteria.endPage = Number('${map.endPage}');
									criteria.pageCount = Number('${map.pageCount}');
									criteria.pageBlock = Number('${map.pageBlock}');

									
									function getList(pageNum){
										criteria.pageNum = pageNum;
										$.ajax({
											url: "/replyrest/list",
											type: "POST",
											data: criteria,
											success: function(data) {
												var html = "";
												$.each(data.reviewList, function(index, vo) { // 데이터를 순회하면서 HTML 코드 생성
											        html += "<div id='div_review'>";
											        html += "<div><ul><li>" + vo.m_id + "</li><li>";
											        for (var i = 1; i <= vo.r_score; i++) {
											          html += "<img alt='별' src='/resources/img/star5.png'>";
											        }
											        if (vo.r_score < 5) {
											          for (var i = 1; i <= 5 - vo.r_score; i++) {
											            html += "<img alt='빈별' src='/resources/img/star6.png'>";
											          }
											        }
											        html += "</li><li>";
											        html += new Date(vo.r_regdate).toISOString().split("T")[0];
											        html += "</li>";
											        html += "</div>";
											        html += "<div>"+ vo.r_content + "</div>";
											        html += "</div>";
											      });
												
												
												$('.review_list').html(html);
												criteria.startPage = Number(data.map.startPage);
												criteria.endPage = Number(data.map.endPage);
												criteria.pageCount = Number(data.map.pageCount);
												criteria.pageBlock = Number(data.map.pageBlock);
												console.log(criteria);
												html = "<ul>";
												if(criteria.startPage > criteria.pageBlock) {
													html += "<li><a style='cursor: pointer;' onclick='getList("+(criteria.startPage-1)+")'>이전</a></li>";
												}
												for(var i=criteria.startPage; i<=criteria.endPage; i++){
													html += "<li><a style='cursor: pointer;' onclick='getList("+i+")'>"+i+"</a></li>";
												}
												if(criteria.pageCount > criteria.endPage) {
													html += "<li><a style='cursor: pointer;' onclick='getList("+(criteria.endPage+1)+")'>다음</a></li>";
												}
												html += "</ul>";
												$('.pagination').html(html);
											},
											error: function(data) {
												console.log("후기 가져오기 실패 : "+data);
											}
										});
									}
									</script> 
									<!-- 페이지 이동시 데이터 처리 -->
									 <!-- 후기페이징  -->
									</div>
								</div>
							</div>
							<!-- 후기 내용  -->



                            
                            
						

                            
                        </div>
                    </div>

					<!-- sidebar -->
                    <div class="col-md-4 p0"  id="sidebar">
                        <aside class="sidebar sidebar-property blog-asside-right">
                     


							<div
								class="panel panel-default sidebar-menu wow fadeInRight animated">
								
	
								
<!-- 					<form role="form" method="post">  -->
<!-- 					<input type="hidden" id="p_no" name="p_no"> -->
<!-- 					<input type="hidden" id="t_no" name="t_no"> -->
<%-- 					<input type="hidden" id="m_id" name="m_id" value="${id }"> --%>
<!-- 					<input type="hidden" id="selectedDate" name="selectedDate"> -->
<%-- 					<input type="hidden" id="c_no" name="c_no" value="${classVO.c_no }"> --%>
<%-- 					<input type="hidden" id="c_price" name="c_price" value="${classVO.c_price }"> <!-- 클래스 가격 --> --%>
<!-- 					<input type="hidden" id="price" name="price"> 계산된 가격 -->
					<h3>예약하기</h3>

					<h4 id="toggle1">1. 날짜를 선택하세요.</h4>
					<div id="thdatepicker"></div>

					<h4 id="toggle2">2. 시간을 선택하세요.</h4>
                     <select id="time" name="t_start" class="selectpicker show-tick form-control" onchange="timeSelected()"></select>
                     
                    <h4 id="toggle3" >3. 인원을 선택하세요.</h4>
                    <small id = "pNumS"></small>
                    <input type="number" id="pNum" name="pNum" class="selectpicker show-tick form-control" min="1" value="1" onchange="changePNum()">
					
                    <h4 id="toggle4">할인</h4>
					<div id="discount">
					<c:if test="${id!=null }">
						<label>포인트</label>
						<small>(보유 포인트 <fmt:formatNumber value="${memberVO.m_point }"/>p)</small>
						<input id="point" type="number" name="point" class="selectpicker show-tick form-control"  min="0" max="${memberVO.m_point }" step="100" value="0" onchange="changePoint()">
						<c:if test="${subscriptionVO.s_no != null && subscriptionVO.s_cnt>0 }">
						<br>
						<input type="checkbox" id="subs" name="subs" style="width:18px; height:18px;">
						<label>구독 사용하기</label> <small>(남은 횟수 : ${subscriptionVO.s_cnt })</small>
						</c:if>
					</c:if>
					</div>
					
					
					<div id="price" class="single-property-header">
						<span id="priceDisplay" class="property-price pull-right">
						<fmt:formatNumber value="${classVO.c_price }"/>원
						</span>
					</div>
<!-- 					</form> -->
					<button type="submit" class="navbar-btn nav-button wow bounceInRight" id="reserve" style="width:100%">클래스 예약하기</button>		
								
								
								
							
                    </div>
                    </aside>
                </div>

            </div>
        </div>

</div>

</body>

<script type="text/javascript">
$(document).ready(function(){

  $("#reserve").click(function(){
	 if( ${id == null}){
	  location.href='/member/login';
	  return;
	 }

		 //alert('결제창띄우기');
	        var IMP = window.IMP; 
	        IMP.init("imp75550270"); 
	       	
	        
	        $.ajax({
					url:"/payrest/getP_no",
					type:"post",
				 	//contentType: "application/json; charset=utf-8",
					dataType:"json",
					success:function(data){
						//alert("p_no 가져오기");
						console.log(data);
						p_no = data;
						$('#p_no').val(p_no);
					
					},	
					error:function(data){
						alert("실패");
						// 페이지 이동 후 실패했을 때 동작
					}
				}); // p_no ajax

	       
				//$("#d_file").append("<input type='hidden' name='file"+cnt+"'><br>");
				
				date = $("#thdatepicker").val();
				$('#selectedDate').val(date);
				$('#price').val(price);
						
					

				IMP.request_pay({
			    pg : 'html5_inicis.INIpayTest',
			    pay_method : 'card',
			    merchant_uid: p_no, // 상점에서 관리하는 주문 번호${p_no}
			    name : "${classVO.c_name}",
			    amount : price,
			    buyer_email: "${memberVO.m_email}",
			    buyer_name: "${memberVO.m_name}",
			    buyer_tel: "${memberVO.m_phone}"
			   // ,buyer_addr : '서울특별시 강남구 삼성동',
			   // buyer_postcode : '123-456'
			}, function(rsp) {
				if ( rsp.success ) {
// 			    alert("결제까지 성공했음");
			    //alert($("#pNum").val());
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	var result = {
					"imp_uid" : rsp.imp_uid,
					"merchant_uid" : rsp.merchant_uid,
					"p_no" : p_no,
					"t_no" : $("#t_no").val(),
					"m_id" : "${id}",
					"selectedDate": $("#thdatepicker").val(),
					"c_no": c_no,
					"t_start":$("#time").val(),
					"peopleNum": $("#pNum").val(),
					"point" : $('#point').val(),
					"subs": $('#subs').is(':checked'),
					"c_price" : "${classVO.c_price}" ,
					"price" : rsp.paid_amount,
					"status" : rsp.status
					}
			   		console.log(result);

			    	jQuery.ajax({
			    		url: "/payrest/insertPaymentInfo", //cross-domain error가 발생하지 않도록 주의해주세요
			    		type: 'POST',
				    		//contentType : "application/json",
			    		data: JSON.stringify(result),
			    		contentType:'application/json;',
				        success: function(res){
					        console.log(res);
				        	if (res === "ok") {		    	
				        		//console.log("insert ok!");
	
				        	}else{
					            console.log("Insert Fail!!!");
					        }
					     },
				        error:function(){
				          console.log("Insert ajax 통신 실패!!!");
				        }
			    	
			    	
			    	
			    	}).done(function(data) {
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		console.log("done"+data);
			    		console.log("done"+rsp.imp_uid);
			    		
			    		 $.ajax({
			    	            url: "/payrest/complete",
			    	            type: "POST",
					    		data: JSON.stringify(result),
					    		contentType:'application/json;',
						        success: function(r){
						        	//alert("complete 호출")
						        	console.log("r : "+r);
						        	
						        	 if (r === "success") {
							    		 $.ajax({
						    	            url: "/payrest/orderSuccess",
						    	            type: "POST",
								    		data: JSON.stringify(result),
								    		contentType:'application/json;',
									        success: function(orderSuccessCnt){
									        	if(orderSuccessCnt >= 1) {
									        		var msg = '결제가 완료되었습니다.';
									    			alert(msg);
									    			location.href='/member/classList';
									        	}
									        }
						        		});
						    		} else {
						    			//[3] 아직 제대로 결제가 되지 않았습니다.
						    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
						    		}	
						        } // complete success
			    		 }); // ajax

			    		
			    	}); // done
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        
			        alert(msg);
			    }
			});					
						

			  
  });

		  
 });
 
 
 

</script>
<%@ include file="../include/detailFooter.jsp" %>
