<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="category"/>
</jsp:include>
<div class="contentwrapper">
   <div class="container content">
		<div class="container">
			<h1>신작 만화 업로드</h1>
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
				<div class="form-group">
					<label for="file">썸네일</label>
					<input type="file" name="file" id="file" value="${dto.thumb }"/>
				</div>
				
				<button class="btn btn-primary" type="submit">수정</button>
			</form>
				<a href="${pageContext.request.contextPath }/users/info.do">
					<button class="btn btn-warning">취소</button>	
				</a>
		</div>
	</div>
</div>
</body>
</html>
