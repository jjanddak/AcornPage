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
		<form action="starvalue.do" method="get">
		 <p id="star_grade">
		        <a href="#">★</a>
		        <a href="#">★</a>
		        <a href="#">★</a>
		        <a href="#">★</a>
		        <a href="#">★</a>
		   </p>
		   <button id="starBtn" type="submit">별점제출</button>
		</form>
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
    $("#starBtn").click(function(){
      var starValue = document.querySelectorAll(".on").length*2;
      var isAddStar=confirm("평점"+starValue+"을 제출하시겠습니까?");
      if(isAddStar){
         location.href="test1.do?starVal="+starValue;
      }else{
         
      }
      return false;
   });   
</script>
</html>





