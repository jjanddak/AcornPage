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
		</div>
		<div class="container">
			<div class="pull-right">
			<!-- 검색기 -->
			<div class="search">
<!-- 			디테일리스트페이지로 연결되게 -->
			<form action="${pageContext.request.contextPath}/toon/searchedDetail.do" method="post">
			 <select id="select" name="select">
				  <option value="null">-----</option>
				  <option value="title">제목</option>
				  <option value="writer">작가</option>
				  <option value="hashtag">태그검색</option>
			 </select>		  
			 <input type="text" name="keyword" id="keyword"/>
			 <input type="button" id="button" class="button" onclick="send(this.form);" value="검색"/>
			</form>
			</div>		
			<c:choose>
				<c:when test="${empty sessionScope.id }">
						<a class="btn btn-primary navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>
						<a class="btn btn-warning navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a>	
				</c:when>
				<c:otherwise>
					<p class="navbar-text pull-right">
						<strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.do">${id }</a></strong>
						<a class="navbar-link" href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a> 
						<a onclick="popupOpen()" class="btn btn-success navbar-btn btn-xs">캐쉬충전</a>
					</p>
		
				</c:otherwise>
			</c:choose>
			</div>
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


function send(theform){ 
	if(theform.select.value=="null"){
		alert("무엇을 검색할지 선택해 주세요");
		theform.select.focus(); 
		return false;
	}
	if(theform.keyword.value==""){ 
		alert("검색어를 입력 하세요.");
		theform.keyword.focus(); 
		return false;
	}
	theform.submit();
}

	function popupOpen(){
		var url= "${pageContext.request.contextPath }/cash/addcash.do";    //팝업창 페이지 URL
		var winWidth = 700;
	    var winHeight = 600;
	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}
</script>
</html>
