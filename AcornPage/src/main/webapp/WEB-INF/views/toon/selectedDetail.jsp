<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
	<div class="contentwrapper">
		<div class="container content">
			<div class="list">
				<div class="imgwrapper">
					<img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>
				</div>
				<div class="textwrapper">
					<p>${dto.title }</p>
					<p>${dto.writer }</p>
					<p>${dto.info }</p>
				</div>
			</div>
		</div>
		<table class="table table-striped table-condensed">
		<thead>
			<tr>
				<th>회차</th>
				<th>썸네일</th>
				<th>제목</th>
				<th>별점</th>
				<th>구매</th>
				<th><input type="checkbox" id="AllCheck"/></th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td><!-- ${tmp.writer } -->썸네일</td>
				<td>
					<a href="detailCode.do?code=${tmp.code }">
						<strong>${tmp.title } ${tmp.num }화</strong>
					</a>
				</td>
				<td>
					<c:choose>
						<c:when test="${tmp.starvalue > 0 }">
							<strong><fmt:formatNumber value="${tmp.starvalue }" pattern=".00"/></strong> 점
						</c:when>
						<c:otherwise>
							<strong>이 편은 아직 별점이 없어요. 별점을 ${id } 님이 먼저 매겨주세요!</strong>
						</c:otherwise>
					</c:choose>
				</td>
				<c:choose>
					<c:when test="${tmp.isBuy }">
						<td>소장중</td>
						<td><input type="checkbox" name="selectedCode" value="${tmp.code }" disabled/></td>
					</c:when>
					<c:otherwise>
						<td><a class="btn" href="buyCodeOne.do?code=${tmp.code }&title=${tmp.title }">구매</a></td>
						<td><input type="checkbox" name="selectedCode" value="${tmp.code }"/></td>
					</c:otherwise>
				</c:choose>	
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
	            //input태그의 name이 selectedCode인 태그들을 찾아서(disabled 제외) checked옵션을 true로 정의
	            $("input[name=selectedCode]").not("[disabled]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=selectedCode]").prop("checked",false);
	        }
	    })
	})
	$("#buyAll").click(function(){
		var allSize=$("input[name=selectedCode]").not("[disabled]").length;
		var buySize=$("[disabled]").length;
		var allValue=allSize*100;
		var isBuy=confirm("전체 화 "+allSize+ "편을 구매하시겠습니까?\n"+"총 ${list.size()} 편 중 "+buySize+" 편을 구매했습니다.\n"+allValue+"원이 차감됩니다.");
		if(isBuy){
			location.href="buyAll.do?title=${list[0].title}&price="+allValue;
		}
	});
	$("#buyEach").click(function(){
		var eachSize=$("input[name=selectedCode]:checked").length;
		var allValue=eachSize*100;
		var arrCode=[];
		$("input[name=selectedCode]:checked").each(function(i){

			arrCode.push($(this).val());

			});
		var isBuy=confirm("선택한 화 "+eachSize+ "편을 구매하시겠습니까?\n"+allValue+"원이 차감됩니다.");
		if(isBuy){
			$.ajax({
				url: "buyEach.do",
				type: "post",
				dataType: "text",
				data:
					{"arrEachCode": arrCode},
				success:function(responseData){
					// responseData : {isSuccess:true}
					if(responseData.isSuccess){
						alert(eachSize+" 편 구매했습니다.");
					}
				}	
				
			});
			location.reload();
		}
	})

	</script>
	
	<p><a href="${pageContext.request.contextPath }/home.do"><button><strong>홈으로 가기</strong></button></a></p>
</body>
</html>