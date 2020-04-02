<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage :: ${dto.title }</title>
<jsp:include page="../include/resource.jsp"/>
<style>
.star-rating {width:75px; }
.star-rating,.star-rating span {display:inline-block; height:14px; overflow:hidden; background:url(${pageContext.request.contextPath}/resources/images/star.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
	.btn-link{
		color:#000;
	}
	.contents{
		text-align: center;
	}
	.contents *{
		max-width: 100%;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="contentwrapper">
   <div class="container content">
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
				<td id="title">${dto.title }</td>
			</tr>
			<tr>
				<th>회별 별점</th>
				<td>
					<c:choose>
						<c:when test="${starvalueAVG>0 }">
							<span class="wrap-star">
								<span class='star-rating'>
									<span style ="width:<fmt:formatNumber value="${starvalueAVG *10}" pattern=".0"/>%"></span>
								</span>
								<fmt:formatNumber value="${starvalueAVG }" pattern=".0"/>
							</span>
						</c:when>
						<c:otherwise>
							<strong>이 편은 아직 별점이 없어요. 별점을 ${id } 님이 먼저 매겨주세요!</strong>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${dto.upload }</td>
			</tr>
		</table>
		<div class="contents">${dto.content }</div>
		<br/>
		
		<c:choose>
			<c:when test="${dto.prevNum eq 0 }">
				<div></div>
			</c:when>
			<c:when test="${empty havePrev}">
				<a class="btn" href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.title}${dto.num-1}">이전화</a>
			</c:when>
			<c:otherwise>			
				<a class="btn" href="buyCodeOne.do?title=${dto.title }&code=${dto.title}${dto.num-1}" 
				onclick="return confirm('구매하시겠습니까? 100원이 차감됩니다')">
				이전화 구매</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${dto.nextNum eq 0 }">
				<div></div>
			</c:when>
			<c:when test="${empty haveNext}">
				<a class="btn" href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.title}${dto.num+1}">다음화</a>
			</c:when>
			<c:otherwise>			
				<a class="btn" href="buyCodeOne.do?title=${dto.title }&code=${dto.title}${dto.num+1}" 
				onclick="return confirm('구매하시겠습니까? 100원이 차감됩니다')">
				다음화 구매</a>
			</c:otherwise>
		</c:choose>	
	<form action="starAdd.do" method="post">
		<p id="star_grade">
			<a href="#" class="1">★</a>
			<a href="#" class="2">★</a>
			<a href="#" class="3">★</a>
			<a href="#" class="4">★</a>
			<a href="#" class="5">★</a>
		</p>
		<button id="starBtn" type="submit">별점제출</button>
	</form>
	
	
	<div class="comments">
		<!-- 댓글을 작성할수 있는 폼 -->
		<div class="comment_form">
			<h4>의견쓰기</h4>
			<form action="${pageContext.request.contextPath}/toon/comment_insert.do?code=${dto.code}&title=${dto.title }" method="post">
				<textarea name="content" style="width:100%"><c:if test="${empty id }">댓글을 작성하려면 로그인이 필요합니다.</c:if></textarea>
				<button type="submit">등록</button>
			</form>
		</div>
	</div>
		<ul>
			<c:forEach items="${toonCommentList }" var="tmp">
				<dl class="${tmp.commcode }">
					<dt>				
						<span>${tmp.id }</span>
						<span>${tmp.regdate }</span>
						<span class="${tmp.commcode }like">${tmp.likeCount }</span>
						
						<form style="display:inline;" action="commentlike.do" id="likeForm" method="post">
						<input type="hidden" name="commcode" value="${tmp.commcode}"/>
						<input type="hidden" name="code" value="${tmp.code}"/>
						<button <c:if test="${tmp.isLike eq true}">style="color:blue;"</c:if> class="like btn btn-link" type="button">
							<span class="glyphicon glyphicon-thumbs-up"></span>
						</button>
						</form>
						<p style="display:inline; float:right; margin: 5px 20px 0 0;">
						<c:if test="${tmp.id eq id}">
							<a href=""><span>수정</span></a>
							<button class="del btn-link"><span class="${tmp.commcode }" style="font-weight: bold;">삭제</span></button>
						</c:if>
						</p>
					</dt>
					<dd>
						<pre>${tmp.content }</pre>
					</dd>
				</dl>		
			</c:forEach>
		</ul>

	<p><a href="${pageContext.request.contextPath }/home.do"><button><strong>홈으로 가기</strong></button></a></p>
</div>


	   <div class="page-display">
      <ul class="pagination">
      <c:choose>
         <c:when test="${startPageNum ne 1 }">
            <li>
               <a href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.code}&pageNum=${startPageNum-1 }">
                  &laquo;
               </a>
            </li>
         </c:when>
         <c:otherwise>
            <li class="disabled">
               <a href="javascript:">&laquo;</a>
            </li>
         </c:otherwise>
      </c:choose>
      <c:forEach var="i" begin="${startPageNum }" 
         end="${endPageNum }" step="1">
         <c:choose>
            <c:when test="${i eq pageNum }">
               <li class="active"><a href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.code}&pageNum=${i }">${i }</a></li>
            </c:when>
            <c:otherwise>
               <li><a href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.code}&pageNum=${i }">${i }</a></li>
            </c:otherwise>
         </c:choose>
      </c:forEach>
