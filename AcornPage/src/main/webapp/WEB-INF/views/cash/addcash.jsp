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
<style>
	input{
		float:left;
	}
</style>
<body style="padding:0 0 20px 0; background-color:#e4e4e4;">
	<div class="popwrapper">
		<div class="poptitle" style="background-color:#474747; height:80px; padding:20px;">
			<div>
				<p style="font-size:30px; color:#fff; float:left;">충전하기</p>
			</div>
			<div>
				<p style="float:right; padding-top:5px;"><span class="glyphicon glyphicon-remove" style="color:#fff; font-size:30px; cursor:pointer" onclick="javascript:self.close();"></span></p>
			</div>
		</div>
		<div style="height:60px; background-color:#fff; padding:20px;">
			<div>
				<p style="float:left;">보유캐시</p>
			</div>
			<div>
				<p style="float:right; font-size: 16px;"><strong class="nowCash">0</strong> 캐시</p>
			</div>
		</div>
		<div style="padding:15px 15px;">
			<div style="padding:10px; background-color:#fff;">
			<form action="cashcharge.do" method="get" style="background-color:#fff;">
				<table class="table table-bordered" style="margin:0px; border:0px; cursor: pointer;">
				<colgroup>
					<col class="col-xs-3"/>
					<col class="col-xs-9"/>
				</colgroup>
					<tbody>
						<tr>
							<td style="border:0px; padding:10px 20px;">
							<input type="radio" name="cash" id="cash" value="1000" checked="checked"/>
							<span style="cursor: default; padding-left: 10px;">1,000 캐시</span>
							</td>
						</tr>
						<tr>
							<td style="border:0px; padding:10px 20px;">
							<input type="radio" name="cash" id="cash" value="3000"/>
							<span style="cursor: default; padding-left: 10px;">3,000 캐시</span>
							</td>
						</tr>
						<tr>
							<td style="border:0px; padding:10px 20px;">
							<input type="radio" name="cash" id="cash" value="5000"/>
							<span style="cursor: default; padding-left: 10px;">5,000 캐시</span>
							</td>
						</tr>
						<tr>
							<td style="border:0px; padding:10px 20px;">
							<input type="radio" name="cash" id="cash" value="10000"/>
							<span style="cursor: default; padding-left: 10px;">10,000 캐시</span>
							</td>
						</tr>
						<tr>
							<td style="border:0px; padding:10px 20px;">
							<input type="radio" name="cash" id="cash" value="30000"/>
							<span style="cursor: default; padding-left: 10px;">30,000 캐시</span>
							</td>
						</tr>
						<tr>
							<td style="border:0px; padding:10px 20px;">
							<input type="radio" name="cash" id="cash" value="50000"/>
							<span style="cursor: default; padding-left: 10px;">50,000 캐시</span>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="height:60px; background-color:#fff; padding:20px; border-top:1px solid #eee; margin-top:5px;">
					<div>
						<p style="float:left;">충전후 보유 캐시</p>
					</div>
					<div>
						<p style="float:right; font-size: 16px;"><strong class="plusCash"></strong> 캐시</p>
					</div>
				</div>
			</form>
			</div>
			<div style="height:60px; background-color:#fff; padding:20px 28px; margin:15px 0;">
				<div>
					<p style="float:left;"><strong>결제 금액</strong></p>
				</div>
				<div>
					<p style="float:right; font-size: 16px; padding-right: 3px;"><strong class="addCash">1,000</strong> 원</p>
				</div>
			</div>
			<div class="checkbox" style="margin:10px; padding:10px 0;">
			    <label style="font-size:13px;">
			    	<input type="checkbox" class="agree">
			     	아래 이용안내 및 결제 진행에 동의합니다.
			    </label>
			</div>
			<button class="btn" type="submit" id="cashBtn" style="width:100%; padding:10px 12px; background-color: #ffd200;">충전하기</button>
			<div style="font-size:11px; margin:20px 0; color:#999999;">
				<p style="margin:0px;">1. 충전된 캐시의 유효기간은 충전 후 5년입니다.</p>
				<p style="margin:0px;">2. 사용되지 않은 캐시에 대해서는 7일 이내 청약철회가 가능합니다.</p>
				<p style="margin:0px;">3. 미사용된 이용권에 대해서는 환불이 가능하며, 환불 시 환불수수료(10% 또는 1,000원 중 큰 금액)를 제외한 나머지 금액이 환불됩니다.</p>
				<p style="margin:0px;">4. 광고성 이벤트 등 회사가 무료로 지급한 캐시는 환불되지 않습니다.</p>
				<p style="margin:0px;">5. 자세한 내용은 카카오페이지 유료서비스 이용약관에서 확인할 수 있습니다.</p>
			</div>
		</div>
	</div>
	
<script>
	//숫자를 3단위로 콤마처리하는 함수
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	//팝업창이 켜졌을때 가지고있는 캐쉬와 충전후 보유캐쉬를 콤마처리하는 함수
	$(document).ready(function(){
		//보유캐시를 숫자형으로 변형하여
		var wallet=parseInt(${wallet});
		//콤마처리함수를 이용해 값 변경
		$(".nowCash").text(numberWithCommas(wallet));
		//선택되어있는 체크박스의 값을 숫자형으로 변형하여
		var val=parseInt($("input:checked[name=cash]").val());
		//보유캐시와 체크된값을 더하여 값 변경
	    $(".plusCash").text(numberWithCommas(val+wallet));
	});
	
	//캐쉬 충전버튼을 눌렀을때 controller로 이동하는 함수
	$("#cashBtn").click(function(){
		//이용안내 체크값
		var agreeVal = $(".agree").prop("checked");
		//체크박스의 값을 담을 변수
		var radioVal = $('input[name="cash"]:checked').val();
		//컨펌창으로 분기
		var isAddCash=confirm(radioVal+"캐쉬를 충전하시겠습니까?");
		//true값이면
		if(isAddCash){
			//이용안내가 false이면 함수종료
			if(!agreeVal){
				alert("이용 안내 및 결제 진행에 동의해 주세요");
				return;
			}
			//컨트롤러 이동
				location.href="cashcharge.do?cash="+radioVal;
			
		}else{
			
		}
		return false;
	});	
	//tr을 클릭했으면 해당 tr 내 radio를 checked 해주는 함수
	$(".table-bordered tr").click(function() {
	    var tr = $(this);
	    var td = tr.children();
	    var checkNum = td.eq(0).children().val();
	 	var wallet=parseInt(${wallet});
	    $("input:checked[name=cash]").each(function() {
    	   if (checkNum != $(this).val()) {
    	    $(this).attr("checked", false); // uncheck all checkboxes
    	   }
    	  });

	    td.eq(0).children().attr("checked", "true");
	    //checked된 value를 페이지에 표기해주는 함수
	    var val=parseInt($("input:checked[name=cash]").val());
	    $(".plusCash").text(numberWithCommas(val+wallet));
	    $(".addCash").text(numberWithCommas(val));
    });
</script>
</body>
</html>