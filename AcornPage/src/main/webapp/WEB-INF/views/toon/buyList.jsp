<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"/>
<style>
.star-rating {width:75px; }
.star-rating,.star-rating span {display:inline-block; height:14px; overflow:hidden; background:url(${pageContext.request.contextPath}/resources/images/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }

</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="contentwrapper">
	<div class="container content">	
		<div class="bestList">
			<ul>
				<c:forEach var="tmp" items="${requestScope.list }">
					<a href="selectedDetail.do?title=${tmp.title }">
						<li>
							<div class="list">
								<div class="imgwrapper">
									<img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>
								</div>
								<div class="textwrapper" style="width:70%;">
									<p class="list-title">${tmp.title }</p>
									<p class="list-writer">${tmp.writer }</p>
									<p class="list-info">${tmp.info }</p>
									<p style="position:absolute; right:0; top:10px;">연재 시작일: ${tmp.regdate }</p>
									<p style="position:absolute; right:0; top:35px;">
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
	</div><!-- //novel list content -->
</div>
</body>
</html>