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
	border-bottom: 1px solid #e1e1e1; font-weight: bold;
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
			<div class="mypage">
	 			<h5 class="text-secondary heading-5">내 계약</h5>
	    	<div class="content" id="content">
	    		<table border="1">
						<colgroup>
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
							<col style="width:auto;">
						</colgroup>
						<thead id="head">
							<tr>
								<th id="head-item" scope="col" class="num">계약번호</th>
								<th id="head-item" scope="col" class="name">고시원이름</th>
								<th id="head-item" scope="col" class="room">객실번호</th>
								<th id="head-item" scope="col" class="singdate">계약일</th>
								<th id="head-item" scope="col" class="month">계약기간</th>
								<th id="head-item" scope="col" class="entr">입실일</th>
								<th id="head-item" scope="col" class="exite">퇴실일</th>
								<th id="head-item" scope="col" class="price">결제금액</th>
								<th id="head-item" scope="col" class="state">관리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="body-item">${contract.co_num}</td>
								<td id="body-item">${contract.co_ac_name}</td>
								<td id="body-item">${contract.co_ro_num}호</td>
								<td id="body-item">${contract.co_sign_date_str}</td>
								<td id="body-item">${contract.co_month}개월</td>
								<td id="body-item">${contract.co_enter_date_str}</td>
								<td id="body-item">${contract.co_exite_date_str}</td>
								<td id="body-item">${contract.co_price_str}</td>
								<td id="body-item">
									<a class="btn btn-outline-primary" href="<c:url value="#"></c:url>">계약연장</a>
									<a class="btn btn-outline-danger" href="<c:url value="#"></c:url>">퇴실</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="mypage">
	 			<h5 class="text-secondary heading-5">고시원모아 QnA</h5>
	    	<div class="content" id="content">
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
							<c:forEach items="${qnaList}" var="question">
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
											<a href="<c:url value="/qna/question/select/${question.qu_num}"></c:url>">${question.qu_title}</a>
										</td>
										<td>${question.qu_me_id}</td>
										<td>${question.qu_date_str}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
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
			<div class="mypage">
	 			<h5 class="text-secondary heading-5">고시원 QnA</h5>
	    	<div class="content" id="content">
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
							<c:forEach items="${qnaList}" var="question">
								<c:if test="${question.qu_where == 'acc'}">
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
											<a href="<c:url value="/qna/question/select/${question.qu_num}"></c:url>">${question.qu_title}</a>
										</td>
										<td>${question.qu_me_id}</td>
										<td>${question.qu_date_str}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<a href="<c:url value="/qna/question/insert"></c:url>" class="btn btn-primary float-right mt-4 mb-4">QnA등록</a>
				<ul class="pagination justify-content-center mt-5">
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

