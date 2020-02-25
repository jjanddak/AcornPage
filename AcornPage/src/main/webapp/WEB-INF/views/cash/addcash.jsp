<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cash/addcash.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<form action="cashcharge.do" method="get">
		<table class="table table-bordered">
		<colgroup>
			<col class="col-xs-3"/>
			<col class="col-xs-9"/>
		</colgroup>
			<tbody>
				<tr>
					<th class="active">1000 캐쉬</th>
					<th>
					<input type="radio" name="cash" value="1000"/>
					1,000 원
					</th>
				</tr>
				<tr>
					<th class="active">3000 캐쉬</th>
					<th>
					<input type="radio" name="cash" value="3000"/>
					3,000 원
					</th>
				</tr>
				<tr>
					<th class="active">5000 캐쉬</th>
					<th>
					<input type="radio" name="cash" value="5000"/>
					5,000 원
					</th>
				</tr>
				<tr>
					<th class="active">10000 캐쉬</th>
					<th>
					<input type="radio" name="cash" value="10000"/>
					10,000 원
					</th>
				</tr>
			</tbody>
		</table>
		<button class="btn btn-primary" type="submit" id="cashBtn">캐쉬충전</button>
		<button class="btn btn-warning" type="reset">취소</button>
	</form>
<script>
	$("#cashBtn").click(function(){
		var radioVal = $('input[name="cash"]:checked').val();
		var isAddCash=confirm(radioVal+"캐쉬를 충전하시겠습니까?");
		if(isAddCash){
			location.href="cashcharge.do?cash="+radioVal;
		}else{
			
		}
		return false;
	});	
	
</script>
</body>
</html>