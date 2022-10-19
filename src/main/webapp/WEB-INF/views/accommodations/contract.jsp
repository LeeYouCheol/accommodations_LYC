<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">

<meta name="description" content="" />
<meta name="keywords" content="" />

<!-- 결제 import -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.js"></script>
<title>QnA</title>
<style>
table{
	color: black;
}
td{
	padding: 13px 0px 13px 8px;
}
th{
	text-aligin: left;
}
</style>
</head>
<body>
<div class="site-mobile-menu site-navbar-target">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close">
			<span class="icofont-close js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>

<div class="untree_co-section bg-light">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-lg-6">
				<h2 class="text-secondary heading-2">계약서 작성</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-9 bg-white p-5">
				<form class="contact-form" data-aos="fade-up" action="<c:url value="/accommodations/contract/${room.ro_num}"></c:url>" data-aos-delay="200" method="post" id="contract">
					<table>
						<colgroup>
							<col style="width:10%">
							<col style="width:20%">
							<col style="width:10%">
							<col style="width:20%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td>
									<input class="form-control" type="text" name="co_me_id" id="co_me_id" value="${user.me_id}" readonly>
								</td>
								<th scope="row">이름</th>
								<td>
									<input class="form-control" type="text" name="co_me_name" id="co_me_name" value="${user.me_name}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">주민등록번호</th>
								<td>
									<input class="form-control" type="text" name="co_me_rn" id="co_me_rn" value="${user.me_rn}" readonly>
								</td>
								<th scope="row">전화번호</th>
								<td>
									<input class="form-control" type="text" name="co_me_phone" id="co_me_phone" value="${user.me_phone}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">고시원번호</th>
								<td>
									<input class="form-control" type="text" name="co_ac_num" id="co_ac_num" value="${accommodations.ac_num}" readonly>
								</td>
								<th scope="row">고시원</th>
								<td>
									<input class="form-control" type="text" name="co_ac_name" id="co_ac_name" value="${accommodations.ac_name}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">선택객실</th>
								<td>
									<input class="form-control" type="text" name="co_ro_num" id="co_ro_num" value="${room.ro_num}" readonly>
								</td>
								<th scope="row">개월수:</th>
								<td>
									<input class="form-control" type="text" name="co_month" id="co_month" placeholder="계약할 개월수(숫자)">
								</td>
							</tr>
							<tr>
								<th scope="row">객실가격</th>
								<td>
									<input class="form-control" type="text" name="ro_price" id="ro_price" value="${room.ro_price_str}"readonly>
								</td>
								<th scope="row">결제금액</th>
								<td>
									<input class="form-control" type="text" name="co_price" id="co_price" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">희망입실일:</th>
								<td>
									<input type="text" class="form-control" id="co_enter_date" name="co_enter_date">
								</td>
								<td>
									<input type=hidden class="form-control" id="inputValue" name="inputValue" value="">
								</td>
							</tr>
							<tr>
								<th scope="row">퇴실일:</th>
								<td>
									<input type="text" class="form-control" id="co_exite_date" name="co_exite_date" readonly>
								</td>
								<td class="co_ro_code">
									<input type="hidden" class="form-control" id="co_ro_code" name="co_ro_code" value="${room.ro_code}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">계약동의:</th>
								<td colspan="4">
									<div id="scrollbox" class="form-control" style="width:600px; height:150px;"></div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" class="form-check-input" id="agreement" name="agreement" value="agreement">동의합니다:
								</td>
							</tr>
						</tbody>
					</table>
					<button id="pay" class="btn btn-primary float-right mt-4" type="button">결제</button>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="overlayer"></div>
