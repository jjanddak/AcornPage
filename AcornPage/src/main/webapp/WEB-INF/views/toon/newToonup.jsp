<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	[ 파일 업로드 처리 하는 방법 ]
	
	1. form 속성에 method="post" enctype="multipart/form-data"
	2. input type="file"
	3. commons-io.jar , commons-fileupload.jar 라이브러리를  
	    WEB-INF/lib  폴더에 붙여 넣기해서 사용할 준비하기
	4. WebContent/upload  폴더 만들기 
	5. upload.jsp 에서 파일 업로드에 관련된 비즈니스 로직 처리 하기 
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만화업로드</title>
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
			<form action="newtoonupload.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">제목</label>
					<input class="form-control" type="text" 
						name="title" id="title" value="${title}" />
				</div>
				<div class="form-group">
					<label for="writer">작가</label>
					<input class="form-control" type="text" 
						name="writer" id="writer" value="${id}" readOnly/>
				</div>
				<div class="form-group">
					<label for="info">만화설명</label>
					<textarea class="form-control" name="info" id="info" cols="30" rows="10"></textarea>
				</div>
				<div class="form-group">
					<label for="hashtag">해시태그</label>
					<input class="form-control" type="text" 
						name="hashtag" id="hashtag"/>
				</div>
				<div class="form-group">
					<label for="toonovel">만화 / 소설</label>			
					<input type="radio" name="toonovel" value="toon" checked="checked"/>만화<br/>
					<input type="radio" name="toonovel" value="novel" />소설<br/>	
				</div>		
				<div class="form-group">
					<label for="file">썸네일</label>
					<input type="file" name="file" id="file" />
				</div>
				<button class="btn btn-primary" type="submit">연재시작</button>
				<button class="btn btn-warning" type="reset">취소</button>	
			</form>
		</div>
	</div>
</div>
</body>
</html>
