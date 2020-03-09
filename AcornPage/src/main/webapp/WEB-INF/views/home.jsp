<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/navbar.jsp">
	<jsp:param value="home" name="category"/>
</jsp:include>
<<<<<<< HEAD
<div class="contentwrapper">
	<div class="container content slide"> 
		<div class="your-class">
		  <div><p style="width:100%; height:450px; background-color:green; margin:0px;"></p></div>
		  <div><p style="width:100%; height:450px; background-color:blue; margin:0px;"></p></div>
		  <div><p style="width:100%; height:450px; background-color:grey; margin:0px;"></p></div>
		</div>
<div class="container content" style="border-top:20px solid #eee;">
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
</div>

      <div class="bestList">
         <ul>
            <c:forEach var="tmp" items="${requestScope.list }">
               <a href="toon/selectedDetail.do?title=${tmp.title }">
               <li>
                  <div class="list">
                     <div class="imgwrapper">
                     <c:choose>
                     	<c:when test="${empty tmp.thumb}">
	                        <img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>                                           	
                     	</c:when>
                     	<c:otherwise>
                     		<img class="img-thumbnail" src="${pageContext.request.contextPath}${tmp.thumb }" alt="logo"/>
                     	</c:otherwise>
                     </c:choose>
                     </div>
                     <div class="textwrapper">
                        <p>${tmp.title }</p>
                        <p>${tmp.writer }</p>
                        <p>${tmp.info }</p>
                     </div>
                  </div>
               </li>
               </a>
            </c:forEach>
         </ul>
      </div>
   </div><!-- //toon list content -->
	<div class="container content">
		<div class="bestList">
			<ul>
				<c:forEach var="tmp" items="${requestScope.list }">
					<a href="toon/selectedDetail.do?title=${tmp.title }">
					<li>
						<div class="list">
							<div class="imgwrapper">
								<img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>
							</div>
							<div class="textwrapper">
								<p>${tmp.title }</p>
								<p>${tmp.writer }</p>
								<p>${tmp.info }</p>
							</div>
						</div>
					</li>
					</a>
				</c:forEach>
			</ul>
		</div>
	</div><!-- //novel list content -->

</div><!-- //contentwrapper -->
</body>
<script>

	$(document).ready(function(){
		  $('.your-class').slick({
			  slidesToShow: 3,
			  slidesToShow: 1,
			  slidesToScroll: 1,
			  autoplay:true,
			  autoplaySpeed:5000,
			  speed:1000,
			  pauseOnHover:true,
			  infinite:true,
			  arrow:true,
		  });
		});	
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






