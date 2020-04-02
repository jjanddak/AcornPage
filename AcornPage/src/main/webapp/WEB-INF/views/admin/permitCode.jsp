<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage :: admin</title>
<jsp:include page="../include/resource.jsp"/>
<style>
	.btn-link{
		color:#000;
	}
	.contents{
		text-align: center;
	}
	.contents *{
		max-width: 100%;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
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
				<td id="title">${dto.title }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${dto.regdate }</td>
			</tr>
		</table>
		<div class="contents">${dto.content }</div>
		<br/>
		
		<c:choose>
			<c:when test="${dto.prevNum eq 0 }">
				<div></div>
			</c:when>
			<c:when test="${empty havePrev}">
				<a class="btn" href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.title}${dto.num-1}">이전화</a>
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
				<a class="btn" href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.title}${dto.num+1}">다음화</a>
			</c:when>
			<c:otherwise>			
				<a class="btn" href="buyCodeOne.do?title=${dto.title }&code=${dto.title}${dto.num+1}" 
				onclick="return confirm('구매하시겠습니까? 100원이 차감됩니다')">
				다음화 구매</a>
			</c:otherwise>
		</c:choose>	
	
	
		<div class="comments">
			<!-- 댓글을 작성할수 있는 폼 -->
			<div class="comment_form">
			<form action="${pageContext.request.contextPath}/admin/permit_update.do?code=${dto.code}&title=${dto.title }" method="post">
				<input type="radio" name="permit" value="Y">
				<label for="Y">승인</label>
				<input type="radio" name="permit" value="N">
				<label for="N">반려</label></br>	
				<div class="permitData" style="display:none;">
				<h4>반려사유</h4>
					<textarea name="content" style="width:100%"><c:if test="${empty id }">댓글을 작성하려면 로그인이 필요합니다.</c:if></textarea>
				</div>	
					<button type="submit" class="submit" style="display:none;">등록</button>
				</form>
			</div>
			</div>
		</div>
   </div>  
</div>
<script>
	$("input[name=permit]").change(function(){
		$(".submit").prop("style","display:flex");
		if($("input[name=permit]:checked").val()==="N"){
			$(".permitData").prop("style","display:block");
		}else{
			$(".permitData").prop("style","display:none");
		}
	})
</script>
</body>
</html>