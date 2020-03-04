<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- 홈페이지 링크와 버튼을 넣어둘 div -->
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>
			<button class="navbar-toggle" 
				data-toggle="collapse" 
				data-target="#one">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<!-- xs 영역에서는 숨겨졌다가 버튼을 누르면 나오게 할 컨텐츠를 넣을 div -->
		<div class="collapse navbar-collapse" id="one">
			<ul class="nav navbar-nav">
				<li <c:if test="${param.category eq 'cafe' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/cafe/list.do">Cafe</a></li>
				<li <c:if test="${param.category eq 'file' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/file/list.do">자료실</a></li>
				<li <c:if test="${param.category eq 'shop' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/shop/list.do">Shop</a></li>		
			</ul>
			
			<div class="pull-right">
			<!-- 검색기 -->
			<div class="search">
<!-- 			디테일리스트페이지로 연결되게 -->
			<form action="toon/searchedDetail.do" method="post">
			 <select name="select">
				  <option value="null">-----</option>
				  <option value="title">제목</option>
				  <option value="writer">작가</option>
				  <option value="hashtag">태그검색</option>
			 </select>		  
			 <input type="text" name="keyword" id="keyword"/>
			 <input type="submit" class="button" value="검색"/>
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
	</div>
</div>
<script>
 
function popupOpen(){
	var url= "${pageContext.request.contextPath }/cash/addcash.do";    //팝업창 페이지 URL
	var winWidth = 700;
    var winHeight = 600;
    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
}
</script>