<div class="loader">
	<div class="spinner-border" role="status">
		<span class="sr-only">Loading...</span>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('#contract').validate({
		rule:{
			co_month:{
				required : true,
			},
			co_enter_date:{
				required : true,
			},
			agreement:{
				required : true,
			}
		},
		message : {
			co_month : {
				required : "개월을 입력하세요."
			},
			co_enter_date : {
				required : "희망일자를 입력하세요."
			},
			agreement : {
				required : "동의를 체크해주세요."
			}
		},
		submitHandler: function(form){
    		return true;
       	}
	})
})
//입실일 퇴실일
$(function(){
	$( "#co_enter_date" ).datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'yy-mm-dd',
		yearRange: "1900:2022",
		minDate: "0",
		maxDate: "2M",
		onSelect: function(dateText, instance) {
		    date = $.datepicker.parseDate(instance.settings.dateFormat, dateText, instance.settings);
		    
		    date.setMonth(date.getMonth() + parseInt($('#co_month').val()));
		    $("#co_exite_date").datepicker("setDate", date);
		    console.log(date)
		}
	});
	$( "#co_exite_date" ).datepicker({
		changeMonth: true,
		changeYear: true,
		dateFormat: 'yy-mm-dd'
	});
})
$(function(){
	let price = document.getElementById('ro_price').value;
	let number = price.replace(/,/g, "");
	let num = number.replace("원", "");
	console.log(num)
	
	$('#co_month').change(function(){
		let month = $(this).val();
		let co_price = num * month;
		$('input[name=inputValue]').val(co_price);
		$('#co_price').val(co_price.toLocaleString('ko-KR')+"원");
		console.log(co_price)
	})
})

$(document).ready(function(){
	$('#pay').click(function(){
		payment();
	})
})
//pay버튼 클릭하면 실행될 함수
function payment(data){
	IMP.init('imp85613303');
	IMP.request_pay({
		pg: "html5_inicis",
		pay_method: "card",
		merchant_uid: "${accommodations.ac_num}" +"_"+ "${room.ro_num}"+"_" + "${user.me_id}"+"_" + + new Date().getTime(),
		name: "${room.ro_num}",
		amount: $('input[name=inputValue]').val(),//금액이다
		buyer_email: "testiamport@naver.com",
		buyer_name: "${user.me_name}",
		buyer_tel : "${user.me_phone}"
	}, function (rsp){
		let co_month = $('#co_month').val();
		let co_me_id = $('#co_me_id').val();
		let co_me_rn = $('#co_me_rn').val();
		let co_me_name = $('#co_me_name').val();
		let co_me_phone = $('#co_me_phone').val();
		let co_price = $('input[name=inputValue]').val();
		let co_enter_date = $('#co_enter_date').val();
		let co_exite_date = $('#co_exite_date').val();
		if(rsp.success){
			let obj = {
					co_num : rsp.merchant_uid,
					co_ac_name : '${accommodations.ac_name}',
					co_ro_code: '${room.ro_code}',
					co_ro_num: '${room.ro_num}',
					co_me_id: co_me_id,
					co_me_rn: co_me_rn,
					co_me_name: co_me_name,
					co_me_phone: co_me_phone,
					co_month: co_month,
					co_price: co_price,
					co_enter_date: co_enter_date,
					co_exite_date: co_exite_date
			}
			console.log(obj);
			ajaxPost(false, obj, '/accommodations/contract/${room.ro_code}',function(data){
				if(data.res){
					alert("결제가 완료되었습니다.");
				 	location.href = "http://localhost:8080/spring/accommodations/complete?co_num="+rsp.merchant_uid
				}else{
					alert("결제가 실패했습니다.");
				}
			})
			console.log('test')
		}else{
			console.log(rsp)
			alert("결제가 실패했습니다.");
		}
	})
}
function ajaxPost(async, dataObj, url, success){
	$.ajax({
	  async:async,
	  type:'POST',
	  data:JSON.stringify(dataObj),
	  url:"<%=request.getContextPath()%>"+url,
	  dataType:"json",
	  contentType:"application/json; charset=UTF-8",
	  success : function(data){
		  success(data);
	  }
  });
}
</script>
</body>
</html>