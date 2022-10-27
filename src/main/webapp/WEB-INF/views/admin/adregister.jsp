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
<title>광고신청</title>
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
				<h2 class="text-secondary heading-2">광고 신청/결제</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-9 bg-white p-5">
				<form class="contact-form" data-aos="fade-up" action="<c:url value="/admin/register"></c:url>" data-aos-delay="200" method="post" id="contract">
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
									<input class="form-control" type="text" name="ad_me_id" id="ad_me_id" value="${user.me_id}" readonly>
								</td>
								<th scope="row">사업자아이디</th>
								<td>
									<input class="form-control" type="text" name="ad_bm_me_id" id="ad_bm_me_id" value="${bm.bm_me_id}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>
									<input class="form-control" type="text" name="ad_me_name" id="ad_me_name" value="${user.me_name}" readonly>
								</td>
								<th scope="row">주민등록번호</th>
								<td>
									<input class="form-control" type="text" name="ad_me_rn" id="ad_me_rn" value="${user.me_rn}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td>
									<input class="form-control" type="text" name="ad_me_phone" id="ad_me_phone" value="${user.me_phone}" readonly>
								</td>
								<th scope="row">고시원번호</th>
								<td>
									<input class="form-control" type="text" name="ad_ac_num" id="ad_ac_num" value="${accommodations.ac_num}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">고시원</th>
								<td>
									<input class="form-control" type="text" name="ad_ac_name" id="ad_ac_name" value="${accommodations.ac_name}" readonly>
								</td>
								<th scope="row">대표자</th>
								<td>
									<input class="form-control" type="text" name="ad_ac_representation" id="ad_ac_representation" value="${accommodations.ac_representation}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">사업자번호</th>
								<td>
									<input class="form-control" type="text" name="ad_bm_number" id="ad_bm_number" value="${bm.bm_number}" readonly>
								</td>
								<th scope="row">기본광고료</th>
								<td>
									<input class="form-control" type="text" name="ad_price" id="ad_price" value="${500}원" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">개월수:</th>
								<td>
									<input class="form-control" type="text" name="ad_month" id="ad_month" placeholder="계약할 개월수(숫자)">
								</td>
								<th scope="row">결제금액</th>
								<td>
									<input class="form-control" type="text" name="ad_to_price" id="ad_to_price" readonly>
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
									<input type=hidden class="form-control" id="inputValue" name="inputValue" value="">
								</td>
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
			ad_month:{
				required : true,
			},
			agreement:{
				required : true,
			}
		},
		message : {
			ad_month : {
				required : "개월을 입력하세요."
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
$(function(){
	let price = document.getElementById('ad_price').value;
	let number = price.replace(/,/g, "");
	let num = number.replace("원", "");
	console.log(num)
	
	$('#ad_month').change(function(){
		let month = $(this).val();
		let ad_to_price = num * month;
		$('input[name=inputValue]').val(ad_to_price);
		$('#ad_to_price').val(ad_to_price.toLocaleString('ko-KR')+"원");
		console.log(ad_to_price)
	})
})

$(document).ready(function(){
	$('#pay').click(function(){
		payment();
	})
})
//pay버튼 클릭하면 실행될 함수
function payment(data){
	IMP.init('imp34802356');
	IMP.request_pay({
		pg: "html5_inicis",
		pay_method: "card",
		merchant_uid: "${accommodations.ac_num}" + "_" + "${user.me_id}" + "_" + + new Date().getTime(),
		name: "$advertisement",
		amount: $('input[name=inputValue]').val(),//금액이다
		buyer_email: "testiamport@naver.com",
		buyer_name: "${user.me_name}",
		buyer_tel : "${user.me_phone}"
	}, function (rsp){
		let ad_ac_num = $('#ad_ac_num').val();
		let ad_ac_name = $('#ad_ac_name').val();
		let ad_ac_representation = $('#ad_ac_representation').val();
		let ad_me_id = $('#ad_me_id').val();
		let ad_bm_me_id = $('#ad_bm_me_id').val();
		let ad_me_name = $('#ad_me_name').val();
		let ad_bm_number = $('#ad_bm_number').val();
		let ad_me_rn = $('#ad_me_rn').val();
		let ad_me_phone = $('#ad_me_phone').val();
		let ad_month = $('#ad_month').val();
		let ad_to_price = $('input[name=inputValue]').val();
		let ad_end_date = $('#co_exite_date').val();
		if(rsp.success){
			let obj = {
					ad_code : rsp.merchant_uid,
					ad_ac_num : ad_ac_num,
					ad_ac_name : ad_ac_name,
					ad_ac_representation : ad_ac_representation,
					ad_me_id: ad_me_id,
					ad_bm_me_id : ad_bm_me_id,
					ad_me_name: ad_me_name,
					ad_bm_number : ad_bm_number,
					ad_me_rn: ad_me_rn,
					ad_me_phone: ad_me_phone,
					ad_month: ad_month,
					ad_to_price : ad_to_price,
					ad_end_date: ad_end_date
			}
			console.log(obj);
			ajaxPost(false, obj, '/admin/adregister',function(data){
				if(data.res){
					alert("결제가 완료되었습니다.");
				 	location.href = "http://localhost:8080/spring/admin/complete?ad_code="+rsp.merchant_uid
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