<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
	<p class="alert alert-danger">${exception.message }</p>
	<a href="${pageContext.request.contextPath }/home.do">인덱스로 가기</a>
	<a href="${pageContext.request.contextPath }/cash/addcash.do">캐쉬충전하러가기</a>
</body>
</html>