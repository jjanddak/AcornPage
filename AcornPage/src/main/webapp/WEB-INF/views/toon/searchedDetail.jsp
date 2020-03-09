<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		 <div class="detailList">
         <ul>
            <c:forEach var="tmp" items="${requestScope.detailList }">
               <li>
                  <div class="list">
                     <div class="imgwrapper">
                     <c:choose>
                     	<c:when test="${empty tmp.thumb}">
	                        <a href="${pageContext.request.contextPath}/toon/selectedDetail.do?title=${tmp.title }"><img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/></a>                                          	
                     	</c:when>
                     	<c:otherwise>
                     		<a href="${pageContext.request.contextPath}/toon/selectedDetail.do?title=${tmp.title }"><img class="img-thumbnail" src="${pageContext.request.contextPath}${tmp.thumb }" alt="logo"/></a>
                     	</c:otherwise>
                     </c:choose>
                     </div>
                     <div class="textwrapper">
                        <a href="${pageContext.request.contextPath}/toon/selectedDetail.do?title=${tmp.title }"><p class="list-title"><strong>${tmp.title }</strong></p></a>
						<a href="${pageContext.request.contextPath}/toon/searchedDetail.do?select=writer&keyword=${tmp.writer }"><p class="list-writer"><strong>${tmp.writer }</strong></p></a>
						<p class="list-info">${tmp.info }</p>
						<p style="position:absolute; right:0; top:0;">연재 시작일 : ${tmp.regdate }</p>
						<p style="position:absolute; right:0; top:30px;">★별점출력★</p>						                     
                     <c:choose>
                     	<c:when test="${tmp.toonovel eq 'toon'}">
	                        <p style="position:absolute; right:0; top:60px;">웹툰</p>	                                          	
                     	</c:when>
                     	<c:otherwise>
                     		<p style="position:absolute; right:0; top:60px;">웹소설</p>	
                     	</c:otherwise>
                     </c:choose>
						<p style="position:absolute; right:0; top:90px;"></p>
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