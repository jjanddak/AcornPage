<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
	<div class="contentwrapper">
		<div class="container content">
			<table class="table table-striped table-condensed">
			<colgroup>
				<col class="col-xs-2"/>
				<col class="col-xs-2"/>
				<col class="col-xs-5"/>
				<col class="col-xs-3"/>
			</colgroup>
			<thead>
				<tr>
					<th>회차</th>
					<th>작가</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td>
						<strong>
							<a href="permitCode.do?title=${tmp.title }&code=${tmp.code }">
								<strong>${tmp.title } ${tmp.num }</strong>화
							</a>
						</strong>
					</td>
					<td>${tmp.regdate }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
</body>
</html>