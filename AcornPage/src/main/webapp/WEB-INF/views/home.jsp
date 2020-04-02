<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
.star-rating {width:75px; }
.star-rating,.star-rating span {display:inline-block; height:14px; overflow:hidden; background:url(${pageContext.request.contextPath}/resources/images/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }

</style>
</head>
<body>
<jsp:include page="include/navbar.jsp">
	<jsp:param value="home" name="category"/>
</jsp:include>
<div class="contentwrapper">
	<div class="container content slide"> 
		<div class="your-class">
		  <div><a href="http://localhost:8888/spring05/toon/selectedDetail.do?title=%EC%A0%80%EB%8A%94%20%EB%8B%B9%EC%8B%A0%EC%9D%98%20%EC%95%84%EB%82%B4%EA%B0%80%20%EC%95%84%EB%8B%88%EC%97%90%EC%9A%94"><img class="mainSlide" src="${pageContext.request.contextPath }/resources/images/stil4.png" alt="mainSlide" /></a></div>
		  <div><img class="mainSlide" src="${pageContext.request.contextPath }/resources/images/stil2.png" alt="mainSlide" /></div>
		  <div><img class="mainSlide" src="${pageContext.request.contextPath }/resources/images/stil3.png" alt="mainSlide" /></div>
		</div>
	</div>
	<div class="container content subslide" style="margin-top:15px;"> 
		<div class="your-class" style="padding:15px 0;">
		  <div><img class="subSlide" style="width:90%; height:90px; margin: 0 auto;" src="${pageContext.request.contextPath }/resources/images/subslide1.PNG" alt="mainSlide" /></div>
		  <div><img class="subSlide" style="width:90%; height:90px; margin: 0 auto;" src="${pageContext.request.contextPath }/resources/images/subslide2.PNG" alt="mainSlide" /></div>
		</div>
	</div>
	<div class="container content" style="border-top:20px solid #eee;">
		<h2>웹툰</h2>
		 <div class="bestList">
         <ul>
            <c:forEach var="tmp" items="${requestScope.toonList }">
               <a href="toon/selectedDetail.do?title=${tmp.title }">
               <li>
                  <div class="list">
					<div class="imgwrapper">
		                 <c:choose>
		                    <c:when test="${empty tmp.thumb}">
					           <img class="img-thumbnail" src="<c:url value='/resources/images/no.png'/>" alt="logo"/>                                           	
				            </c:when>
				            <c:otherwise>
				               <img class="img-thumbnail" src="${pageContext.request.contextPath}${tmp.thumb }" alt="logo"/>
				            </c:otherwise>
				         </c:choose>
					</div>
                     <div class="textwrapper">
                        <p class="list-title"><strong>${tmp.title }</strong></p>
						<p class="list-writer">${tmp.writer }</p>
						<p class="list-info">${tmp.info }</p>
						<p style="position:absolute; right:0; top:35px;">
							<span class="wrap-star">
								<span class='star-rating'>
									<span style ="width:<fmt:formatNumber value="${tmp.starvalue *10}" pattern=".0"/>%"></span>
								</span>
								<c:if test="${tmp.starvalue gt 0 }">
                        			<fmt:formatNumber value="${tmp.starvalue }" pattern=".0"/>
                        		</c:if>
							</span>
		                </p>
		                <p style="position:absolute; right:0; top:62px; color:#999999">연재 시작일: ${tmp.regdate }</p>  	
                     </div>
                  </div>
               </li>
               </a>
            </c:forEach>
         </ul>
      </div>		
	</div><!-- //toon list content -->
     
	<div class="container content">
		<h2>웹소설</h2>
		<div class="bestList">
			<ul>
				<c:forEach var="tmp" items="${requestScope.novelList }">
					<a href="toon/selectedDetail.do?title=${tmp.title }">
					<li>
						<div class="list">
							<div class="imgwrapper">
								<c:choose>
				                    <c:when test="${empty tmp.thumb}">
							           <img class="img-thumbnail" src="<c:url value='/resources/images/no.png'/>" alt="logo"/>                                           	
						            </c:when>
						            <c:otherwise>
						               <img class="img-thumbnail" src="${pageContext.request.contextPath}${tmp.thumb }" alt="logo"/>
						            </c:otherwise>
						         </c:choose>
							</div>
							<div class="textwrapper" style="width:70%;">
								<p class="list-title"><strong>${tmp.title }</strong></p>
								<p class="list-writer">${tmp.writer }</p>
								<p class="list-info">${tmp.info }</p>
								<p style="position:absolute; right:0; top:35px;">
									<span class="wrap-star">
										<span class='star-rating'>
											<span style ="width:<fmt:formatNumber value="${tmp.starvalue *10}" pattern=".0"/>%"></span>
										</span>
										<c:if test="${tmp.starvalue gt 0 }">
		                        			<fmt:formatNumber value="${tmp.starvalue }" pattern=".0"/>
		                        		</c:if>
									</span>
				                </p>
		             		    <p style="position:absolute; right:0; top:62px; color:#999999">연재 시작일: ${tmp.regdate }</p>
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






