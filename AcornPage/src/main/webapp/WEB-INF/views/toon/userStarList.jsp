<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<style>
.star-rating {width:75px; }
.star-rating,.star-rating span {display:inline-block; height:14px; overflow:hidden; background:url(${pageContext.request.contextPath}/resources/images/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
</style>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="home" name="category"/>
</jsp:include>
	<div class="contentwrapper">
	<div class="container content">
		<table class="table table-striped table-condensed">
		<thead>
			<tr>
				<th>회차</th>
				<th>제목</th>
				<th>점수</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>
					<a href="detailCode.do?code=${tmp.code }&title=${tmp.title}">
						<strong>${tmp.title } ${tmp.num }</strong> 화
					</a>
				</td>
				<td>
					<c:choose>
						<c:when test="${tmp.starvalue > 0 }">
						<span class="wrap-star">
							<span class='star-rating'>
								<span style ="width:<fmt:formatNumber value="${tmp.starvalue *10}" pattern=".0"/>%"></span>
							</span>
							<c:if test="${tmp.starvalue gt 0 }">
	                      			<fmt:formatNumber value="${tmp.starvalue }" pattern=".0"/>
	                      		</c:if>
						</span>
						</c:when>
						<c:otherwise>
							<strong>아직 별점이 없습니다.</strong>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
			
		</tbody>
	</table>
	<p><a href="${pageContext.request.contextPath }/home.do"><button><strong>홈으로 가기</strong></button></a></p>
	</div>
	</div>
</body>
</html>