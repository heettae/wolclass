<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
.side_menu1{
	background: #FDC600;

}
.side_menu1 a{
	color: #353942;
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
#icon6{
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
.side_menu:hover #icon6{
	background-image: url("../../../resources/img/payment11.png");
	transition: background-image 0.8s;
} 
.side_menu1 #icon1{
	background-image: url("../../../resources/img/member11.png");
} 
.side_menu1 #icon2{
	background-image: url("../../../resources/img/class11.png");
} 
.side_menu1 #icon3{
	 background-image: url("../../../resources/img/inquiry11.png");
} 
.side_menu1 #icon4{
	 background-image: url("../../../resources/img/board11.png");
} 
.side_menu1 #icon5{
	background-image: url("../../../resources/img/payment11.png");
} 
.side_menu1 #icon6{
	background-image: url("../../../resources/img/payment11.png");
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
	idth: 87%;
}



/* body css   */



</style>

	<!-- body  -->
	<section class="body_section">
		<div class="body_box"> 
<div class="body_sidebar_box">
				<div class="menu_container">
					<div class="side_menu">
						<div id="icon1" class="side_icon">
						</div>
						<div>
							<a href="/admin/memberList">회원관리</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon2" class="side_icon">
						</div>
						<div>
							<a href="/admin/classList">클래스관리</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon3" class="side_icon">
							
						</div>
						<div>
							<a href="/admin/msgList">문의관리</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon4" class="side_icon">
						</div>
						<div>
							<a href="/admin/boardList">게시판관리</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon5" class="side_icon">
						</div>
						<div>
							<a href="/admin/reviewList">수강후기관리</a>
						</div>
					</div>
					<div class="side_menu">
						<div id="icon6" class="side_icon">
						</div>
						<div>
							<a href="/admin/payList">결제내역관리</a>
						</div>
					</div>




				</div>
			</div>
			
			<script type="text/javascript">
			
			
			
			</script>