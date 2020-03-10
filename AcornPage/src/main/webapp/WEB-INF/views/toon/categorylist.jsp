<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
.star-rating {width:75px; }
.star-rating,.star-rating span {display:inline-block; height:14px; overflow:hidden; background:url(${pageContext.request.contextPath}/resources/images/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
</style>
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
						<div class="list">
							<div class="imgwrapper">
			                     <c:choose>
			                     	<c:when test="${empty tmp.thumb}">
				                        <img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>                                           	
			                     	</c:when>
			                     	<c:otherwise>
			                     		<img class="img-thumbnail" src="${pageContext.request.contextPath}${tmp.thumb }" alt="logo"/>
			                     	</c:otherwise>
			                     </c:choose>
							</div>
							<div class="textwrapper">
								<p>${tmp.title }</p>
								<p>${tmp.writer }</p>
								<p>${tmp.info }</p>
								<p style="position:absolute; right:0; top:30px;">
							<span class="wrap-star">
								<span class='star-rating'>
									<span style ="width:<fmt:formatNumber value="${tmp.starvalue *10}" pattern=".0"/>%"></span>
								</span>
								<c:if test="${tmp.starvalue gt 0 }">
                        			<fmt:formatNumber value="${tmp.starvalue }" pattern=".0"/>
                        		</c:if>
							</span>
		                  </p>  
							</div>
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