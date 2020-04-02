<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
.star-rating {width:75px; }
.star-rating,.star-rating span {display:inline-block; height:14px; overflow:hidden; background:url(${pageContext.request.contextPath}/resources/images/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
.btn-danger{
	position:absolute;
	top:0;
	right:0;
}
</style>
<meta charset="UTF-8">
<title>acornpage :: admin</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
	<div class="contentwrapper">
		<div class="container content">
			<div class="list">
				<div class="imgwrapper">
					<c:choose>
	                	<c:when test="${empty dto.thumb}">
	                      <img class="img-thumbnail" src="<c:url value='/resources/images/no.png'/>" alt="logo"/>                                              
	                   </c:when>
	                   <c:otherwise>
	                      <img class="img-thumbnail" src="${pageContext.request.contextPath}${dto.thumb }" alt="logo"/>
	                   </c:otherwise>
	                </c:choose>	                
				</div>
				<div class="textwrapper">
					<button class="btn btn-danger" id="remove_all">만화전체삭제</button>
					<p class="list-title">${dto.title }</p>
					<p class="list-writer">${dto.writer }</p>
					<p class="list-info">${dto.info }</p>
					<p style="position:absolute; right:0; top:35px;">
						<span class="wrap-star">
							<span class='star-rating'>
								<span style ="width:<fmt:formatNumber value="${dto.starvalue *10}" pattern=".0"/>%"></span>
							</span>
							<c:if test="${dto.starvalue gt 0 }">
                       			<fmt:formatNumber value="${dto.starvalue }" pattern=".0"/>
                       		</c:if>
						</span>
	                </p>
	                <p style="position:absolute; right:0; top:62px; color:#999999">연재 시작일: ${dto.regdate }</p>
				</div>
			</div>
		</div>

		<div class="container content">
			<table class="table table-striped table-condensed">
			<colgroup>
				<col class="col-xs-4"/>
				<col class="col-xs-4"/>
				<col class="col-xs-4"/>

			</colgroup>
			<thead>
				<tr>
					<th>회차</th>
					<th>제목</th>
					<th>별점</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>
						<strong>
							<a href="manageCode.do?title=${tmp.title }&code=${tmp.code }">
								<strong>${tmp.title } ${tmp.num }</strong>화
							</a>
						</strong>
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
		</div>
	</div>
	<script>
		$("#remove_all").click(function(){
			var title=$(".list-title").text();
			var writer=$(".list-writer").text();
			var check_remove=confirm(title+"만화를 모두 삭제하시겠습니까?");
			if(check_remove){
				location.href="deleteAll.do?title="+title+"&writer="+writer;
			}else{
				
			}
		})
	</script>
</body>
</html>