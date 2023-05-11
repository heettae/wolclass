<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/side.jsp" %>

<style>
	.box-big {
		background-image: url("../resources/img/subimg.png");
		background-size: contain;
		background-position: center;
		background-repeat: unset;
		width: 100%;
		height: 500px;
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: auto;
	}
	.box-content {
		color: #fff;
		text-align: center;
		position: absolute;
	}
	.box-content button {
		background-color: darkorange;
		color: white;
		font-size: 1.2rem;
		padding: 1rem 2rem;
		border: none;
		cursor: pointer;
	}
	.box-big h1 {
	  position: relative;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  z-index: 1;
	  color: black;
	}
	.box-small {
	  display: flex;
	  justify-content: center; 
	  align-items: center; 
	  width: 200px;
	  height: 50px;
	  margin: 10px;
	  background-color: antiquewhite;
	  border-radius: 10px;
	  font-size: 18px;
	  font-weight: bold;
	  text-align: center;
	  line-height: 50px;
	}
</style>
<!-- 구독시 5번 50% 할인 -->
<c:set var="vo" value="${sub }"/>
	<div class="container">
		 <div class="box-big">
		  <div class="box-content">
		    <h1>구독시 5번 50% 할인</h1>
		    <button onclick="location.href='#'">구독하기</button>
		  </div>
		</div>
		<div style="margin: auto; width: 450px" >
			<c:if test="${vo != null }">
			  <div class="box-small" style="display: inline-block;">남은기간 : ${vo.day }일</div>
			  <div class="box-small" style="display: inline-block;">잔여횟수 : ${vo.s_cnt }번</div>
			</c:if>
		</div>
	</div>



<!-- side.jsp -->
</div>
</section>
<!-- side.jsp -->
                
<%@ include file="../include/footer.jsp" %>