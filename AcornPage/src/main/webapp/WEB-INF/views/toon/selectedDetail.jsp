<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
	<div class="container">
		<table class="table table-striped table-condensed">
		<thead>
			<tr>
				<th>회차</th>
				<th>썸네일</th>
				<th>제목</th>
				<th>구매</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.num }</td>
				<td><!-- ${tmp.writer } -->썸네일</td>
				<td>
					<a href="detailCode.do?code=${tmp.code }">
						${tmp.title }
					</a>
				</td>
				<td><a class="btn" href="buyCodeOne.do?code=${tmp.code }">구매</a></td>				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>