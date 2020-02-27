<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
	<div class="container">
		<div class="buy" style="float:right">
			<ul style="list-style:none">
				<li class="btn btn-primary" id="buyEach" style="float:left"><a style="color:#fff" href="">선택구매</a></li>
				<li class="btn btn-warning" id="buyAll" style="float:left"><a style="color:#fff" href="#">전체구매</a></li>
			</ul>
		</div>
		<table class="table table-striped table-condensed">
		<thead>
			<tr>
				<th>회차</th>
				<th>썸네일</th>
				<th>제목</th>
				<th>구매</th>
				<th><input type="checkbox" id="AllCheck"/></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.num }</td>
				<td><!-- ${tmp.writer } -->썸네일</td>
				<td>
					<a href="detailCode.do?code=${tmp.code }">
						${tmp.title }
					</a>
				</td>
				<td><a class="btn" href="buyCodeOne.do?code=${tmp.code }">구매</a></td>
				<td><input type="checkbox" name="selectedCode" value="${tmp.code }"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<script>
	$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("#AllCheck").click(function(){
	        //클릭되었으면
	        if($("#AllCheck").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=selectedCode]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=selectedCode]").prop("checked",false);
	        }
	    })
	})
	$("#buyAll").click(function(){
		var allSize=${list.size()};
		var allValue=allSize*100;
		var isBuy=confirm("전체 화 "+allSize+ "편을 구매하시겠습니까?\n"+allValue+"원이 차감됩니다.");
		if(isBuy){
			location.href="buyAll.do?title=${list[0].title}&price="+allValue;
		}
	});
	
	
	</script>
</body>
</html>