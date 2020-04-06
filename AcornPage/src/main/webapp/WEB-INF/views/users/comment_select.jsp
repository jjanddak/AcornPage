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
					<dt>				
						<span>${tmp.code }</span>
						<span>${tmp.regdate }</span>
						<span class="${tmp.commcode }"></span>
						<c:if test="${id == tmp.id}">
							<span><a onclick="cmDelete('${tmp.commcode}');"><button type="button" class="deleteBtn">삭제</button></a></span>
							<span><a onclick="updateBtn('${tmp.commcode}');"><button type="button" class="${tmp.commcode}updateBtn">수정</button></a></span>
							<span><a onclick="cancleBtn('${tmp.commcode}');"><button type="button" class="${tmp.commcode}cancleBtn" style="display:none;">취소</button></a></span>
						</c:if>
						<input type="hidden" name="commcode" value="${tmp.commcode}"/>
						<input type="hidden" name="code" value="${tmp.code}"/>
						</form>
					</dt>
					<dd>
						<pre class="${tmp.commcode }pre" >${tmp.content }</pre>
						<pre class="${tmp.commcode }pre2" style="display:none; position: relative;">
							<input type="text" class="${tmp.commcode }text" value="${tmp.content }" style="position: absolute; left: 10px; width:700px"/>
							<span><a href="#" onclick="cmUpdate('${tmp.commcode}');"><button type="button" class="cmUpdate('${tmp.commcode}');" style="position: absolute; left: 10px; bottom: 14px;">입력</button></a></span>
						</pre>
					</dd>
				</dl>		
			</c:forEach>
		</ul>
		</table>
	</div>
	</div>
<script>

	function updateBtn(commcode){
		var commcode=commcode;
		$("."+commcode+"pre2").show();
		$("."+commcode+"pre").hide();
		$("."+commcode+"text").focus();
		$("."+commcode+"cancleBtn").show();
		$("."+commcode+"updateBtn").hide();
	};
		
	function cancleBtn(commcode){
		var commcode=commcode;
		$("."+commcode+"pre").show();
		$("."+commcode+"pre2").hide();
		$("."+commcode+"updateBtn").show();
		$("."+commcode+"cancleBtn").hide();
	}
	
	function cmDelete(commcode){
		var commcode=commcode;
	$.ajax({
		url: "commentDelete.do",//이동할 주소
		type: "post",
		data: {"commcode": commcode},
		success: function(responseData){
			if(responseData==true){
				$("."+commcode).remove();
			}	
		}
	})
	};
	
	function cmUpdate(commcode){
	var commcode = commcode;
	var result1 = $("."+commcode+"text").val();	
	/* var result1 = prompt("여기에 수정할 댓글을 입력하세요"+num); */
	if(result1 != ""){
		$.ajax({
			url: "updateComment.do",//이동할 주소
			type: "post",
			data: {"commcode": commcode, "content":result1},
			success: function(responseData){
				if(responseData==true){
					$("."+commcode+"pre").show();
					$("."+commcode+"pre").text(result1);
					$("."+commcode+"pre2").hide();
			    	$("."+commcode+"updateBtn").show();
			    	$("."+commcode+"cancleBtn").hide();
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