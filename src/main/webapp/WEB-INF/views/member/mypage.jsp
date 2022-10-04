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
	border: 1px solid #dfdfdf; border-radius: 4px; overflow: hidden; background-color: #fff;
}
table{
	width: 100%; border: none; border-spacing: 0; border-collapse: collapse;
}
th{
	color: #353535; padding: 15px 0; vertical-align: center;
}
thead{
	border-bottom: 1px solid #e1e1e1; vertical-align: middle;
}
.title{
	font-size:13px;
}

</style>
<title>마이페이지</title>
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
      		<div class="mypage accomodations">
      			<h5 class="text-secondary heading-5">내고시원</h5>
	        	<div class="content" id="content">
	        		<table border="1">
						<colgroup>
							<col style="width:auto;">
							<col style="width:150px;">
							<col style="width:160px;">
							<col style="width:70px;">
							<col style="width:100px;">
	        			</colgroup>
	        			<thead>
	        				<tr>
	        					<th scope="col" class="ac_num">고시원번호</th>
	        					<th scope="col" class="thumb">이미지</th>
	        					<th scope="col" class="name">이름</th>
	        					<th scope="col" class="management">신청여부</th>
	        					<th scope="col" class="statement">관리</th>
	        				</tr>
	        			</thead>
	        			<tbody>
	        				<c:if test="${user.me_id == accommodations.ac_me_id}">
		        				<c:forEach items="${list}" var="accommodations">
									<tr>
										<td>${accommodations.ac_num}</td>
										<td>${accommodations.ac_thumb}</td>
										<td>${accommodations.ac_name}</td>
										<td>${accommodations.ac_permit}</td>
										<td>
											<button>버튼</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
	        			</tbody>
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

