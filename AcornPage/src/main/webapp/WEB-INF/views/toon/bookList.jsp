<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="contentwrapper">
	<div class="container content"> 
		<div class="bestList">
        <ul class="test">
        <!-- 스타또 -->
	        
        </ul> 
        </div>
        <p>북하(책 하이라는 뜻)</p>
	</div>
</div>
<script>
	$.ajax({
		method:"GET",
		url:"https://dapi.kakao.com/v3/search/book?target=title",
		data:{ query: "에이콘" },
		headers:{Authorization: "KakaoAK 9b456cbab22593b2f6780218d12bdd9a"},
	})
		.done(function(msg){
			console.log(msg);
		console.log(msg.documents[0].title);
		console.log(msg.documents[0].thumbnail);
		for(let i=0; i<msg.documents.length; i++){
			$('ul.test').append('<li class=cle'+i+'></li>');
			$("<div class=book-list></div>").appendTo('li.cle'+i).addClass('a'+i);
			$("<div class=imgwrapper></div>").appendTo('div.a'+i).addClass('b'+i);
			$('div.b'+i).append('<img src='+msg.documents[i].thumbnail+'/>').addClass('img-book');
			$("<div class=textwrapper></div>").appendTo('div.a'+i).addClass('c'+i);
			$("<p class=list-title>"+msg.documents[i].title+"</p>").appendTo('div.c'+i);


		}
	});
</script>
</body>
</html>