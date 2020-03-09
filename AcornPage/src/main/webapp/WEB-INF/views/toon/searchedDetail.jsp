<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"/>
<title>toon/searchedDetail.jsp</title>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="category"/>
</jsp:include>
</head>
<body>
<div class="container">
<div class="contentwrapper">
   <div class="container content">
	<h1>선택된 목록입니다.</h1>
	<table class="table table-striped table-condensed">
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
            </div> <!-- //content -->
</div> <!--//contentwrapper -->
</body>
</html>