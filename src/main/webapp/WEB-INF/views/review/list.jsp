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
.head{
	color: black; font-weight:bold;
}
.head{
	border-bottom: 1px solid gray;
}
</style>
<title>공지사항</title>
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
				<h2 class="text-secondary heading-2">공지사항</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-10 bg-white p-5">
				<table class="notice">
					<thead class="head">
						<tr>
							<th width="80">번호</th>
							<th width="500">제목</th>
							<th width="100">작성자</th>
							<th width="100">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="notice">
							<c:if test="${notice.no_where == 'moa'}">
								<tr>
									<td>${notice.no_num}</td>
									<td>
										<a href="<c:url value="/notice/select/${notice.no_num}"></c:url>">${notice.no_title}</a>
									</td>
									<td>${notice.no_me_id}</td>
									<td>${notice.no_date_str}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${user.me_authority == '10'}">
					<a href="<c:url value="/notice/insert"></c:url>" class="btn btn-primary float-right mt-4 mb-4">공지사항등록</a>
				</c:if>
				<ul class="pagination justify-content-center">
				  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
				  		<a class="page-link" href="<c:url value="/notice/list?page=1&search=${pm.cri.search}&no_where=${no_where}"></c:url>">처음</a>
				  	</li>
				  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
				  		<a class="page-link" href="<c:url value="/notice/list?page=${pm.startPage-1}&search=${pm.cri.search}&no_where=${no_where}"></c:url>">이전</a>
				  	</li>
				  	
				  	<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
				    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
				    		<a class="page-link" href="<c:url value="/notice/list?page=${i}&search=${pm.cri.search}&no_where=${no_where}"></c:url>">${i}</a>
				    	</li>
				    </c:forEach>
				
				    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
				    	<a class="page-link " href="<c:url value="/notice/list?page=${pm.endPage+1}&search=${pm.cri.search}&no_where=${no_where}"></c:url>">다음</a>
				    </li>
				    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
				    	<a class="page-link" href="<c:url value="/notice/list?page=${pm.finalPage}&search=${pm.cri.search}&no_where=${no_where}"></c:url>">마지막</a>
				    </li>
				</ul>
				<form>
					<div class="input-group mb-3">
						<input class="form-control col-14" type="text" placeholder="제목으로 검색하세요." name="search" value="${pm.cri.search}">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">검색</button>
						</div>
						<input type="hidden" name="no_where" value="${no_where}">
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

