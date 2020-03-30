<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage</title>
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
				<dl class="${tmp.num}">
					<dt>				
						<span>${tmp.code }</span>
						<span>${tmp.regdate }</span>
						<span class="${tmp.commcode }"></span>
						<c:if test="${id == tmp.id}">
							<span><a href="#" onclick="cmDelete(${tmp.num});"><button type="button" class="deleteBtn">삭제</button></a></span>
							<span><a href="#" onclick="updateBtn(${tmp.num});"><button type="button" class="${tmp.num}updateBtn">수정</button></a></span>
							<span><a href="#" onclick="cancleBtn(${tmp.num});"><button type="button" class="${tmp.num}cancleBtn" style="display:none;">취소</button></a></span>
						</c:if>
						<input type="hidden" name="commcode" value="${tmp.commcode}"/>
						<input type="hidden" name="code" value="${tmp.code}"/>
						</form>
					</dt>
					<dd>
						<pre class="${tmp.num }pre" >${tmp.content }</pre>
						<pre class="${tmp.num }pre2" style="display:none; position: relative;">
							<input type="text" class="${tmp.num }text" value="${tmp.content }" style="position: absolute; left: 10px; width:700px"/>
							<span><a href="#" onclick="cmUpdate(${tmp.num});"><button type="button" class="cmUpdate(${tmp.num});" style="position: absolute; left: 10px; bottom: 14px;">입력</button></a></span>
						</pre>
					</dd>
				</dl>		
			</c:forEach>
		</ul>
		</table>
	</div>
	</div>
<script>

	function updateBtn(num){
		var num=num;
		$("."+num+"pre2").show();
		$("."+num+"pre").hide();
		$("."+num+"text").focus();
		$("."+num+"cancleBtn").show();
		$("."+num+"updateBtn").hide();
	};
	
	function cancleBtn(num){
		var num=num;
		$("."+num+"pre").show();
		$("."+num+"pre2").hide();
		$("."+num+"updateBtn").show();
		$("."+num+"cancleBtn").hide();
	}
	
	function cmDelete(num){
		var num=num;
	$.ajax({
		url: "commentDelete.do",//이동할 주소
		type: "post",
		data: {"num": num},
		success: function(responseData){
			if(responseData==true){
				$("."+num).remove();
			}	
		}
	})
	};
	
	function cmUpdate(num){
	var num = num;
	var result1 = $("."+num+"text").val();	
	/* var result1 = prompt("여기에 수정할 댓글을 입력하세요"+num); */
	if(result1 != ""){
		$.ajax({
			url: "updateComment.do",//이동할 주소
			type: "post",
			data: {"num": num, "content":result1},
			success: function(responseData){
				if(responseData==true){
					$("."+num+"pre").show();
					$("."+num+"pre").text(result1);
					$("."+num+"pre2").hide();
			    	$("."+num+"updateBtn").show();
			    	$("."+num+"cancleBtn").hide();
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