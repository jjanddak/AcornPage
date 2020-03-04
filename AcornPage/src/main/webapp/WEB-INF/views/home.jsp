<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp">
	<jsp:param value="cafe" name="category"/>
</jsp:include>
<div class="container">
	<a href="cafe/viewList.do">카카오페이지 이동</a>
	<h2>웹툰</h2>
	<ul>
		<c:forEach var="tmp" items="${notice }" varStatus="status">
			<li><p class="toon">만화 ${status.count }</p></li>
		</c:forEach>
	</ul>
	<br/><br/>
	<h2>웹소설</h2>
	<ul>
		<c:forEach var="tmp" items="${notice }" varStatus="status">
			<li><p class="novel">소설 ${status.count }</p></li>
		</c:forEach>
	</ul>
</div>

	<div class="bestList" style="width:100%; height:500px;">
		<ul>
			<c:forEach var="tmp" items="${requestScope.list }">
				<a href="toon/selectedDetail.do?title=${tmp.title }">
				<li>
					<div class="list" style="width:100%; height:150px; border:1px solid blue;">
						<p>${tmp.title }</p>
						<p>${tmp.writer }</p>
						<p>${tmp.info }</p>
					</div>
				</li>
				</a>
			</c:forEach>
		</ul>
	</div>
	<a href="users/toonup.do">만화 업로드</a>
	<a href="users/novelup.do">소설 업로드</a>
</div>
	<div class="comments">
		<!-- 댓글을 작성할수 있는 폼 -->
		<p>의견쓰기</p>
		<div class="comment_form">
			<form action="comment_insert.do" method="post">
				<textarea name="content"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
				<button type="submit">등록</button>
			</form>
		</div>
	</div>
		<ul>
		<c:forEach items="${toonCommentList }" var="tmp">
						<dl>
							<dt>				
								<span>${tmp.id }</span>
								<span>${tmp.regdate }</span>
								<span>${tmp.likeCount }</span>
								<span><a href="commentlike.do?writer=${tmp.id}&&commcode=${tmp.commcode}">좋아요</a></span>
							</dt>
							<dd>
								<pre>${tmp.content }</pre>
							</dd>
						</dl>		
		</c:forEach>
		</ul>

</div>
<script>	
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form").on("submit", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="home.do";
			return false;//폼 전송 막기 
		}
	});
	//폼에 click 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form textarea").on("click", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			var isMove=confirm("로그인 페이지로 이동 하시겠습니까?");
			if(isMove){
				location.href="users/loginform.do";
			}
		}
	});
	
	


</script>
</body>
</html>






