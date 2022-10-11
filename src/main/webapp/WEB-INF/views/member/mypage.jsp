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
#head-item{
	color: #353535; padding: 15px 0; text-align: center; font-size: 18px;
}
#head{
	border-bottom: 1px solid #e1e1e1;
}
#body-item{
	 text-align: center; color: black;
}
.btn{
	margin-left:3px; margin-righ:3px;
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
							<col style="width:auto;">
							<col style="width:auto;">
	        			</colgroup>
	        			<thead id="head">
	        				<tr>
	        					<th id="head-item" scope="col" class="num">고시원번호</th>
	        					<th id="head-item" scope="col" class="thumb">이미지</th>
	        					<th id="head-item" scope="col" class="name">이름</th>
	        					<th id="head-item" scope="col" class="management">신청여부</th>
	        					<th id="head-item" scope="col" class="statement">관리</th>
	        				</tr>
	        			</thead>
	        			<tbody>
	        				<c:forEach items="${list}" var="accommodations">
								<tr>
									<td id="body-item">${accommodations.ac_num}</td>
									<td id="body-item">
										<img src="<c:url value="/file${accommodations.ac_thumb}"></c:url>" width="150" height="150">
									</td>
									<td id="body-item">${accommodations.ac_name}</td>
									<td id="body-item">
										<c:if test="${accommodations.ac_permit == 'S'}">
											대기
										</c:if>
										<c:if test="${accommodations.ac_permit == 'Y'}">
											등록
										</c:if>
										<c:if test="${accommodations.ac_permit == 'N'}">
											취소
										</c:if>
									</td>
									<td>
										<c:if test="${accommodations.ac_permit == 'S'}">
											<span style="color: black;">등록이 완료되면 이용가능합니다.</span>
										</c:if>
										<c:if test="${accommodations.ac_permit == 'Y'}">
											<a class="btn btn-outline-light text-dark" href="<c:url value="/accommodations/select/${accommodations.ac_num}"></c:url>">고시원관리</a>
											<a class="btn btn-outline-primary" href="<c:url value="/room/insert?ac_num=${accommodations.ac_num}"></c:url>">객실등록</a>
											<a class="btn btn-outline-success mr-7" href="<c:url value="/room/update"></c:url>">객실수정</a>
											<a class="btn btn-outline-secondary" href="<c:url value="/room/delete"></c:url>">객실삭제</a>
										</c:if>
										<c:if test="${accommodations.ac_permit == 'N'}">
											등록이 취소되어 이용할 수 없습니다. 문의바랍니다.
										</c:if>
									</td>
								</tr>
							</c:forEach>
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

