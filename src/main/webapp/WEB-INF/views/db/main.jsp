<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>



${sessionScope.id }
<c:if test="${sessionScope.id != null}">
	<button type="submit" class="btn btn-default" id="logoutBtn" onclick="location.href='/db/logout'">로그아웃</button>
</c:if>


<%@ include file="../include/footer.jsp" %>