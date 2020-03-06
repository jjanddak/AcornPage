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
<jsp:include page="../include/navbar.jsp"/>
	<div class="contentwrapper">
		<div class="container content">
			<div class="list">
				<div class="imgwrapper">
					<img class="img-thumbnail" src="<c:url value='/resources/images/wow.jpg'/>" alt="logo"/>
				</div>
				<div class="textwrapper">
					<p class="list-title">${dto.title }</p>
					<p class="list-writer">${dto.writer }</p>
					<p class="list-info">${dto.info }</p>
				</div>
			</div>
		</div>
		
		<div class="container content">
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
							${tmp.title }
						</a>
					</td>
					<td>여기에 별점 입력${tmp.starvalue }</td>
					<c:choose>
						<c:when test="${tmp.isBuy }">
							<td>소장중</td>
							<td><input type="checkbox" name="selectedCode" value="${tmp.code }" disabled/></td>
						</c:when>
						<c:otherwise>
							<td><a class="btn buyOne" href="buyCodeOne.do?code=${tmp.code }&title=${tmp.title }">구매</a></td>
							<td><input type="checkbox" name="selectedCode" value="${tmp.code }"/></td>
						</c:otherwise>
					</c:choose>	
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
		</div>
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
	//비로그인시 aspect에선 팝업창으로 실행되지않아 강제로 컨트롤러 이동을 막고 로그인요청 
	$("#buyAll").click(function(){
		var check=$("#userInfo").text();
		if(check==""){
			loginOpen();
			e.preventDefault();
		}else{
			//로그인되어있다면 컨펌창에서 띄울 정보 변수에 담기
			var allSize=$("input[name=selectedCode]").not("[disabled]").length;
			var buySize=$("[disabled]").length;
			var allValue=allSize*100;
			//컨펌 실행하며 알림 띄우기
			var isBuy=confirm("전체 화 "+allSize+ "편을 구매하시겠습니까?\n"+"총 ${list.size()} 편 중 "+buySize+" 편을 구매했습니다.\n"+allValue+"캐시가 차감됩니다.");
			if(isBuy){
				//컨트롤러로 이동
				location.href="buyAll.do?title=${list[0].title}&price="+allValue;
			}
		}
		
	});
	//비로그인시 aspect에선 팝업창으로 실행되지않아 강제로 컨트롤러 이동을 막고 로그인요청 
	$("#buyEach").click(function(){
		var check=$("#userInfo").text();
			if(check==""){
				loginOpen();
				e.preventDefault();
		}else{
			//로그인되어있지만 체크가 없다면
			var eachSize=$("input[name=selectedCode]:checked").length;
			if(eachSize==0){
				//알림 띄우며 함수실행 종료
				alert("1개 이상 체크해주세요.");
				return false;
			}
			//로그인되어있고, 체크가 1개 이상이라면
			var allValue=eachSize*100;
			//체크박스 value를 담을 배열 생성
			var arrCode=[];
			//체크박스 체크가 된 것들을 each를 이용해 배열에 담기
			$("input[name=selectedCode]:checked").each(function(i){
				arrCode.push($(this).val());
				});
			//컨펌창으로 분기를 나누고
			var isBuy=confirm("선택한 화 "+eachSize+ "편을 구매하시겠습니까?\n"+allValue+"캐시가 차감됩니다.");
			//true라면
			if(isBuy){
				//ajax 실행
				$.ajax({
					url: "buyEach.do", //이동할 주소
					type: "post", //form 전송 방식
					async:false, // ajax 에서 리턴값을 받고싶다면 사용
					data:
						//데이터는 arrEachCode라는 이름으로 배열 전달
						{"arrEachCode": arrCode},
						//ajax 성공이라면 전달된값을 전달자로 받아 함수실행
					success:function(responseData){
						// responseData : {isSuccess:true}
						//전달값이 true라면
						if(responseData.isSuccess){
							//알림 띄우고 새로고침
							alert(eachSize+" 편 구매했습니다.");
							location.reload();
						}else{
							
						}
					}	
				});
				
			}
		}
		
	})
	//비로그인시 aspect에선 팝업창으로 실행되지않아 강제로 컨트롤러 이동을 막고 로그인요청 
	$(".buyOne").click(function(e){
		var check=$("#userInfo").text();
		if(check==""){
				loginOpen();
				e.preventDefault();
		}else{
			var target=$(this);
			var listNum=target.parents()[1].children[0].textContent;
			var isBuy=confirm(listNum+" 화를 구매하시겠습니까?\n100 캐시가 차감됩니다.");
			if(!isBuy){
				e.preventDefault();
			}else{
				
			}
		}
		
	})
	</script>
</body>
</html>