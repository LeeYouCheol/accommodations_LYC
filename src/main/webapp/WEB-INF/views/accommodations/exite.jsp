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
				<h2 class="text-secondary heading-2">퇴실</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-9 bg-white p-5">
				<table>
					<colgroup>
						<col style="width:10%">
						<col style="width:20%">
						<col style="width:10%">
						<col style="width:20%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">계약번호</th>
							<td colspan="4" class="co_num">
								<input class="form-control co_num" type="text" id="co_num" value="${contract.co_num}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">아이디</th>
							<td>
								<input class="form-control" type="text" value="${user.me_id}" readonly>
							</td>
							<th scope="row">이름</th>
							<td>
								<input class="form-control" type="text" value="${user.me_name}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">고시원</th>
							<td>
								<input class="form-control" type="text" value="${contract.co_ac_name}" readonly>
							</td>
							<th scope="row">선택객실</th>
							<td>
								<input class="form-control" type="text" value="${contract.co_ro_num}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">퇴실일:</th>
							<td>
								<input type="text" class="form-control" value="${contract.co_exite_date_str}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">퇴실동의:</th>
							<td colspan="4">
								<div id="scrollbox" class="form-control" style="width:600px; height:150px;"></div>
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" class="form-check-input" id="agreement" name="agreement" value="agreement">동의합니다:
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<button id="exite" class="btn btn-outline-primary float-right mt-4" type="button">퇴실하기</button>
							</td>
						</tr>
					</tbody>
				</table>
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
	$('#exite').click(function(){
		let co_num = document.getElementById('co_num').value;
		let co_exite_date = new Date();
		let co_state = 'E';
		let obj = {
			co_num : co_num,
			co_exite_date : co_exite_date,
			co_state : co_state
		}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/accommodations/room/exite',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('퇴실을 완료했습니다.');
					document.location.href = "http://localhost:8080/spring/main/mypage";
				}else{
					alert('잘못된 접근입니다.');
				}
			}
		})
	})
})
</script>
</body>
</html>