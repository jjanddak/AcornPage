<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지입니당</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
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
	<div class="container">
		<h3>카페 글 상세 보기</h3>
			<table class="table table-bordered table-condensed">
			<colgroup>
				<col class="col-xs-3"/>
				<col class="col-xs-9"/>
			</colgroup>
			<tr>
				<th>글번호</th>
				<td>${dto.num }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.writer }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th>평균 별점</th>
				<td><fmt:formatNumber value="${starvalueAVG }" pattern=".00"/> 점</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${dto.upload }</td>
			</tr>
		</table>
		<div class="contents">${dto.content }</div>
	<form action="starAdd.do" method="post">
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
	
	<p><a href="${pageContext.request.contextPath }/home.do"><button><strong>홈으로 가기</strong></button></a></p>
</body>
<script>
var formObj = $("form[role='form']");//폼 가저오기

    $('#star_grade a').click(function(){
        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        return false;
    });
    
    
    $("#starBtn").click(function(){
      var starValue = document.querySelectorAll(".on").length*2;
      var isAddStar=confirm("평점"+starValue+"을 제출하시겠습니까?");
      if(isAddStar){
         location.href="starAdd.do?starValue="+starValue+"&code=${dto.code}";
      }else{
         
      }
      return false;
   });   
</script>
</html>