<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage :: 캐시충전</title>
</head>
<body>
	<script>
		alert("충전 되었습니다.");
		window.opener.location.reload();
		self.close();
	</script>
</body>
</html>