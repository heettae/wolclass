<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<c:set var="isKakao" value="${sessionScope.id.toString().replaceAll('[0-9]','') }" />
<c:if test="${sessionScope.id != null }">
	<c:if test="${isKakao != ''}">
		<button type="submit" class="btn btn-default" id="logoutBtn" onclick="location.href='/db/logout'">로그아웃</button>
	</c:if>
	<c:if test="${isKakao == ''}">
		<button type="submit" class="btn btn-default" id="logoutBtn" onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=c6c8f231f2997186bfd65955c7b8f1ab&logout_redirect_uri=http://localhost:8080/db/logout'">로그아웃</button>
<!-- 	<a href="https://kauth.kakao.com/oauth/logout?client_id=c6c8f231f2997186bfd65955c7b8f1ab&logout_redirect_uri=http://localhost:8080/db/logout">로그아웃</a> -->
	</c:if>
</c:if>


<%@ include file="../include/footer.jsp" %>