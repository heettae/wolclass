<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
section {
	display: block;
	border: 1px #ddd solid;
	width: 100%;
	height: auto;
}

a, button:hover {
	cursor: pointer;
}
/* body css   */
.body_box {
	height: 100%;
    display: flex;
}

.body_sidebar_box {
	width: 13%;
	height: 99%;
	background: #353942;
	align-items: center;
	
	
}

.body_section {
	height: 848px;
}
.menu_container{
    height: 90%;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;

}
.side_menu {
	display: flex;
	align-items: center;
	height: 60px;
	padding-left: 15%;
}
.side_menu a{
color: white;
margin-left: 20px;
}
.side_menu:hover{
transition: background 0.8s;
background: #FDC600;

}
.side_menu:hover a{
color: #353942;
transition: color 0.8s;
}
#icon1{
background-image: url('../../../resources/img/member10.png');
}
#icon2{
background-image: url('../../../resources/img/class10.png');
}
#icon3{
background-image: url('../../../resources/img/inquiry10.png');
}
#icon4{
background-image: url('../../../resources/img/board10.png');
}
#icon5{
background-image: url('../../../resources/img/payment10.png');
}
.side_menu:hover #icon1{
background-image: url("../../../resources/img/member11.png");
transition: background-image 0.8s;
} 
.side_menu:hover #icon2{
background-image: url("../../../resources/img/class11.png");
transition: background-image 0.8s;
} 
.side_menu:hover #icon3{
background-image: url("../../../resources/img/inquiry11.png");
transition: background-image 0.8s;
} 
.side_menu:hover #icon4{
background-image: url("../../../resources/img/board11.png");
transition: background-image 0.8s;
} 
.side_menu:hover #icon5{
background-image: url("../../../resources/img/payment11.png");
transition: background-image 0.8s;
} 


.side_icon{
	width: 40px;
	height: 40px;
	align-items: center;
}
.admin_header_button{
display: flex; 
margin: 12px 10px 0 0;
}

.admin_header_button a{
padding: 5px 10px;
margin: 30px;
border-left: 2px #ddd solid; 
border-right: 2px #ddd solid;
}

.content_box{
width: 87%;
}


/* body css   */
</style>
</head>
<body>

	<!-- body  -->
	<section class="body_section">
		<div class="body_box">
			<!-- sidebar  -->
			<div class="body_sidebar_box">
					<div style="FONT-WEIGHT: 550;font-size: 20px;width: 100%;height: 53px;background: #ddd;color: black;justify-content: center;text-align: center;"">
					<div style="padding: 2px; font-size: xx-large;">WOLCLASS</div>
					<div></div>
					
					</div>
				<div class="menu_container">
					<div class="side_menu">
						<div id="icon1" class="side_icon">
						</div>
						<div>
							<a>회원관리</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon2" class="side_icon">
						</div>
						<div>
							<a>클래스관리</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon3" class="side_icon">
							
						</div>
						<div>
							<a>문의관리</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon4" class="side_icon">
						</div>
						<div>
							<a>게시판관리</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon5" class="side_icon">
						</div>
						<div>
							<a>결제내역관리</a>
						</div>
					</div>




				</div>
			</div>
			<!-- sidebar  -->
			
			<!-- main content  -->
			<div class="content_box">
			<!-- header  -->
			<section class="header_section">
				
				<div class="header_container" style="display: flex; justify-content: space-between; border-bottom: #ddd 3px double; padding-right: 5%;">
					<div
						style="list-style-image: url('../../../resources/img/paw1.png');">
						<ul style="margin-top: 12px; padding-right: 450px;">
							<li>로그인한 관리자 id</li>
						</ul>
					</div>
					<div class="admin_header_button" >
						<div>
							<a>클래스신청목록</a>
						</div>
						<div>
							<a>로그아웃</a>
						</div>
					</div>

				</div>
			</section>
			<!-- header  -->
			
			
			</div>
			<!-- main content  -->
		</div>
	</section>
	<!-- body  -->


	<!-- footer  -->
	<section style="height: 100px; background: #ddd;"></section>

	<!-- footer  -->

</body>
</html>