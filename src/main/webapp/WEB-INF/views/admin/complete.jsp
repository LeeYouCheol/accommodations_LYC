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
<title>광고신청 완료</title>
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
				<h2 class="text-secondary heading-2">광고 신청/결제 완료</h2>
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
							<th scope="row">아이디</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_me_id}" readonly>
							</td>
							<th scope="row">사업자아이디</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_bm_me_id}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_me_name}" readonly>
							</td>
							<th scope="row">주민등록번호</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_me_rn}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_me_phone}" readonly>
							</td>
							<th scope="row">고시원번호</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_ac_num}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">고시원</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_ac_name}" readonly>
							</td>
							<th scope="row">대표자</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_ac_representation}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">사업자번호</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_bm_number}" readonly>
							</td>
							<th scope="row">기본광고료</th>
							<td>
								<input class="form-control" type="text" value="${500}원" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">개월수:</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_month}" readonly>
							</td>
							<th scope="row">결제금액</th>
							<td>
								<input class="form-control" type="text" value="${advertise.ad_to_price}" readonly>
							</td>
						</tr>
					</tbody>
				</table>
				<h4 class="text-secondary heading-4">관리자가 승인후 광고가 시작되며 승인시점부터 결제한 기간 만큼 관고가 지속됩니다.</h4>
				<a class="btn btn-outline-primary float-right mt-4" href="<c:url value="/main/mypage"></c:url>">MyPage</a>
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