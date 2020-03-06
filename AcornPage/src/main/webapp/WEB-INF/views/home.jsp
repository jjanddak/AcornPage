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
                        <img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>
                     </div>
                     <div class="textwrapper">
                        <p class="list-title">${tmp.title }</p>
						<p class="list-writer">${tmp.writer }</p>
						<p class="list-info">${tmp.info }</p>
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
							<div class="textwrapper" style="width:70%;">
								<p class="list-title">${tmp.title }</p>
								<p class="list-writer">${tmp.writer }</p>
								<p class="list-info">${tmp.info }</p>
								<p style="position:absolute; right:0; top:0;">등록날짜</p>
								<p style="position:absolute; right:0; top:40px;">별점</p>
							</div>
						</div>
					</li>
					</a>
				</c:forEach>
			</ul>
		</div>
	</div><!-- //novel list content -->

	<div class="comments">
		<!-- 댓글을 작성할수 있는 폼 -->
		<p>의견쓰기</p>
		<div class="comment_form">
			<form action="comment_insert.do" method="post">
				<textarea name="content"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
				<button type="submit">등록</button>
			</form>
		</div>
	</div>
		<ul>
			<c:forEach items="${toonCommentList }" var="tmp">
				<dl>
					<dt>				
						<span>${tmp.id }</span>
						<span>${tmp.regdate }</span>
						<span>${tmp.likeCount }</span>
						<span><a href="commentlike.do?writer=${tmp.id}&&commcode=${tmp.commcode}">좋아요</a></span>
					</dt>
					<dd>
						<pre>${tmp.content }</pre>
					</dd>
				</dl>		
			</c:forEach>
		</ul>
	</div>
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
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form").on("submit", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="home.do";
			return false;//폼 전송 막기 
		}
	});
	//폼에 click 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form textarea").on("click", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			var isMove=confirm("로그인 페이지로 이동 하시겠습니까?");
			if(isMove){
				location.href="users/loginform.do";
			}
		}
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






