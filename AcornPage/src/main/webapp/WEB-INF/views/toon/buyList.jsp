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
<jsp:include page="../include/navbar.jsp"/>
	<div class="contentwrapper">	
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
									<p style="position:absolute; right:0; top:0;">등록날짜</p>
									<p style="position:absolute; right:0; top:40px;">별점</p>
								</div>
							</div>
						</li>
					</a>
				</c:forEach>
			</ul>
		</div>
	</div><!-- //novel list content -->
</body>
</html>