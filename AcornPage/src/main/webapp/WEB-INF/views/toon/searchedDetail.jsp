<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>toon/searchedDetail.jsp</title>
</head>
<body>
<div class="container">
	<h1>선택된 목록입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>작가</th>
				<th>정보</th>
				<th>연재시작일</th>
				<th>구분</th>
				<th>평균 별점</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${detailList }">
			<tr>
				<td>${tmp.title}</td>
				<td>${tmp.writer}</td>
				<td>${tmp.info}</td>
				<td>${tmp.regdate}</td>
				<td>${tmp.toonovel}</td>
				<td>★수정해야함★</td>
			</tr>		
			</c:forEach>
		</tbody>	
	</table>
</div>
</body>
</html>