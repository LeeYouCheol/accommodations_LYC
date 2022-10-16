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
	width: 100%; border: none; border-spacing: 0; border-collapse: collapse; margin-bottom: 10px;
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
      			<form>
	      			<h5 class="text-secondary heading-5">사업자회원관리</h5>
	      				<div class="content" id="content">
	      					<table border="1">
									<colgroup>
										<col style="width:100px;">
										<col style="width:200px;">
										<col style="width:400px;">
		        			</colgroup>
		        			<thead id="head">
		        				<tr>
		        					<th id="head-item" scope="col" class="id">아이디</th>
		        					<th id="head-item" scope="col" class="bm">사업자등록번호</th>
		        					<th id="head-item" scope="col" class="statement">관리</th>
		        				</tr>
		        			</thead>
		        			<tbody>
										<tr>
											<c:forEach items="${bmList}" var="bm">
												<td id="body-item">${bm.bm_me_id}</td>
												<td id="body-item">${bm.bm_number}<td>
												<td id="body-item">
														<c:if test="${bm.bm_pos == 0}">
															<a class="btn btn-outline-primary" href="<c:url value="/member/update"></c:url>">가입승인</a>
														</c:if>
														<c:if test="${bm.bm_pos == 1}">
															<a class="btn btn-outline-primary" href="<c:url value="/member/update"></c:url>">가입취소</a>
														</c:if>
												</td>
											</c:forEach>
										</tr>
		        			</tbody>
		        		</table>
	      			</div>
	      			<h5 class="text-secondary heading-5">고시원관리</h5>
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
												<c:if test="${accommodations.ac_permit !='Y'}">
													<a class="btn btn-outline-light text-dark" href="<c:url value="/admin/select/${accommodations.ac_num}"></c:url>">상세내용</a>
												</c:if>
												<c:if test="${accommodations.ac_permit !='Y'}">
													<a class="btn btn-outline-primary" href="<c:url value=""></c:url>">등록수락</a>
												</c:if>
												<a class="btn btn-outline-dark" href="<c:url value=""></c:url>">등록보류</a>
												<c:if test="${accommodations.ac_permit !='S'}">
													<a class="btn btn-outline-danger" href="<c:url value=""></c:url>">등록취소</a>
												</c:if>
											</td>
										</tr>
										</c:forEach>				
		        			</tbody>
		        		</table>
		        	</div>
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
</body>
</html>

