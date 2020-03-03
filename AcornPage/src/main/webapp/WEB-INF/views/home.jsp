<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp">
	<jsp:param value="cafe" name="category"/>
</jsp:include>
<div class="container">

	<div class="bestList" style="width:100%; height:500px;">
		<ul>
			<c:forEach var="tmp" items="${requestScope.list }">
				<a href="toon/selectedDetail.do?title=${tmp.title }">
				<li>
					<div class="list" style="width:100%; height:150px; border:1px solid blue;">
						<p>${tmp.title }</p>
						<p>${tmp.writer }</p>
						<p>${tmp.info }</p>
					</div>
				</li>
				</a>
			</c:forEach>
		</ul>
	</div>
	<a href="users/toonup.do">만화 업로드</a>
	<a href="users/novelup.do">소설 업로드</a>
</div>
</body>
</html>






