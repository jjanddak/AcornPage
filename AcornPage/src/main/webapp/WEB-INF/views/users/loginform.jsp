<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	/* stylelint-disable selector-no-qualifying-type, property-no-vendor-prefix */
	
	body {
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #fff;
	}
	@media (min-width: 500px) {
	  .container {
	    width:400px;
	    border:1px solid #eee;
	    padding:50px;
	    margin-top:40px;
	  }
	}
	.form-signin {
	  margin: 0 auto;
	}
	.form-signin .form-signin-heading,
	.form-signin .checkbox {
	  margin-bottom: 10px;
	}
	.form-signin .checkbox {
	  font-weight: 400;
	}
	.form-signin .form-control {
	  position: relative;
	  -webkit-box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  box-sizing: border-box;
	  height: auto;
	  padding: 10px;
	  font-size: 15px;
	}
	.form-signin .form-control:focus {
	  z-index: 2;
	}

	.form-signin input{
		margin-bottom:10px;
		border:0px;
		outline:none;
		box-shadow: none;
		border-bottom:2px solid #ebebeb;
		border-radius: 0px;
		font-weight: bold;
		font-size:15px;
		
	}
	.form-signin input:focus {

        outline: none;
        box-shadow: none;
        -webkit-box-shadow:none;
        border-bottom:2px solid #7c7c7c;

}
	.form-signin input[type="email"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	.form-signin input[type="password"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
	.footer{
		padding:20px 15px;
		margin:0 auto;
		position: absolute;
		bottom:0;
		text-align: center;	
	}
	@media (min-width: 500px) {
	  .footer {
	    position:static;
	  }
	}
	.info{
		float:left;
		padding:10px 0; 
		border-top:1px solid #d8d8d8; 
		font-weight: bold;
	}
	@media (min-width: 500px) {
	  .info {
	    float:none;
	  }
	}
	.footer a{
		padding:0 4px;
		font-size:12px;
		color:#4c4c4c;
		line-height: 20px;
	}
	.btn-link{
		color:#555;
	}
	.btn:focus, .btn:active:focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn.active.focus{
		outline:none;
		color:#555;
	}
</style>
</head>
<body>

<div class="container">
	<div style="text-align: center; margin-bottom:40px;">
		<img src="${pageContext.request.contextPath }/resources/images/acornLogo.png" alt="logo" style="width:130px;"/>
	</div>
	<form class="form-signin" id="loginForm" action="login.do" method="post">
		<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>
			<input type="hidden" name="url" value="${url }" />
			<div style="position: relative;">
				<label for="id" class="sr-only">아이디</label>
				<input type="text" id="id" name="id" class="form-control" autocomplete="off"
					placeholder="아이디" value="${savedId }"/>
				<div style="position: absolute; text-align: right; top:7px; right: 0; z-index: 10;">
					<button class="btn btn-link del-id" type="button" style="color:#555; visibility: hidden;" tabindex="-1">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
				</div>
			</div>
			<div style="position: relative;">
				<label for="pwd" class="sr-only">비밀번호</label>
					<input type="password" id="pwd" name="pwd" class="form-control" 
						placeholder="비밀번호" value="${savedPwd }">
					<div style="position: absolute; text-align: right; top:7px; right: 0; z-index: 10;">
					<button class="btn btn-link del-pwd" type="button" style="color:#555; display: none;" tabindex="-1">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
				</div>
			</div>
		
		<div class="checkbox" style="padding:20px 0; font-weight: bold;">
			<label>
				<input type="checkbox" name="isSave" value="yes"/>아이디, 비밀번호 저장
			</label>
		</div>
		<div class="error">
			<p class="error-text" style="color:#e65f32; margin:0; font-weight: bold; opacity:0;">
				
			</p>
		</div>
		<button class="btn btn-lg btn-primary btn-block" style="background-color:#ffe500; color:#000; border:0px; height: 50px; border-radius: 4px; font-size: 15px; font-weight: bold;">로그인</button>
	</form>	
	<div style="padding:30px 5px; font-size: 13px; font-weight: bold;">
		<div style="float:left;"><a href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a></div>
		<div style="float:right;"><a href="#">비밀번호 찾기</a></div>
	</div>
</div>
<div class="footer">
	<div class="info">
		<a href="#">이용약관</a>
		<a href="#">개인정보 처리방침</a>
		<a href="#">운영정책</a>
		<a href="#">고객센터</a>
		<a href="#">공지사항</a>
	</div>
	<div style="font-style:italic; padding-top:10px; font-size:11px;">
		Copyright&copy; AcornPage Corp.
	</div>
</div>

</body>
<script>
	//인풋에 키다운이벤트가 일어났을때 인풋값이 널이아니며,탭키가 아닌 다른 키가눌렸을때 실행되는 함수
 	$("#id").keydown(function(e){
 		if($("#id").val!=null && e.keyCode!=9){
 			$(".del-id").attr("style","display:inline;");
 		}
	});
	//인풋에 키다운이벤트가 일어났을때 인풋값이 널이아니며,탭키가 아닌 다른 키가눌렸을때 실행되는 함수
 	$("#pwd").keydown(function(e){
 		if($("#pwd").val!=null && e.keyCode!=9){
 			$(".del-pwd").attr("style","display:inline;");
 		}
		
	});
	//입력값 지우기 함수를 클릭했을때 입력값을 초기화하고 버튼은 안보이게 실행하는 함수
 	$(".del-id").click(function(){
 		$("#id").val("");
 		$(".del-id").attr("style","display:none;");
 	})
 	//입력값 지우기 함수를 클릭했을때 입력값을 초기화하고 버튼은 안보이게 실행하는 함수
 	$(".del-pwd").click(function(){
 		$("#pwd").val("");
 		$(".del-pwd").attr("style","display:none;");
 	})
 	//로그인버튼을 클릭했을때 
 	$(".btn-lg").click(function(){
 		//id와 pwd가 널이라면
 		if($("#id").val()=="" || $("#pwd").val()==""){
 			//에러창을 활성화하여 알림
 			$(".error").prop("style","display:block; margin-bottom:30px; padding:20px; font-size:13px; background-color:#fafafa;");
 			$(".error-text").text("아이디 또는 비밀번호를 입력하세요");
 			$(".error-text").prop("style","color:#e65f32; margin:0; font-weight: bold; opacity:1; transition:opacity 1s ease;");
 		//id와 pwd를 입력했다면
 		}else if($("#id").val()!="" && $("#pwd").val()!=""){
 			//form의 정보를 data화하는 ajax함수 실행
 			var formData = $("#loginForm").serialize();
 			
 			$.ajax({
				url: "login.do",//이동할 주소
				type: "post",//form전송타입
				data: formData,	//전송data타입(폼전용data함수를 이용해 변수로 전달)
				async:false, //ajax 리턴타입이 있을경우 꼭 작성해줘야됨
				success:function(responseData){
					//해당 아이디와 비밀번호가 맞다면 
					if(responseData==true){
						//세션전송을 위해 부모창 새로고침과 팝업창 닫기
						window.opener.location.reload();
						self.close();
					//아이디와 비밀번호가 틀리다면
					}else{
						//에러창을 활성화하여 알림
						$(".error").prop("style","display:block; margin-bottom:30px; padding:20px; font-size:13px; background-color:#fafafa;");
						$(".error-text").text("아이디 또는 비밀번호가 틀립니다.");
						$(".error-text").prop("style","color:#e65f32; margin:0; font-weight: bold; opacity:1; transition:opacity 1s ease;");
					}
				}	
				
			});
 		}
 		return false;
 	})	
</script>
</html>







