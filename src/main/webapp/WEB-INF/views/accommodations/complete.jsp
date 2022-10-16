<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="" />

<!-- 결제 import -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.js"></script>
<title>결제완료</title>
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
				<h2 class="text-secondary heading-2">결재완료</h2>
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
								<th>결제번호</th>
								<td colspan="6">
									<input class="form-control" type="text" value="${contract.co_num}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">아이디</th>
								<td>
									<input class="form-control" type="text" value="${contract.co_me_id}" readonly>
								</td>
								<th scope="row">이름</th>
								<td>
									<input class="form-control" type="text" value="${contract.co_me_name}" readonly>
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
								<th scope="row">결제금액</th>
								<td>
									<input class="form-control" type="text" name="co_price" id="co_price" value="${contract.co_price_str}" readonly>
								</td>
								<th scope="row">개월수:</th>
								<td>
									<input class="form-control" type="text" value="${contract.co_month}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">희망입실일:</th>
								<td>
									<input type="text" class="form-control" id="co_enter_date" value="${contract.co_enter_date_str}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">퇴실일:</th>
								<td>
									<input type="text" class="form-control" id="co_exite_date" value="${contract.co_exite_date_str}" readonly>
								</td>
							</tr>
						</tbody>
					</table>
					<a href="<c:url value="/"></c:url>" class="btn btn-outline-primary">홈으로</a>
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
</body>
</html>