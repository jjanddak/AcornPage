<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage :: 정보수정</title>
<style>
	#thumbForm{
		display: none;
	}
</style>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="category"/>
</jsp:include>
<div class="contentwrapper">
   <div class="container content">
		<div class="container">
			<h1>신작 만화 수정</h1>
			<div class="form-group">
					<label for="file">썸네일</label><br/>
					<!-- <input type="file" name="file" id="file" value="${dto.thumb }"/> -->
					<c:choose>
						<c:when test="${empty dto.thumb}">
							<a href="javascript:" id="thumbLink">
								<img style="border:1px solid black; border-radius:10px; width:150px; height:100px;" src="<c:url value='/resources/images/no.png'/>"/>
							</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:" id="thumbLink">
								<img style="border:1px solid black; border-radius:10px; width:150px; height:100px;" src="${pageContext.request.contextPath }${dto.thumb}" alt="" />
							</a>						
						</c:otherwise>
					</c:choose>
				</div>
				<form action="thumb_update.do?title=${dto.title }" method="post"
					enctype="multipart/form-data" id="thumbForm">
					<label for="thumbImage">프로필 이미지 선택</label>
					<input type="file" name="thumbImage" id="thumbImage"
						accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
				</form>
			<form action="updateDetail.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">제목</label>
					<input class="form-control" type="text" 
						name="title" id="title" value="${dto.title}" readOnly/>
				</div>
				<div class="form-group">
					<label for="writer">작가</label>
					<input class="form-control" type="text" 
						name="writer" id="writer" value="${dto.writer}" readOnly/>
				</div>
				<div class="form-group">
					<label for="info">만화설명</label>
					<textarea class="form-control" name="info" id="info" cols="30" rows="10">${dto.info }</textarea>
				</div>
				<div class="form-group">
					<label for="hashtag">해시태그</label>
					<input class="form-control" type="text" 
						name="hashtag" id="hashtag" value="${dto.hashtag }"/>
				</div>
				<div class="form-group">
					<label for="toonovel">만화 / 소설</label>	<br/>	
					<c:if test="${dto.toonovel eq 'toon' }">				
						<input type="radio" name="toonovel" value="toon" checked="checked"/>만화<br/>
						<input type="radio" name="toonovel" value="novel" />소설<br/>	
					</c:if>
					<c:if test="${dto.toonovel eq 'novel' }">					
						<input type="radio" name="toonovel" value="toon" />만화<br/>
						<input type="radio" name="toonovel" value="novel" checked="checked"/>소설<br/>	
					</c:if>
				</div>		
				
				<button class="btn btn-primary" type="submit">수정</button>
			</form>
				<a href="${pageContext.request.contextPath }/users/info.do">
					<button class="btn btn-warning">취소</button>	
				</a>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//프로파일 이미지를 클릭하면 
	$("#thumbLink").click(function(){
		//강제로 <input type="file" /> 을 클릭해서 파일 선택창을 띄우고
		$("#thumbImage").click();
	});
	//input type="file" 에 파일이 선택되면 
	$("#thumbImage").on("change", function(){
		//폼을 강제 제출하고 
		$("#thumbForm").submit();
	});
	
	// jquery form 플러그인의 동작을 이용해서 폼이 ajax 로 제출되도록 한다. 
	$("#thumbForm").ajaxForm(function(responseData){
		//responseData 는 plain object 이다.
		//{savedPath:"/upload/저장된이미지파일명"}
		//savedPath 라는 방에 저장된 이미지의 경로가 들어 있다.
		console.log(responseData);
		var src="${pageContext.request.contextPath }"
							+responseData.savedPath;
		// img 의 src 속성에 반영함으로써 이미지가 업데이트 되도록 한다.
		$("#thumbLink img").attr("src", src);
	});
</script>
</body>
</html>
