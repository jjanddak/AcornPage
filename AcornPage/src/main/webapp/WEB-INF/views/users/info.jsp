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
	.bestList ul li:hover{
		background-color: #eee;
	}
	.table tr th{
		background-color:#f9f9f9;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="contentwrapper">
	<div class="container content">
		<h2>개인 정보 페이지</h2>
		<table class="table table-hover">
			<colgroup>
				<col class="col-xs-3"/>
				<col class="col-xs-9"/>
			</colgroup>
			<tr>
				<th>ID</th>
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
				<th>캐시</th>
				<td>${dto.wallet}</td> 
			</tr>
			<tr>
				<th>이메일</th>
				<td>${dto.email }<a style="color:blue; padding-left:15px;" href="updateform.do">이메일 수정하기</a></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${dto.regdate }</td>
			</tr>
			<tr>
				<th>별점목록</th>
				<td>
					<a style="color:blue;" href="${pageContext.request.contextPath }/toon/userStarList.do?id=${id }">
						<strong>${id }</strong>님의 별점 리스트 이동하기
					</a>
				</td>
			</tr>
		</table>
		<button class="btn btn-info"><a style="color:#fff;" href="pwd_updateform.do">비밀번호 수정하기</a></button>
		<button style="float:right;" class="btn btn-warning"><a href="javascript:deleteConfirm()">회원 탈퇴</a></button>
	</div>
	<c:if test="${not empty myToon }">
	<div class="container content">
		<div>
			<c:if test="${dto.isWriter eq 'Y' }">
				<button class="btn btn-primary" style="width:100%; font-size:20px; margin-bottom:20px;">
					<a style="color:#fff;" href="${pageContext.request.contextPath}/toon/newToonup.do">신작 업로드</a>
				</button>
			</c:if>
		</div>
			<div class="bestList">
        		 <ul>
				<c:forEach var="tmp" items="${myToon }">
					<a href="${pageContext.request.contextPath }/toon/selectedDetail.do?title=${tmp.title }">
	               <li>
	                  <div class="list">
						<div class="imgwrapper">
			                 <c:choose>
			                    <c:when test="${empty tmp.thumb}">
						           <img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>                                           	
					            </c:when>
					            <c:otherwise>
					               <img class="img-thumbnail" src="${pageContext.request.contextPath}${tmp.thumb }" alt="logo"/>
					            </c:otherwise>
					         </c:choose>
						</div>
	                     <div class="textwrapper">
	                        <p class="list-title">${tmp.title }</p>
							<p class="list-writer">${tmp.writer }</p>
							<p class="list-info">${tmp.info }</p>
							<p style="position:absolute; right:-55px; bottom:20px;">
								<button class="btn btn-danger">
									<a style="color:#fff;" href="${pageContext.request.contextPath}/toon/deletetoon.do?title=${tmp.title}" 
										onclick="return confirm('${tmp.title} 작품을 삭제하시겠습니까?');">
										삭제
									</a>
								</button>
							</p>
	                     </div>
	                  </div>
	               </li>
				</c:forEach>			
				</ul>
			</div>	
	</div>
	</c:if>
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





