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


<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.js"></script>
<style>
#container{
	margin: 0; padding:0;
}
.sidetext{
	float:left; font-weight:bold; color:black; position: relative;
	top:10px; left: 10px;
}
#content{
	display: table; width: 100%; margin-bottom: 50px; padding: 20px 0;
	border: 1px solid #dfdfdf; border-radius: 4px; box-sizing: border-box;
	background-color: #fff; overflow: hidden;
}
.title{
	font-size:13px;
}
#box{
	position: relative; margin-bottom:50px; display:inline-block; padding:70px;
}
.phone{
	display: flex;
}
.rn-box{
	display: flex;
}
</style>
<title>회원가입</title>
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
	<div class="container" id="container">
		<div class="sidetext">
			<h6>마이페이지</h6>
		</div>
      	<div class="row justify-content-center" id="box">
      		<div class="mypage businessSignup">
      			<h5 class="text-secondary heading-5">사업자 가입 신청</h5>
	        	<div class="content col-lg-6" id="content">
	        		<table>
	        			<colgroup>
							<col style="width:160px;">
							<col style="width:100px;">
							<col style="width:auto;">
							<col style="width:70px;">
							<col style="width:150px;">
							<col style="width:160px;">
	        			</colgroup>
	        			<thead>
	        				<tr>
	        					<th>신청인</th>
	        					<th>아이디</th>
	        					<th>사업자등록번호</th>
	        					<th>수락</th>
	        				</tr>
	        			</thead>
	        			<tbody>
	        				<tr>
	        					<td>${member.me_id}</td>
	        				</tr>
	        			</tbody>
	        		</table>
	        	</div>
	        </div>
	        <div class="mypage acc">
	        	<h5 class="text-secondary heading-5">고시원 등록 신청</h5>
	        	<div class="content col-lg-6" id="content">
	        		<table>
	        			<colgroup>
							<col style="width:160px;">
							<col style="width:100px;">
							<col style="width:auto;">
							<col style="width:70px;">
							<col style="width:150px;">
							<col style="width:160px;">
	        			</colgroup>
	        			<thead>
	        				<tr>
	        					<th scope="col" class="thumb">이미지</th>
	        					<th scope="col" class="name">고시원이름</th>
	        					<th scope="col" class="representation">대표자</th>
	        					<th scope="col" class="id">아이디</th>
	        				</tr>
	        			</thead>
	        		</table>
	        	</div>
	        </div>
	        <div class="mypage acc">
	        	<h5 class="text-secondary heading-5">QnA</h5>
	        	<div class="content col-lg-6" id="content">
	        		<table>
	        			<colgroup>
							<col style="width:160px;">
							<col style="width:100px;">
							<col style="width:auto;">
							<col style="width:70px;">
							<col style="width:150px;">
							<col style="width:160px;">
	        			</colgroup>
	        			<thead>
	        				<tr>
	        					<th scope="col" class=""></th>
	        					<th scope="col" class=""></th>
	        					<th scope="col" class=""></th>
	        					<th scope="col" class=""></th>
	        				</tr>
	        			</thead>
	        		</table>
	        	</div>
	        </div>
	        <div class="mypage acc">
	        	<h5 class="text-secondary heading-5">공지사항</h5>
	        	<div class="content col-lg-6" id="content">
	        		<table>
	        			<colgroup>
							<col style="width:160px;">
							<col style="width:100px;">
							<col style="width:auto;">
							<col style="width:70px;">
							<col style="width:150px;">
							<col style="width:160px;">
	        			</colgroup>
	        			<thead>
	        				<tr>
	        					<th scope="col" class=""></th>
	        					<th scope="col" class=""></th>
	        					<th scope="col" class=""></th>
	        					<th scope="col" class=""></th>
	        				</tr>
	        			</thead>
	        		</table>
	        	</div>
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

