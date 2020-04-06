<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage :: 이메일 수정</title>
<jsp:include page="../include/resource.jsp"/>
<style>
	/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
	.help-block, .form-control-feedback{
		display: none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>회원정보 수정폼</h1>
	<form action="update.do" method="post">
		<input type="hidden" name="id" value="${id }"/>
		<div class="form-group has-feedback">
			<label for="id">아이디</label>
			<input class="form-control" type="text" id="id" value="${id }" disabled/>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="email" id="email" name="email" value="${dto.email }"/>
			<p class="help-block" id="email_required">반드시 입력하세요</p>
			<p class="help-block" id="email_notmatch">이메일 형식에 맞게 입력하세요</p>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<button class="btn btn-primary" type="submit">수정확인</button>
		<button class="btn btn-warning" type="reset">취소</button>
	</form>
</div>
<script>
	

	var isEmailDirty=true;
	//이메일을 형식에 맞게 입력했는지 여부 
	var isEmailMatch=false;
	//이메일을 입력했는지 여부
	var isEmailInput=false;

	//이메일을 입력할때 실행할 함수 등록
	$("#email").on("input", function(){
		
		var email=$("#email").val();
		var regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(email.match(regEmail)){//이메일 형식에 맞게 입력 했다면
			isEmailMatch=true;
		}else{//형식에 맞지 않게 입력했다면 
			isEmailMatch=false;
		}
		
		if(email.length == 0){ //이메일을 입력하지 않았다면
			isEmailInput=false;
		}else{//이메일을 입력 했다면 
			isEmailInput=true;
		}
		//이메일 에러 여부 
		var isError=!isEmailInput || !isEmailMatch;
		//이메일 상태 바꾸기 
		setState("#email", isError);
	});
	
	//입력란의 상태를 바꾸는 함수 
	function setState(sel, isError){
		//일단 UI 를 초기 상태로 바꿔준다.
		$(sel)
		.parent()
		.removeClass("has-success has-error")
		.find(".help-block, .form-control-feedback")
		.hide();
		
		//입력란의 색상과 아이콘을 바꿔주는 작업 
		if(isError){
			//입력란이 error 인 상태
			$(sel)
			.parent()
			.addClass("has-error")
			.find(".glyphicon-remove")
			.show();
		}else{
			//입력란이 success 인 상태
			$(sel)
			.parent()
			.addClass("has-success")
			.find(".glyphicon-ok")
			.show();
		}
		//에러가 있다면 에러 메세지 띄우기
		if(isEmailInput && !isEmailMatch){
			$("#email_notmatch").show();
		}
		if(!isEmailInput && isEmailDirty){
			$("#email_required").show();
		}
		//버튼의 상태 바꾸기 
		if(isEmailInput && isEmailMatch ){
			$("button[type=submit]").removeAttr("disabled");
		}else{
			$("button[type=submit]").attr("disabled","disabled");
		}
	}
	
	$(".btn-primary").click(function(){
		self.close();
	});

</script>
</body>
</html>










