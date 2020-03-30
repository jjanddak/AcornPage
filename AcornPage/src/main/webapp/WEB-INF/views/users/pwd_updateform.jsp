<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_updateform.jsp</title>
<jsp:include page="../include/resource.jsp"/>
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
	.form-pwd {
	  margin: 0 auto;
	}
	.form-pwd .form-signin-heading,
	.form-pwd .checkbox {
	  margin-bottom: 10px;
	}
	.form-pwd .form-control {
	  position: relative;
	  -webkit-box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  box-sizing: border-box;
	  height: auto;
	  padding: 10px;
	  font-size: 15px;
	}
	.form-pwd .form-control:focus {
	  z-index: 2;
	}

	.form-pwd input{
		margin-bottom:10px;
		border:0px;
		outline:none;
		box-shadow: none;
		border-bottom:2px solid #ebebeb;
		border-radius: 0px;
		font-weight: bold;
		font-size:15px;
		
	}
	.form-pwd input:focus {

        outline: none;
        box-shadow: none;
        -webkit-box-shadow:none;
        border-bottom:2px solid #7c7c7c;

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
	.form-pwd .form-control{
		margin-bottom:15px;
	}
</style>
</head>
<body>
	<div class="container">
		<div style="text-align: center; margin-bottom:40px;">
			<img src="${pageContext.request.contextPath }/resources/images/acornLogo.png" alt="logo" style="width:130px;"/>
		</div>
		<form class="form-pwd" id="pwdForm" action="pwd_update.do" method="post">
				<div style="position: relative;">
					<label for="id" class="sr-only">기존비밀번호</label>
					<input type="password" id="pwd" name="pwd" class="form-control"
						placeholder="기존비밀번호"/>
					<div style="position: absolute; text-align: right; top:7px; right: 0; z-index: 10;">
						<button class="btn btn-link del-pwd" type="button" style="color:#555; visibility: hidden;" tabindex="-1">
							<span class="glyphicon glyphicon-remove"></span>
						</button>
					</div>
				</div>
				<div style="position: relative;">
					<label for="pwd" class="sr-only">비밀번호</label>
						<input type="password" id="newPwd" name="newPwd" class="form-control" 
							placeholder="새 비밀번호" value="${savedPwd }">
						<div style="position: absolute; text-align: right; top:7px; right: 0; z-index: 10;">
						<button class="btn btn-link del-newPwd" type="button" style="color:#555; display: none;" tabindex="-1">
							<span class="glyphicon glyphicon-remove"></span>
						</button>
					</div>
				</div>
				<div style="position: relative; margin-bottom:30px;">
					<label for="pwd" class="sr-only">비밀번호확인</label>
						<input type="password" id="newPwd2" name="newPwd2" class="form-control" 
							placeholder="새 비밀번호 확인">
						<div style="position: absolute; text-align: right; top:7px; right: 0; z-index: 10;">
						<button class="btn btn-link del-newPwd2" type="button" style="color:#555; display: none;" tabindex="-1">
							<span class="glyphicon glyphicon-remove"></span>
						</button>
					</div>
				</div>
			
			<div class="error" style="opacity:0;">
				<p class="error-text" style="color:#e65f32; margin:0; font-weight: bold;">
					
				</p>
			</div>
			<button class="btn btn-pwd btn-primary btn-block" style="background-color:#ffe500; color:#000; border:0px; height: 50px; border-radius: 4px; font-size: 15px; font-weight: bold; margin-top:20px;">비밀번호 변경</button>
		</form>	
	</div>
<script>
	//인풋에 키다운이벤트가 일어났을때 인풋값이 널이아니며,탭키가 아닌 다른 키가눌렸을때 실행되는 함수
	$("#pwd").keydown(function(e){
		if($("#pwd").val!=null && e.keyCode!=9){
			$(".del-pwd").attr("style","display:inline;");
		}
	});
	//인풋에 키다운이벤트가 일어났을때 인풋값이 널이아니며,탭키가 아닌 다른 키가눌렸을때 실행되는 함수
	$("#newPwd").keydown(function(e){
		if($("#newPwd").val!=null && e.keyCode!=9){
			$(".del-newPwd").attr("style","display:inline;");
		}
	
	});
	//인풋에 키다운이벤트가 일어났을때 인풋값이 널이아니며,탭키가 아닌 다른 키가눌렸을때 실행되는 함수
	$("#newPwd2").keydown(function(e){
		if($("#newPwd2").val!=null && e.keyCode!=9){
			$(".del-newPwd2").attr("style","display:inline;");
		}
	
	});
	//입력값 지우기 함수를 클릭했을때 입력값을 초기화하고 버튼은 안보이게 실행하는 함수
	$(".del-pwd").click(function(){
		$("#pwd").val("");
		$(".del-pwd").attr("style","display:none;");
	})
	//입력값 지우기 함수를 클릭했을때 입력값을 초기화하고 버튼은 안보이게 실행하는 함수
	$(".del-newPwd").click(function(){
		$("#newPwd").val("");
		$(".del-newPwd2").attr("style","display:none;");
	})
	//입력값 지우기 함수를 클릭했을때 입력값을 초기화하고 버튼은 안보이게 실행하는 함수
	$(".del-newPwd2").click(function(){
		$("#newPwd2").val("");
		$(".del-newPwd2").attr("style","display:none;");
	})
	//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
	$(".btn-pwd").click(function(){
		//새 비밀번호 2개가 일치하는지 확인
		var oldpwd=$("#pwd").val();
		var pwd=$("#newPwd").val();
		var pwd2=$("#newPwd2").val();
		if(pwd != pwd2){
			$(".error-text").text("");
			$(".error").prop("style","opacity:0;");
			$(".error").animate({opacity:"1"},1000);
			$(".error").prop("style","display:block; margin-bottom:30px; padding:20px; font-size:13px; background-color:#fafafa;");
			$(".error-text").text("변경할 비밀번호가 다릅니다.");
			$(".error-text").prop("style","color:#e65f32; margin:0; font-weight: bold;");

		}else{
			$.ajax({
				url: "pwd_update.do?pwd="+oldpwd+"&newPwd="+pwd,//이동할 주소
				type: "post",//form전송타입
				success:function(responseData){
					//해당 아이디와 비밀번호가 맞다면 
					console.log(responseData);
					if(responseData==true){
						//세션전송을 위해 부모창 새로고침과 팝업창 닫기
						self.close();
					//아이디와 비밀번호가 틀리다면
					}else{
						$(".error-text").text("");
						$(".error").prop("style","opacity:0;");
						$(".error").animate({opacity:"1"},1000);
						$(".error").prop("style","display:block; margin-bottom:30px; padding:20px; font-size:13px; background-color:#fafafa;");
						$(".error-text").text("현재 비밀번호가 틀립니다.");
						$(".error-text").prop("style","color:#e65f32; margin:0; font-weight: bold;");	
					}
				}
			});
		}
		return false;
	});
</script>
</body>
</html>











