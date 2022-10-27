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
.head{
	color: black; font-weight:bold;
}
.head{
	border-bottom: 1px solid gray;
}
</style>
<title>QnA</title>
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
				<h2 class="text-secondary heading-2">Q & A</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-10 bg-white p-5">
				<table class="notice">
					<thead class="head">
						<tr>
							<th width="80">번호</th>
							<th width="80">유형</th>
							<th width="500">제목</th>
							<th width="100">작성자</th>
							<th width="100">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="question">
							<c:if test="${question.qu_where == 'moa'}">
								<tr>
									<td>${question.qu_num}</td>
									<td>
										<c:if test="${question.qu_type == 'signup'}">
											회원가입
										</c:if>
										<c:if test="${question.qu_type == 'payment'}">
											결제
										</c:if>
										<c:if test="${question.qu_type == 'accomodation'}">
											고시원
										</c:if>
										<c:if test="${question.qu_type == 'business'}">
											사업자
										</c:if>
									</td>
									<td>
										<a href="<%=request.getContextPath()%>/qna/select?qu_num=${question.qu_num}">${question.qu_title}</a>
									</td>
									<td>${question.qu_me_id}</td>
									<td>${question.qu_date_str}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<a href="<c:url value="/qna/question/insert"></c:url>" class="btn btn-primary float-right mt-4 mb-4">QnA등록</a>
				<ul class="pagination justify-content-center">
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

