<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar">
				<h1 class="logo text-center">
					<a href="${pageContext.request.contextPath }/home.do">
			      	<img src="<c:url value='/resources/images/acornLogo.png'/>" alt="logo"/>
			      </a>
				</h1>
		      
		    	<div class="right-box">	
			      	<!-- 검색기 -->
					<div class="search">
						 <form action="list.do" method="post">
							<select name="select">
								  <option value="null">-----</option>
								  <option value="title">제목</option>
								  <option value="writer">작가</option>
								  <option value="hashtag">태그검색</option>
							 </select>
						 <input type="text" name="keyword" id="keyword"/>
						 <input type="submit" class="button" value="검색"/>
						 <p type="submit" class="glyphicon glyphicon-search"></p>
						</form>
					</div>
						<c:choose>
							<c:when test="${empty sessionScope.id }">
								<a class="btn btn-primary navbar-btn btn-sm btn-right" href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>
								<a class="btn btn-warning navbar-btn btn-sm btn-right" href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a>	
							</c:when>
							<c:otherwise>
								<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">${id }님
								<span class="caret"/>
								</button>					
								<ul class="dropdown-menu pull-right" style="text-align:center;">
									<li>
										<p>내 캐시</p>
										<strong>${wallet }</strong>									
									</li>
									<li><a onclick="popupOpen()" href="#">캐시충전</a></li>
									<li><a href="#">보관함</a></li>
									<li><a href="${pageContext.request.contextPath }/users/info.do">정보보기</a></li>
									<li><a href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
				</div>
	        </div>
		<div class="container">
			
		</div>
		<div class="container">
			<ul class="nav nav-center">
				<li <c:if test="${param.category eq 'home' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/home.do">홈</a></li>
				<li <c:if test="${param.category eq 'toon' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/toon/categorylist.do?category=toon">웹툰</a></li>
				<li <c:if test="${param.category eq 'novel' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/toon/categorylist.do?category=novel">웹소설</a></li>
				<li <c:if test="${param.category eq '코믹' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/toon/categorylist.do?category=코믹">#코믹</a></li>
				<li <c:if test="${param.category eq '액션' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/toon/categorylist.do?category=액션">#액션</a></li>
				<li <c:if test="${param.category eq '판타지' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/toon/categorylist.do?category=판타지">#판타지</a></li>
			</ul>
		</div>
	</nav>
</body>
<script>
	function popupOpen(){
		var url= "${pageContext.request.contextPath }/cash/addcash.do";    //팝업창 페이지 URL
		var winWidth = 700;
	    var winHeight = 600;
	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}
</script>
</html>