<!--       페이징처리 -->
      <c:choose>
         <c:when test="${endPageNum lt totalPageCount }">
            <li>
               <a href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.code}&pageNum=${endPageNum+1 }">
                  &raquo;
               </a>
            </li>
         </c:when>
         <c:otherwise>
            <li class="disabled">
               <a href="javascript:">&raquo;</a>
            </li>
         </c:otherwise>
      </c:choose>
      </ul>      
   </div>     
   </div>  
</div>
<script>
	$(document).ready(function(){
		var myStar="${myStar}"/2;
		$("."+myStar).addClass("on").prevAll("a").addClass("on");
		
	})
	var formObj = $("form[role='form']");//폼 가저오기

	$('#left').click(function(){
		$('score').values('10');
	});
	$('#right').click(function(){
		
	});
var formObj = $("form[role='form']");//폼 가저오기

    $('#star_grade a').click(function(){
        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        return false;
    });
    
    
    $("#starBtn").click(function(){
      var starValue = document.querySelectorAll(".on").length*2;
      var starvalue2 = $("#starman")
      var isAddStar=confirm("평점"+starValue+"를 제출하시겠습니까?");
      if(isAddStar){
         location.href="starAdd.do?starValue="+starValue+"&code=${dto.code}&title=${dto.title}";
      }else{
         
      }
      return false;
   	}); 
	//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comments form").on("submit", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin==false){
			alert("로그인 페이지로 이동 합니다.");
			location.href="${pageContext.request.contextPath}/home.do";
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
				location.href="${pageContext.request.contextPath}/users/loginform.do";
			}
		}
	});
	$(".like").click(function(){
		var ele=$(this);
		var commcode=ele.parent().children()[0].value;
		var code=ele.parent().children()[1].value;
		//var formData = ele.parent().serialize();
		var arrCode=[];
		arrCode.push(code);
		arrCode.push(commcode);
		$.ajax({
			url: "commentlike.do",//이동할 주소
			type: "post",
			data: {"arrEachCode": arrCode},

			success:function(responseData){
				//공백체크함수
				function checkSpace(str) { 
			        if(str.search(/\s/) != -1) { 
			            return true; 
			        } else { 
			            return false; 
			        } 
			    };
				//빈 변수 선언하고
				var code;
				var count=responseData.count;
				//공백체크함수로 response된 code에 공백이 있다면
				if(checkSpace(responseData.code)==true){
					//replace함수를 통해 공백을 .으로 변환하고 빈 변수에 담는다.
					//replace("",".")와 replace(/ /gi,".") 차이점은 /""/ 따옴표 안에 바꿀 문자열(ex:#,!등)
					//을 넣고 /뒤에 gi를 선언하면 replaceAll효과가 있다. 스크립트에선 replaceAll이란 함수는 존재하지 않는다. 
					code=responseData.code.replace(/ /gi,".");
					console.log(code);
				}else{
					code=responseData.code;
				}
				if(responseData.checkLike==false){
					ele.prop("style","color: black;");
					$("."+code+"like").text(count);
				}else{
					ele.prop("style","color: blue;");
					$("."+code+"like").text(count);
				}
			}
		});
	});
	$(".del").click(function(){
		var ele=$(this);
		var commcode=ele.children()[0].className;
		$.ajax({
			url:"deleteComment.do",
			method:"post",
			data:{"commcode":commcode},
			success:function(){
				
				$("dl."+commcode).remove();
				
			}
		})
	});
</script>
</body>
</html>