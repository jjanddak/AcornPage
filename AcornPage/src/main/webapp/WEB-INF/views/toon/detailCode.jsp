<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지입니당</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="contentwrapper">
   <div class="container content">
	<div class="container">
		<h3>카페 글 상세 보기</h3>
			<table class="table table-bordered table-condensed">
			<colgroup>
				<col class="col-xs-3"/>
				<col class="col-xs-9"/>
			</colgroup>
			<tr>
				<th>글번호</th>
				<td>${dto.num }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.writer }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th>회별 별점</th>
				<td>
					<c:choose>
						<c:when test="${starvalueAVG>0 }">
							<strong><fmt:formatNumber value="${starvalueAVG }" pattern=".00"/></strong> 점
						</c:when>
						<c:otherwise>
							<strong>이 편은 아직 별점이 없어요. 별점을 ${id } 님이 먼저 매겨주세요!</strong>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${dto.upload }</td>
			</tr>
		</table>
		<div class="contents">${dto.content }</div>
		<br/>
		
		<c:choose>
			<c:when test="${dto.prevNum eq 0 }">
				<div></div>
			</c:when>
			<c:when test="${empty havePrev}">
				<div><a href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.title}${dto.num-1}">이전화</a></div>
			</c:when>
			<c:otherwise>			
				<a class="btn" href="buyCodeOne.do?title=${dto.title }&code=${dto.title}${dto.num-1}" 
				onclick="return confirm('구매하시겠습니까? 100원이 차감됩니다')">
				이전화 구매</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${dto.nextNum eq 0 }">
				<div></div>
			</c:when>
			<c:when test="${empty haveNext}">
				<div><a href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.title}${dto.num+1}">다음화</a></div>
			</c:when>
			<c:otherwise>			
				<a class="btn" href="buyCodeOne.do?title=${dto.title }&code=${dto.title}${dto.num+1}" 
				onclick="return confirm('구매하시겠습니까? 100원이 차감됩니다')">
				다음화 구매</a>
			</c:otherwise>
		</c:choose>	
		

	<form action="starAdd.do" method="post">
		<p id="star_grade">
			<a href="#">★</a>
			<a href="#">★</a>
			<a href="#">★</a>
			<a href="#">★</a>
			<a href="#">★</a>
		</p>
		<button id="starBtn" type="submit">별점제출</button>
	</form>

	
	<div class="comments">
		<!-- 댓글을 작성할수 있는 폼 -->
		<p>의견쓰기</p>
		<div class="comment_form">
			<form action="${pageContext.request.contextPath}/toon/comment_insert.do?code=${dto.code}" method="post">
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
						<span><a href="${pageContext.request.contextPath}/toon/commentlike.do?writer=${tmp.id}&commcode=${tmp.commcode}&code=${tmp.code}">좋아요</a></span>
					</dt>
					<dd>
						<pre>${tmp.content }</pre>
					</dd>
				</dl>		
			</c:forEach>
		</ul>

	<p><a href="${pageContext.request.contextPath }/home.do"><button><strong>홈으로 가기</strong></button></a></p>
		 </div> <!-- //content -->
</div> <!--//contentwrapper -->
</body>
<script>
var formObj = $("form[role='form']");//폼 가저오기

    $('#star_grade a').click(function(){
        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        return false;
    });
    
    
    $("#starBtn").click(function(){
      var starValue = document.querySelectorAll(".on").length*2;
      var isAddStar=confirm("평점"+starValue+"을 제출하시겠습니까?");
      if(isAddStar){
         location.href="starAdd.do?starValue="+starValue+"&code=${dto.code}";
      }else{
         
      }
      return false;
   }); 
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form").on("submit", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath}/home.do";
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
				location.href="${pageContext.request.contextPath}/users/loginform.do";
			}
		}
	}); 
</script>
</html>