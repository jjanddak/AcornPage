<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
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
		  <div><img class="mainSlide" src="${pageContext.request.contextPath }/resources/images/stil1.png" alt="mainSlide" /></div>
		  <div><img class="mainSlide" src="${pageContext.request.contextPath }/resources/images/stil2.png" alt="mainSlide" /></div>
		  <div><img class="mainSlide" src="${pageContext.request.contextPath }/resources/images/stil3.png" alt="mainSlide" /></div>
		</div>
		<!-- <img style="width:100%;" src="${pageContext.request.contextPath }/resources/images/stil1.png" alt="" />  -->
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
					           <img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>                                           	
				            </c:when>
				            <c:otherwise>
				               <img class="img-thumbnail" src="${pageContext.request.contextPath}${tmp.thumb }" alt="logo"/>
				            </c:otherwise>
				         </c:choose>
					</div>
                     <div class="textwrapper">
                        <p class="list-title">${tmp.title }</p>
						<p class="list-writer">${tmp.writer }</p>
						<p class="list-info">${tmp.info }</p>
						<p style="position:absolute; right:0; top:0;">연재 시작일: ${tmp.regdate }</p>
						<p style="position:absolute; right:0; top:0;">
							<span class="wrap-star">
								<span class='star-rating'>
									<span style ="width:<fmt:formatNumber value="${tmp.starvalue *10}" pattern=".0"/>%"></span>
								</span>
								<fmt:formatNumber value="${tmp.starvalue }" pattern=".0"/>
							</span>
						</p>			
                     </div>
                  </div>
               </li>
               </a>
            </c:forEach>
         </ul>
      </div>		
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
								<img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>
							</div>
							<div class="textwrapper" style="width:70%;">
								<p class="list-title">${tmp.title }</p>
								<p class="list-writer">${tmp.writer }</p>
								<p class="list-info">${tmp.info }</p>
								<p style="position:absolute; right:0; top:0;">연재 시작일: ${tmp.regdate }</p>
								<p style="position:absolute; right:0; top:0;">
									<span class="wrap-star">
										<span class='star-rating'>
											<span style ="width:<fmt:formatNumber value="${tmp.starvalue *10}" pattern=".0"/>%"></span>
										</span>
										<fmt:formatNumber value="${tmp.starvalue }" pattern=".0"/>
									</span>
								</p>
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






