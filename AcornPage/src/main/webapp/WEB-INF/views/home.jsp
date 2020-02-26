<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
<jsp:include page="include/resource.jsp"/>
<style>
	.toon{
		font-size: 30px;
	}
	.novel{
		font-size: 25px;
	}
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<div class="container">
	<a href="cafe/viewList.do">카카오페이지 이동</a>
	<h2>웹툰</h2>
	<ul>
		<c:forEach var="tmp" items="${notice }" varStatus="status">
			<li><p class="toon">만화 ${status.count }</p></li>
		</c:forEach>
	</ul>
	<br/><br/>
	<h2>웹소설</h2>
	<ul>
		<c:forEach var="tmp" items="${notice }" varStatus="status">
			<li><p class="novel">소설 ${status.count }</p></li>
		</c:forEach>
	</ul>
	<p id="star_grade">
        <a href="#">★</a>
        <a href="#">★</a>
        <a href="#">★</a>
        <a href="#">★</a>
        <a href="#">★</a>
	</p>
</div>
</body>
<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>
<script>
	 $('#star_grade a').click(function(){
	     $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	     $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	     return false;
	 });
</script>
</html>





