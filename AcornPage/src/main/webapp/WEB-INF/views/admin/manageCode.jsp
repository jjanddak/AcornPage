<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage :: admin</title>
<jsp:include page="../include/resource.jsp"/>
<style>
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
	<div style="margin-right: 30px;">
		<h3>작품관리 상세보기창</h3>
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
			<tr>
				<th>삭제</th>
				<td><button class="btn btn-danger btn-sm">삭제</button></td>
			</tr>
		</table>
		<div class="contents">${dto.content }</div>
		<br/>
		
		<c:choose>
			<c:when test="${dto.prevNum eq 0 }">
				<div></div>
			</c:when>
			<c:when test="${empty havePrev}">
				<a class="btn" href="${pageContext.request.contextPath}/admin/manageCode.do?title=${dto.title }&code=${dto.title}${dto.num-1}">이전화</a>
			</c:when>
			<c:otherwise>			
				<a class="btn" href="${pageContext.request.contextPath}/admin/manageCode.do?title=${dto.title }&code=${dto.title}${dto.num-1}">이전화</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${dto.nextNum eq 0 }">
				<div></div>
			</c:when>
			<c:when test="${empty haveNext}">
				<a class="btn" href="${pageContext.request.contextPath}/admin/manageCode.do?title=${dto.title }&code=${dto.title}${dto.num+1}">다음화</a>
			</c:when>
			<c:otherwise>			
				<a class="btn" href="${pageContext.request.contextPath}/admin/manageCode.do?title=${dto.title }&code=${dto.title}${dto.num+1}">다음화</a>
			</c:otherwise>
		</c:choose>		
		<ul>
			<c:forEach items="${toonCommentList }" var="tmp">
				<dl class="${tmp.commcode }">
					<dt>				
						<span>${tmp.id }</span>
						<span>${tmp.regdate }</span>
						<p style="display:inline; float:right; margin: -5px 0 0 0;">
							<button class="del btn-link">
								<span class="${tmp.commcode }" style="font-weight: bold;">삭제</span>
							</button>
						</p>
					</dt>
					<dd style="margin-top: 15px;">
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
</div>
<script>
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
	
	$(".del").click(function(){
		var ele=$(this);
		var commcode=ele.children()[0].className;
		var check_del=confirm("댓글을 삭제하시겠습니까?");
		if(check_del){
			$.ajax({
				url:"../toon/deleteComment.do",
				method:"post",
				data:{"commcode":commcode},
				success:function(){
					//공백체크함수
					function checkSpace(str) { 
				        if(str.search(/\s/) != -1) { 
				            return true; 
				        } else { 
				            return false; 
				        } 
				    };
				    var changecode;
				    var check=checkSpace(commcode);
				    if(check==true){
				    	changecode=commcode.replace(/ /gi,".");
				    	$("dl."+changecode).remove();
				    }else{
				    	$("dl."+commcode).remove();
				    }
					
				}
			})
		}else{
			
		}	
	});
	$(".btn-danger").click(function(){
		var check_remove=confirm("해당 화를 삭제하시겠습니까?");
		if(check_remove){
			location.href="deleteCode.do?title=${dto.title}&code=${dto.code }&writer=${dto.writer }";
		}else{
			
		}
	})
</script>
</body>
</html>