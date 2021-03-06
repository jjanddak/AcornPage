<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<!--디테일리스트페이지로 연결되게 -->
						<form action="${pageContext.request.contextPath}/toon/searchedDetail.do" method="get">
					         <select class="form-controll" id="select" name="select">
					             <option value="null">---</option>
					             <option value="title">제목</option>
					             <option value="writer">작가</option>
					             <option value="hashtag">태그</option>
					         </select>        
					         <input type="text" name="keyword" id="keyword" autocomplete="off"/>
					         <!-- <input type="button" id="button" class="btn-link" onclick="send(this.form);"/> -->
					         <button type="submit" id="button" class="btn-link">
					         	<span class="glyphicon glyphicon-search"></span>
					         </button>						
						</form>
					</div>		
						<c:choose>
							<c:when test="${empty sessionScope.id }">
								<button class="btn btn-link" id="login" style="padding:0 0 0 15px; font-size:17px;" onclick="signupOpen()">회원가입</button>
								<button class="btn btn-link" id="login" style="padding:0 0 0 15px; font-size:17px;" onclick="loginOpen()">로그인</button>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty profile }">
										<img id="profile_image" style="border:1px solid #eee; width:30px; height:30px; border-radius:50%; margin-left:12px;" src="${pageContext.request.contextPath }${profile }" alt="" />
									</c:when>
									<c:otherwise>
										<img id="profile_image" style="border:1px solid #eee; width:30px; height:30px; border-radius:50%; margin-left:12px;" src="<c:url value='/resources/images/default_user.jpeg'/>" alt="" />
									</c:otherwise>
								</c:choose>
								
								<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="userInfo">${id }님
								<span class="caret"/>
								</button>					
								<ul class="dropdown-menu pull-right" style="text-align:center;">
									<li>
										<p>내 캐시</p>
										<strong class="nowWallet">${wallet }</strong>									
									</li>
									<c:if test="${id eq 'admin' }">
										<li><a href="${pageContext.request.contextPath }/admin/needPermit.do">승인처리</a></li>
										<li><a href="${pageContext.request.contextPath }/admin/manageToon.do">작품관리</a></li>
									</c:if>
									<li><a onclick="popupOpen()" href="#">캐시충전</a></li>
									<li><a href="${pageContext.request.contextPath }/toon/Buylist.do">보관함</a></li>
									<li><a href="${pageContext.request.contextPath }/toon/lastRead.do">이어보기</a></li>
									<li><a href="${pageContext.request.contextPath }/users/info.do">정보보기</a></li>
									<li><a href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a></li>
								</ul>
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
				<li <c:if test="${param.category eq 'book' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/toon/bookList.do?category=book">도서검색</a></li>
			</ul>
		</div>
	</nav>
</body>
<script>
function popupOpen(){
   var url= "${pageContext.request.contextPath }/cash/addcash.do";    //팝업창 페이지 URL
   var winWidth = 700;
    var winHeight = 600;
	var url= "${pageContext.request.contextPath }/cash/addcash.do";    //팝업창 페이지 URL
	var winWidth = 550;
    var winHeight = 840;
    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
    var _left = Math.ceil(( window.screen.width - winWidth )/2);
    var _top = Math.ceil(( window.screen.height - winHeight )/2);
    var popupLoc= ',left=' + _left + ', top='+ _top; 
	window.open(url,"",popupOption+popupLoc);
}
function loginOpen(){
	var url= "${pageContext.request.contextPath }/users/loginform.do";    //팝업창 페이지 URL
	var winWidth = 366;
    var winHeight = 580;
    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
    var _left = Math.ceil(( window.screen.width - winWidth )/2);
    var _top = Math.ceil(( window.screen.height - winHeight )/2);
    var popupLoc= ',left=' + _left + ', top='+ _top; 
	window.open(url,"",popupOption+popupLoc);
}
function signupOpen(){
	var url= "${pageContext.request.contextPath }/users/signup_form.do";    //팝업창 페이지 URL
	var winWidth = 366;
    var winHeight = 580;
    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
    var _left = Math.ceil(( window.screen.width - winWidth )/2);
    var _top = Math.ceil(( window.screen.height - winHeight )/2);
    var popupLoc= ',left=' + _left + ', top='+ _top; 
	window.open(url,"",popupOption+popupLoc);
}

$("#button").click(function(){
	var select=document.querySelector("#select").value;
	var keyword=document.querySelector("#keyword").value;
	if(select!="null" && keyword!=""){
		location.href="${pageContext.request.contextPath}/toon/searchedDetail.do?select="+select+"&keyword="+keyword;
	}else if(select=="null"){
		alert("검색 카테고리를 선택해 주세요");
	}else if(keyword==""){
		alert("키워드를 입력해 주세요")
	}
	return false;
})
</script>
</html>