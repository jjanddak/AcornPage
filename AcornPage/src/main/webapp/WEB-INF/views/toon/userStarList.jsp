<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>toon/userStarList.jsp</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>

	<div class="container">
		<table class="table table-striped table-condensed">
		<thead>
			<tr>
				<th>회차</th>
				<th>제목</th>
				<th>당신이 매긴 별점</th>
				<th>썸네일</th>
				
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>
					<a href="detailCode.do?code=${tmp.code }">
						${tmp.title }
					</a>
				</td>
				<td>${tmp.starvalue }</td>
				<td><!-- ${tmp.writer } -->썸네일</td>
			</tr>
		</c:forEach>
			
		</tbody>
	</table>
	<p><a href="${pageContext.request.contextPath }/home.do"><button><strong>홈으로 가기</strong></button></a></p>
	</div>
</body>
</html>