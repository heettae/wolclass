<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<c:set var="isKakao" value="${sessionScope.id.toString().replaceAll('[0-9]','') }" />
<c:if test="${sessionScope.id != null }">
	<c:if test="${isKakao != '' && sessionScope.id.toString().length()<20}">
		<button type="submit" class="btn btn-default" id="logoutBtn" onclick="location.href='/db/logout'">로그아웃</button>
	</c:if>
	<c:if test="${isKakao == '' && sessionScope.id.toString().length()<20}">
		<button type="submit" class="btn btn-default" id="logoutBtn" onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=c6c8f231f2997186bfd65955c7b8f1ab&logout_redirect_uri=http://localhost:8080/db/logout'">로그아웃</button>
	</c:if>
	<c:if test="${sessionScope.id.toString().length()>20 }">
		<button type="submit" class="btn btn-default" id="logoutBtn" onclick="nLogout()">로그아웃</button>
	</c:if>
</c:if>

<script>
 function nLogout(){ 
 	let popup = window.open('https://nid.naver.com/nidlogin.logout?returl=https%3A%2F%2Fwww.naver.com','네이버 로그아웃','width=1,height=1,bottom=0,right=0,location=no'); 
 	window.addEventListener("beforeunload", function() { 
 		popup.close(); 
 	}); 
 	setTimeout(function(){ 
 		location.href="/db/logout"; 
 	},150) 
 } 
</script>

<%@ include file="../include/footer.jsp" %>