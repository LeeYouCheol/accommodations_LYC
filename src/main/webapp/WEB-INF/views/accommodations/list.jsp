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
#list{
	border: 0;
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
<title>고시원</title>
</head>
<body>
  <div class="lines-wrap">
    <div class="lines-inner">
      <div class="lines"></div>
    </div>
  </div>
  <!-- END lines -->

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
				<h2 class="text-secondary heading-2">고시원 목록</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="mypage accomodations">
	        	<div class="content" id="content">
	        		<table border="1" id="list">
						<colgroup>
							<col style="width:150px;">
							<col style="width:150px;">
							<col style="width:250px;">
							<col style="width:70px;">
	        			</colgroup>
	        			<thead>
	        				<tr>
	        					<th scope="col" class="thumb">이미지</th>
	        					<th scope="col" class="name">이름</th>
	        					<th scope="col" class="addr">주소</th>
	        					<th scope="col" class="represent">대표</th>
	        				</tr>
	        			</thead>
	        			<tbody>
	        				<c:forEach items="${list}" var="accommodations">
								<tr>
									<td>
										<img src="<c:url value="/file${accommodations.ac_thumb}"></c:url>" width="150" height="150">
									</td>
									<td>
										<a href="<c:url value="/accommodations/select/${accommodations.ac_num}"></c:url>">${accommodations.ac_name}</a>
									</td>
									<td>${accommodations.ac_addr}</td>
									<td>${accommodations.ac_representation}</td>
								</tr>
							</c:forEach>
	        			</tbody>
	        		</table>
	        	</div>
	        	<ul class="pagination justify-content-center mt-3">
				  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
				  		<a class="page-link" href="<c:url value="/qna/question/list?page=1&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">처음</a>
				  	</li>
				  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
				  		<a class="page-link" href="<c:url value="/qna/question/list?page=${pm.startPage-1}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">이전</a>
				  	</li>
				  	
				  	<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
				    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
				    		<a class="page-link" href="<c:url value="/qna/question/list?page=${i}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">${i}</a>
				    	</li>
				    </c:forEach>
				
				    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
				    	<a class="page-link " href="<c:url value="/qna/question/list?page=${pm.endPage+1}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">다음</a>
				    </li>
				    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
				    	<a class="page-link" href="<c:url value="/qna/question/list?page=${pm.finalPage}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">마지막</a>
				    </li>
				</ul>
				<form>
					<div class="input-group mb-3">
						<input class="form-control col-14" type="text" placeholder="제목으로 검색하세요." name="search" value="${pm.cri.search}">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">검색</button>
						</div>
						<input type="hidden" name="qu_where" value="${qu_where}">
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