<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="${requestScope.category }" name="category"/>
</jsp:include>
	<div class="contentwrapper">
		<div class="container content">
		<div class="bestList">
			<ul>
				<c:forEach var="tmp" items="${requestScope.list }">
					<a href="${pageContext.request.contextPath }/toon/selectedDetail.do?title=${tmp.title }">
					<li>
						<div class="list" style="width:100%; height:150px; border:1px solid blue;">
							<p>${tmp.title }</p>
							<p>${tmp.writer }</p>
							<p>${tmp.info }</p>
						</div>
					</li>
					</a>
				</c:forEach>
			</ul>
		</div>
	</div>
	</div>
</body>
</html>