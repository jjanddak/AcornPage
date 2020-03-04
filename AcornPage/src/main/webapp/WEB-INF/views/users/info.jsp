<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	/* 프로필 이미지가 가로 세로 50px 인 원형으로 표시 될수 있도록  */
	#profileLink img{
		width: 50px;
		height: 50px;
		border-radius: 50%;
	}
	
	#profileForm{
		display: none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>개인 정보 페이지</h1>
	<table>
		<tr>
			<th>id</th>
			<td>${dto.id }</td>
		</tr>
		<tr>
			<th>구분</th>
				<c:choose>
					<c:when test="${dto.isWriter eq 'Y' }">
					<td>작가(writer)</td>
					</c:when>
					<c:otherwise>
					<td>독자(reader)</td>
					</c:otherwise>
				</c:choose>		
			
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td>
				<a href="javascript:" id="profileLink">
					<c:choose>
						<c:when test="${empty dto.profile }">
						<img src="${pageContext.request.contextPath }/resources/images/default_user.jpeg" alt="" />
						</c:when>
						<c:otherwise>
						<img src="${pageContext.request.contextPath }${dto.profile}" alt="" />
						</c:otherwise>
					</c:choose>
				</a>
			</td>
		</tr>
		<tr>
			<th>캐쉬</th>
			<td>${dto.wallet}</td> 
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a href="pwd_updateform.do">수정하기</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.email }<a href="updateform.do">이메일 수정하기</a></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.regdate }</td>
		</tr>
		<c:if test="${not empty myToon }">
			<tr>
				<th>연재중인 작품</th>
				<table>	
						<c:forEach var="tmp" items="${myToon }">
						<tr>
						<td>			
							<a href="${pageContext.request.contextPath}/toon/toonup.do?title=${tmp.title }">											
								<div class="list" style="width:600px; height:150px; border:1px solid blue;">
									<p>${tmp.title }</p>
									<p>${tmp.writer }</p>
									<p>${tmp.info }</p>
								</div>
							</a>
						</td>			
						</tr>
						</c:forEach>			
				</table>
			</tr>
		</c:if>		
	</table>
	<a href="${pageContext.request.contextPath}/toon/newToonup.do">신작 업로드</a>
	<a href="../home.do">수정완료</a>
	<a href="javascript:deleteConfirm()">회원 탈퇴</a>
</div>

<form action="profile_upload.do" method="post"
	enctype="multipart/form-data" id="profileForm">
	<label for="profileImage">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage"
		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
</form>
<%-- jquery form  플러그인 javascript 로딩 --%>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//프로파일 이미지를 클릭하면 
	$("#profileLink").click(function(){
		//강제로 <input type="file" /> 을 클릭해서 파일 선택창을 띄우고
		$("#profileImage").click();
	});
	//input type="file" 에 파일이 선택되면 
	$("#profileImage").on("change", function(){
		//폼을 강제 제출하고 
		$("#profileForm").submit();
	});
	
	// jquery form 플러그인의 동작을 이용해서 폼이 ajax 로 제출되도록 한다. 
	$("#profileForm").ajaxForm(function(responseData){
		//responseData 는 plain object 이다.
		//{savedPath:"/upload/저장된이미지파일명"}
		//savedPath 라는 방에 저장된 이미지의 경로가 들어 있다.
		console.log(responseData);
		var src="${pageContext.request.contextPath }"
							+responseData.savedPath;
		// img 의 src 속성에 반영함으로써 이미지가 업데이트 되도록 한다.
		$("#profileLink img").attr("src", src);
	});
	

	function deleteConfirm(){
		var isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.do";
		}
	}
</script>
</body>
</html>





