<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<c:choose>
		<c:when test="${not empty sessionScope.id }">
			<script>
			window.opener.location.reload();
			self.close();
			</script>
		</c:when>
		<c:otherwise>
			<p>
				아이디 혹은 비밀번호가 틀려요!
				<a href="loginform.do?url=${encodedUrl }">다시 로그인 하러 가기</a>
			</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>






