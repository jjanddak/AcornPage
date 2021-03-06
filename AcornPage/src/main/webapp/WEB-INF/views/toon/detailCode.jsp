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
   .contents p img{
      width:100%;
   }
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="contentwrapper">
   <div class="container content">
   <div class="container">
   <div style="margin-right: 30px;">
         <table class="table table-bordered table-condensed">
         <colgroup>
            <col class="col-xs-3"/>
            <col class="col-xs-9"/>
         </colgroup>
         <tr>
            <th>회차</th>
            <td>${dto.num }</td>
         </tr>
         <tr>
            <th>작가</th>
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
                     <strong>아직 별점이 없습니다. 별점을 등록해보세요!</strong>
                  </c:otherwise>
               </c:choose>
            </td>
         </tr>
         <tr>
            <th>업로드날짜</th>
            <td>${dto.upload }</td>
         </tr>
      </table>
      <div class="contents">${dto.content }</div>
      <br/>
      <div style="text-align: center; margin-bottom:20px;">
      <c:choose>
         <c:when test="${dto.prevNum eq 0 }">
            <div></div>
         </c:when>
         <c:when test="${empty havePrev}">
            <a class="btn" href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.title}${dto.prevNum}">
           		이전화
			</a>
         </c:when>
         <c:otherwise>         
            <a class="btn" href="buyCodeOne.do?title=${dto.title }&code=${dto.title}${dto.prevNum}" 
            onclick="return confirm('구매하시겠습니까? 100원이 차감됩니다')">
           		 이전화 구매</a>
         </c:otherwise>
      </c:choose>
      <c:choose>
         <c:when test="${dto.nextNum eq 0 }">
            <div></div>
         </c:when>
         <c:when test="${empty haveNext}">
            <a class="btn" href="${pageContext.request.contextPath}/toon/detailCode.do?title=${dto.title }&code=${dto.title}${dto.nextNum}">
            	다음화
           	</a>
         </c:when>
         <c:otherwise>         
            <a class="btn" href="buyCodeOne.do?title=${dto.title }&code=${dto.title}${dto.nextNum}" 
            onclick="return confirm('구매하시겠습니까? 100원이 차감됩니다')">
      	      다음화 구매</a>
         </c:otherwise>
      </c:choose>
      </div>   
   <form action="starAdd.do" method="post">
      <p id="star_grade" style="text-align: center;">
         <a href="#" class="1" id="2">★</a>
         <a href="#" class="2" id="4">★</a>
         <a href="#" class="3" id="6">★</a>
         <a href="#" class="4" id="8">★</a>
         <a href="#" class="5" id="10">★</a>
      </p>
   </form>
   
   
   <div class="comments">
      <!-- 댓글을 작성할수 있는 폼 -->
      <div class="comment_form">
         <h4>의견쓰기</h4>
         <form action="${pageContext.request.contextPath}/toon/comment_insert.do?code=${dto.code}&title=${dto.title }" method="post">
            <textarea name="content" style="width:93%"><c:if test="${empty id }">댓글을 작성하려면 로그인이 필요합니다.</c:if></textarea>
            <button type="submit" style="float:right; height: 46px;">등록</button>
         </form>
      </div>
   </div>
      <ul>
         <c:forEach items="${toonCommentList }" var="tmp">
            <dl class="${tmp.commcode }">

               <dt>            
                  <span><a href="${pageContext.request.contextPath}/users/comment_select.do?id=${tmp.id }">${tmp.id }</a></span>
                  <span>${tmp.regdate }</span>
                  <form style="display:inline;" action="commentlike.do" class="likeForm" method="post">
	                  <input type="hidden" name="commcode" value="${tmp.commcode}"/>
	                  <input type="hidden" name="code" value="${tmp.code}"/>
	                  <button <c:if test="${tmp.isLike eq true}">style="color:blue;"</c:if> class="like btn btn-link" type="button">
	                     <span class="glyphicon glyphicon-thumbs-up"></span>
	                  </button>
                  </form>
                  <span class="${tmp.commcode }like"> <strong>${tmp.likeCount }</strong></span>
                  <p style="display:inline; float:right; margin: 5px 20px 0 0;">
	                  <c:if test="${tmp.id eq id}">
	                    <a onclick="updateBtn('${tmp.commcode}'); return false;">
	                    	<button type="button" class="${tmp.commcode}updateBtn btn-link">
	                    		<span style="font-weight: bold;">
	                    			수정
	                   			</span>
	              			</button>
	        			</a>
	                     <a onclick="cancleBtn('${tmp.commcode}');">
	                     	<button type="button" class="${tmp.commcode}cancleBtn btn-link" style="display:none;">
	                     		<span style="font-weight: bold;">
	                     			취소
	                   			</span>
	           				</button>
	         			</a>
	                     <button class="del btn-link"><span class="${tmp.commcode }" style="font-weight: bold;">삭제</span></button>
	                  </c:if>
                  </p>
               </dt>
               <dd>
                  <pre class="${tmp.commcode }pre" >${tmp.content }</pre>
                  <pre class="${tmp.commcode }pre2" style="display:none; position: relative; white-space: pre-line;">
                     <input type="text" class="${tmp.commcode }text" value="${tmp.content }" style="position: absolute; left: 10px; width:90%"/>
                     <span><a onclick="cmUpdate('${tmp.commcode}');"><button type="button" class="cmUpdate('${tmp.commcode}');" style="position: absolute; top: 10px; right: 8px;">입력</button></a></span>
                  </pre>
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
	function checkSpace(str) { 
	    if(str.search(/\s/) != -1) { 
	        return true; 
	    } else { 
	        return false; 
	    } 
	};
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
    	var tmp=$(this).attr("id");
        var isAddStar=confirm("평점 "+tmp+" 점을 제출하시겠습니까?");
        if(isAddStar){
        	$(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            var starValue = document.querySelectorAll(".on").length*2;
            var starvalue2 = $("#starman")
            location.href="starAdd.do?starValue="+starValue+"&code=${dto.code}&title=${dto.title}";
        }else{
        	var myStar="${myStar}"/2;
            $("."+myStar).addClass("on").prevAll("a").addClass("on");
        }
        return false;
    });

    function cmUpdate(commcode){
    	var commcode = commcode;
    	var spaceCode;
        if(checkSpace(commcode)==true){
        	spaceCode=commcode.replace(/ /gi,".");
        }else{
        	spaceCode=commcode;
        }
       var result1 = $("."+spaceCode+"text").val();   
       /* var result1 = prompt("여기에 수정할 댓글을 입력하세요"+num); */
       if(result1 != ""){
          $.ajax({
             url: "updateComment.do",//이동할 주소
             type: "post",
             data: {"commcode": commcode, "content":result1},
             success: function(responseData){
                if(responseData==true){
                   $("."+spaceCode+"pre").show();
                   $("."+spaceCode+"pre").text(result1);
                   $("."+spaceCode+"pre2").hide();
                    $("."+spaceCode+"updateBtn").show();
                    $("."+spaceCode+"cancleBtn").hide();
                }
             }
          })
       }else{
          alert("글을 한글자 이상 쓰세요.");
       }
    }
    
    function updateBtn(commcode){
       var commcode=commcode;

       if(checkSpace(commcode)==true){
       	commcode=commcode.replace(/ /gi,".");
       }
       
       $("."+commcode+"pre2").show();
       $("."+commcode+"pre").hide();
       $("."+commcode+"cancleBtn").show();
       $("."+commcode+"updateBtn").hide();
    };
    function cancleBtn(commcode){
    	
       var commcode=commcode;
       if(checkSpace(commcode)==true){
       	commcode=commcode.replace(/ /gi,".");
       }
      $("."+commcode+"pre").show();
      $("."+commcode+"pre2").hide();
       $("."+commcode+"updateBtn").show();
       $("."+commcode+"cancleBtn").hide();
    }

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
            }else{
               code=responseData.code;
            }
            if(responseData.checkLike==false){
               ele.prop("style","color: black;");
               ele.parents()[1].children[3].textContent=count;
            }else{
               ele.prop("style","color: blue;");
               ele.parents()[1].children[3].textContent=count;
            }
         }
      });
   });
   $(".del").click(function(){
	      var ele=$(this);
	      var commcode=ele.children()[0].className;
	      var checkDel=confirm("댓글을 삭제하시겠습니까?");
	      if(checkDel){
	         $.ajax({
	            url:"deleteComment.do",
	            method:"post",
	            data:{"commcode":commcode},
	            success:function(responseData){
	               if(responseData){
	                   var spaceCode;
	                   if(checkSpace(commcode)==true){
	                     //replace함수를 통해 공백을 .으로 변환하고 빈 변수에 담는다.
	                     //replace("",".")와 replace(/ /gi,".") 차이점은 /""/ 따옴표 안에 바꿀 문자열(ex:#,!등)
	                     //을 넣고 /뒤에 gi를 선언하면 replaceAll효과가 있다. 스크립트에선 replaceAll이란 함수는 존재하지 않는다. 
	                     spaceCode=commcode.replace(/ /gi,".");                  
	                     $("dl."+spaceCode).remove();
	                  }else{
	                     $("dl."+commcode).remove();
	                  }
	               }
	            }
	         })
	      }      
	   });
</script>
</body>
</html>