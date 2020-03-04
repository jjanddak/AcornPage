<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="bestList" style="width:100%; height:500px;">
		<ul>
			<c:forEach var="tmp" items="${requestScope.list }">
				<a href="selectedDetail.do?title=${tmp.title }">
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
</body>
</html>