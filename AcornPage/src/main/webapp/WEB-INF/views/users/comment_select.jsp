<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage :: 내 댓글</title>
<jsp:include page="../include/resource.jsp"/>
<style>
.btn-link{
      color:#000;
      font-weight: bold;
   }

</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
	<div class="contentwrapper">
	<div class="container content">
		<table class="table table-striped table-condensed">
		<ul>
		<span>${idid } 님의 댓글정보입니다.</span>
			<c:forEach items="${dto }" var="tmp">
				<dl class="${tmp.commcode}">
					<dt style="position:relative;">				
						<span>${tmp.code }</span>
						<span>${tmp.regdate }</span>
						<span class="${tmp.commcode }"></span>
						<c:if test="${id == tmp.id}">
						<p style="display:inline; position:absolute; top:-10px; right:0px;">
							<span><a onclick="updateBtn('${tmp.commcode}');"><button type="button" class="${tmp.commcode}updateBtn btn btn-link">수정</button></a></span>
							<span><a onclick="cancleBtn('${tmp.commcode}');"><button type="button" class="${tmp.commcode}cancleBtn btn btn-link" style="display:none;">취소</button></a></span>
							<span><a onclick="cmDelete('${tmp.commcode}');"><button type="button" class="deleteBtn btn btn-link">삭제</button></a></span>
						</p>
						</c:if>
						<input type="hidden" name="commcode" value="${tmp.commcode}"/>
						<input type="hidden" name="code" value="${tmp.code}"/>
					</dt>
					<dd>
						<pre class="${tmp.commcode }pre" >${tmp.content }</pre>
						<pre class="${tmp.commcode }pre2" style="display:none; position: relative; white-space: pre-line;">
							<input type="text" class="${tmp.commcode }text" value="${tmp.content }" style="position: absolute; left: 10px; width:90%;"/>
							<span><a href="#" onclick="cmUpdate('${tmp.commcode}');"><button type="button" class="cmUpdate('${tmp.commcode}');" style="position: absolute; right: 10px; top: 10px;">입력</button></a></span>
						</pre>
					</dd>
				</dl>		
			</c:forEach>
		</ul>
		</table>
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
	function updateBtn(commcode){
		var commcode=commcode;

	       if(checkSpace(commcode)==true){
	       	commcode=commcode.replace(/ /gi,".");
	       }
		$("."+commcode+"pre2").show();
		$("."+commcode+"pre").hide();
		$("."+commcode+"text").focus();
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
	
	function cmDelete(commcode){
		var commcode=commcode;
		var checkDel=confirm("댓글을 삭제하시겠습니까?");
		if(checkDel){
			$.ajax({
				url: "${pageContext.request.contextPath }/toon/deleteComment.do",//이동할 주소
				type: "post",
				data: {"commcode": commcode},
				success: function(responseData){
					if(responseData==true){
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
	};
	
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
				url: "${pageContext.request.contextPath }/toon/updateComment.do",//이동할 주소
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
			});
		}else{
			alert("글을 한글자 이상 쓰세요.");
		};
	}
</script>
</body>
</html>