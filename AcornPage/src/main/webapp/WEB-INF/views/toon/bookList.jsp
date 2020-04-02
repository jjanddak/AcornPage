<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acornpage :: 도서검색</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	li:hover{
		background-color:#eee;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="book" name="category"/>
</jsp:include>
<div class="contentwrapper">
	<div class="container content">
		<div style="text-align:center;">
		<form action="">
			<label for="book" class="sr-only"></label>
				<input type="text" id="book" name="book" class="form-control" autocomplete="off"
					placeholder="도서 검색" style="width:300px; display:inline;"/>
			<button id="book-search" class="btn btn-primary">검색</button>
		</form>
		</div>
		
	</div>
	<div class="container content dis" style="display:none;"> 
		<div class="bestList">
        <ul class="test">
	        
        </ul> 
        </div>
	</div>
</div>
<script>
	$("#book-search").click(function(){
		var book=$("#book").val();
		$(".test").empty();
		$(".dis").prop("style","display:flex");
		$.ajax({
			method:"GET",
			url:"https://dapi.kakao.com/v3/search/book?target=title",
			data:{ query: book },
			headers:{Authorization: "KakaoAK 9b456cbab22593b2f6780218d12bdd9a"},
		})
			.done(function(msg){
			console.log(msg.documents[0].title);
			console.log(msg.documents[0].thumbnail);
			for(let i=0; i<msg.documents.length; i++){
				$('ul.test').append('<li class=cle'+i+'></li>');
				$("<div class=book-list></div>").appendTo('li.cle'+i).addClass('a'+i);
				$("<div class=imgwrapper></div>").appendTo('div.a'+i).addClass('b'+i);
				$('div.b'+i).append('<img src='+msg.documents[i].thumbnail+'/>').addClass('img-book');
				$("<div class=textwrapper></div>").appendTo('div.a'+i).addClass('c'+i);
				$("<p class=list-title>"+msg.documents[i].title+"</p>").appendTo('div.c'+i);
				$("<p class=list-writer>"+msg.documents[i].authors+"</p>").appendTo('div.c'+i);
			}
		});
		return false;
	});
	
</script>
</body>
</html>