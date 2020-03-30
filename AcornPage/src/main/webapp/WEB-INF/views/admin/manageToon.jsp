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
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="contentwrapper">
	<div class="container content" style="border-top:20px solid #eee;">
		<h2>작품관리</h2>
		 <div class="bestList">
         <ul>
            <c:forEach var="tmp" items="${requestScope.list }">
               <a href="toon/selectedDetail.do?title=${tmp.title }">
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
		                <p style="position:absolute; right:0; top:62px; color:#999999">연재 시작일: ${tmp.regdate }</p>  	
                     </div>
                  </div>
               </li>
               </a>
            </c:forEach>
         </ul>
      </div>		
	</div><!-- //toon list content -->
</div>
</body>
</html>