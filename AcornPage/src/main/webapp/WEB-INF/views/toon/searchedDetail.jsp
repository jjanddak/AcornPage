<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"/>
<title>toon/searchedDetail.jsp</title>
<jsp:include page="../include/navbar.jsp"/>
</head>
<body>
	<div class="contentwrapper">
		<div class="container content">
			<h1>선택된 목록입니다.</h1>
			<table class="table table-striped table-condensed">
				<thead>
					<tr>
						<th>제목</th>
						<th>작가</th>
						<th>정보</th>
						<th>연재시작일</th>
						<th>구분</th>
						<th>평균 별점</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${detailList }">
					<tr>
						<td>${tmp.title}</td>
						<td><a href="${pageContext.request.contextPath }/toon/searchedDetail.do?select=writer&keyword=${tmp.writer}">${tmp.writer}</a></td>
						<td>${tmp.info}</td>
						<td>${tmp.regdate}</td>
						<td>${tmp.toonovel}</td>
						<td>
						<c:choose>
							<c:when test="${tmp.starvalue>0 }">
								<strong><fmt:formatNumber value="${tmp.starvalue }" pattern=".0"/></strong> 점
							</c:when>
							<c:otherwise>
								<strong>별점없음.</strong>
							</c:otherwise>
						</c:choose>	
						</td>
					</tr>		
					</c:forEach>
				</tbody>	
			</table>
		</div>
	</div>
</body>
</html>