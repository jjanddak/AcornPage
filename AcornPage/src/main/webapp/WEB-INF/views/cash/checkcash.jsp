<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		if(${isSuccess}){
			alert("충전 되었습니다.");
			self.close();
		}else{
			alert("충전에 실패했습니다 까비~");
			location.href="addcash.do";
		}
	</script>
</body>
</html>