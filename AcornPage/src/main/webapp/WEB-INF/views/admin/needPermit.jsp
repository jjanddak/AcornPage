<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage :: admin</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="home" name="category"/>
</jsp:include>
<div class="contentwrapper">
	<div class="container content">
		<div class="bestList">
	         <ul>
	            <c:forEach var="tmp" items="${list }">
	               <a href="${pageContext.request.contextPath }/admin/permitDetail.do?title=${tmp.title }">
	               <li>
	                  <div class="list">
						<div class="imgwrapper">
			                 <c:choose>
			                    <c:when test="${empty tmp.thumb}">
						           <img class="img-thumbnail" src="<c:url value='/resources/images/no.png'/>" alt="logo"/>                                           	
					            </c:when>
					            <c:otherwise>
					               <img class="img-thumbnail" src="${pageContext.request.contextPath}${tmp.thumb }" alt="logo"/>
					            </c:otherwise>
					         </c:choose>
						</div>
	                     <div class="textwrapper">
	                        <p class="list-title">${tmp.title }</p>
							<p class="list-writer">${tmp.writer }</p>
							<p class="list-info">${tmp.info }</p>
			                <p style="position:absolute; right:0; top:62px; color:#999999">등록날짜: ${tmp.regdate }</p>  	
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