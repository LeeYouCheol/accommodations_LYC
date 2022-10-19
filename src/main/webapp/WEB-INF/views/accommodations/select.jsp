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

<title></title>
<style>
#slide{
	style="width:1392px; height:400px;"
}
#title{
	color: #fff; font-weight: bold;
}
.container{
	margin-left: 0; margin-right: 0;
}
#menu-box{
	box-shadow: 0 1px 3px 0 rgb(0 0 0 / 12%); color: #202020; background-color:#fff;
}
#inner-menu{
	width: 1130px; padding: 0 30px; margin: 0 auto;
}
#group-menu{
	overflow: hidden; padding: 11px 270px 11px 0;
}
#nav{
	list-style: none; font-size:15px; line-height:30px; font-weight:700;
	colcor: #000; letter-spacing: -.3px;
}
#nav::after{
	display: block; content: ''; clear: both;
}
.nav-item{
	float:left;
}
.nav-item+.nav-item{
	margin-left: 10px;
}
#name{
	display: block; text-decoration: none; color:#000;
}
.mySlides {display:none;}
.head{
	color: black; font-weight:bold;
}
.head{
	border-bottom: 1px solid gray;
}
.review-content{
	border: 1px solid #dfdfdf; border-raius: 4px; overflow: hidden; color: #353535;
}
#review{
	border : 0; border-spacing: 0; border-collapse: collapse;
}
#box-head{
	border-bottom: 1px solid #e1e1e1; background: #f8f8f8;
}
.head-item{
	padding: 15px 0; vertical-align : middle; text-align: center;
}
.thumb{
	padding: 10px;
}
.body-item{
	vertical-align : middle; text-align: center; border-bottom: 1px solid #e1e1e1;
}
.content{
	text-align: left; cursor: pointer;
}

.total-content{
	position: absolute; top: 50%; left: 50%; width: 920px; height: 540px;
  margin: -270px 0 0 -460px; background-color: #fff;
}
.total-close{
	position: absolute; right: 0; bottom: 100%; left: 0; padding-bottom: 25px;
}
.modal-close{
	border: none; background-color: transparent; cursor: pointer; position: fixed;
  top: 0; right: 0; width: 90px; height: 90px; opacity: .55;
}
.modal-close:before{
	background-image: url(https://static-resource-smartstore.pstatic.net/smartstore/p/static/20221018113958/img/sprite/svg/spIcon_svg.svg);
  background-size: 726px 688px; background-position: -147px -546px; width: 30px;
  height: 30px; display: inline-block; content: "";
}
.photo-box{
	position: relative; overflow: hidden; float: left; box-sizing: border-box;
  width: 540px; height: 100%; border-right: 1px solid rgba(0,0,0,.07);
  background-color: #f1f3f5;
}
.review{
	position: relative; float: left; box-sizing: border-box; width: 380px;
  height: 100%; padding-left: 25px;
}
.review-head{
	position: absolute; top: 0; right: 25px; left: 25px; box-sizing: border-box;
  height: 71px; padding: 20px 0 15px; border-bottom: 1px solid #f3f3f3;
}
.review-info{
	position: relative; z-index: 1; height: 36px;
}
.review-body{
	box-sizing: border-box; height: 100%; padding-top: 71px; padding-bottom: 123px;
}
.review-content{
	overflow-y: auto; box-sizing: border-box; height: 100%; padding: 15px 25px 17px 0;
	border: none;
}
.cotract-num{
	display: block; margin-bottom: 10px; word-wrap: break-word; font-size: 12px;
	line-height: 16px; color: #999;
}
.review-detail{
	font-size: 13px; line-height: 22px; color: #5f5f5f; white-space: pre-wrap;
  word-break: break-word; overflow-wrap: break-word;
}
.carousel, .carousel-inner, .carousel-item{
	height: 100%;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
<div class="lines-wrap">
	<div class="lines-inner">
		<div class="lines"></div>
  </div>
</div>
<div class="site-mobile-menu site-navbar-target">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close">
			<span class="icofont-close js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>
<!-- 사진 슬라이드 -->
<div class="untree_co_slider-wrap" data-aos="fade-up">
	<div class="untree_co_slider">
		<c:forEach items="${fileList}" var="file">
			<c:if test="${file.fi_ori_name.indexOf('안내도') < 0}">
			<div class="item">
				<img src="<c:url value="/file${file.fi_name }"></c:url>" alt="Image" class="img-fluid" id="slide">
	
				<div class="property-contents">
					<h2 id="title">${file.fi_ori_name}</h2>
				</div>
			</div>
			</c:if>
		</c:forEach>
	</div>
</div>

<!-- 중앙 메뉴 -->
<div>
	<div id="menu-box">
		<div id="inner-menu">
			<div id="group-menu" >
				<ul id="nav nav-pills" class="nav">
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" style="display:block;" href="#main/${accommodations.ac_num}">${accommodations.ac_name}</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" id="name" style="display:block;" href="#room">객실</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" id="name" style="display:block;" href="#notice">공지사항</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" id="name" style="display:block;" href="#qna">Q&A</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" id="name" style="display:block;" href="#review">리뷰</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" id="name" style="display:block;" href="#root">오시는길</a>
					</li>
				</ul>
			</div>
		</div>	
	</div>
</div>
<!-- 중앙 메뉴에 따른 페이지 -->
<div class="container">
	<div class="row align-items-center">
		<div class="tab-content">
			<!-- 고시원 메인 소개글 -->
			<div class="tab-pane container active" id="main">
				<span>${accommodations.ac_content}</span>
			</div>
			<!-- 각 층에 따른 층별 안내도 -->
			<div class="tab-pane container fade" id="room">
				<div class="container" style="margin-top: 10px;">
					<ul class="nav nav-tabs" role="tablist">
						<c:forEach items="${mapList}" var="floor">
							<li class="nav-item">
						    	<a class="nav-link" data-toggle="tab" href="#floor${floor.fm_fi_num}">${floor.fm_floor}층</a>
						    </li>
		  				</c:forEach>
					</ul>
					<!-- 층 선택에따른 층별 안내도 출력 -->
					<div class="tab-content">
				  		<c:forEach items="${mapList}" var="floor">
						    <div id="floor${floor.fm_fi_num}" class="container tab-pane">
								<img style="width:900px;" src="<c:url value="/file${floor.fi_name}"></c:url>">
						    	<!-- 층별안내도에 맞는 층별 호수 출력 -->
					    		<div class="container ">
									<!-- Nav pills -->
									<ul class="nav nav-pills" role="tablist">
										<c:forEach items="${roomList}" var="room">
											<c:if test="${room.ro_floor == floor.fm_floor}">
												<li class="nav-item">
											    	<a class="nav-link" data-toggle="tab" href="#room${room.ro_num}">${room.ro_num}호</a>
											    </li>
											</c:if>
									    </c:forEach>
									</ul>
									<!-- 호수를 클릭하면 해당 객실 사진 출력 -->
									<div class="tab-content">
										<c:forEach items="${roomList}" var="room">
											<c:if test="${room.ro_floor == floor.fm_floor}">
											<div id="room${room.ro_num}" class="container tab-pane"><br>
										    	<h3>${room.ro_num}호</h3>
										    	<div id="demo${room.ro_num}" class="carousel slide" data-ride="carousel">
													<!-- Indicators -->
												  	<ul class="carousel-indicators">
												  		<c:set var="index" value="0"></c:set>
													  	<c:forEach items="${roomFileList}" var="roomFile">
															<c:if test="${roomFile.fi_same_num == room.ro_code }">
														    	<li data-target="#demo${room.ro_num}" data-slide-to="${index}" <c:if test="${index == 0 }">class="active"</c:if>></li>
														    	<c:set var="index" value="${index+1}"></c:set>
														    </c:if>
													  	</c:forEach>
												  	</ul>
												  	<!-- The slideshow -->
												  	<div class="carousel-inner">
												  		<c:set var="index" value="0"></c:set>
												  		<c:forEach items="${roomFileList}" var="roomFile">
													  		<c:if test="${roomFile.fi_same_num == room.ro_code }">
														    	<div class="carousel-item <c:if test="${index == 0 }">active</c:if>">
														      		<img style="width: 1000px; height: 500px;" src="<c:url value="/file${roomFile.fi_name }"></c:url>">
														    	</div>
													    		<c:set var="index" value="${index+1}"></c:set>
													    	</c:if>
												    	</c:forEach>
												  	</div>
												  	<!-- Left and right controls -->
												  	<a class="carousel-control-prev" href="#demo${room.ro_num}" data-slide="prev">
												    	<span class="carousel-control-prev-icon"></span>
												  	</a>
												  	<a class="carousel-control-next" href="#demo${room.ro_num}" data-slide="next">
												    	<span class="carousel-control-next-icon"></span>
												  	</a>
												</div>
												<div>
													<span>${room.ro_content}</span>
												</div>
												<c:if test="${room.ro_state == 'A'}">
													<a class="btn btn-outline-primary mt-3" href="<c:url value="/accommodations/contract/${room.ro_code}?ac_num=${room.ro_ac_num}"></c:url>">계약</a>
										    	</c:if>
										    <c:if test="${room.ro_state == 'R'}">
										    	<button class="btn btn-secondary disabled mt-3" disabled>계약중</button>
										    	<div>
										    		<h4>${contract.co_exite_date_str}</h4>
										    	</div>
										    </c:if>
										   </div>
										   </c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="tab-pane container fade" id="notice">
				<div class="container">
					<div class="row justify-content-center text-center mb-5">
						<div class="col-lg-6 mt-3">
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
									<c:forEach items="${noticeList}" var="notice">
										<c:if test="${notice.no_where == 'acc'}">
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
							<c:if test="${user.me_authority == '2'}">
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
			<div class="tab-pane container fade" id="qna">
				<div class="container">
					<div class="row justify-content-center text-center mb-5">
						<div class="col-lg-6 mt-3">
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
			<div class="tab-pane container fade" id="review">
				<div class="container">
					<div class="row justify-content-center text-center mb-5">
						<div class="col-lg-6 mt-3">
							<h2 class="text-secondary heading-2">후기</h2>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-lg-10 bg-white p-5">
							<div class="review-content">
								<table id="review">
									<colgroup>
											<col style="width:150px;">
											<col style="width:300px;">
											<col style="width:100px;">
											<col style="width:150px;">
										</colgroup>
									<thead id="box-head">
										<tr>
											<th class="head-item" scope="col">사진</th>
											<th class="head-item" scope="col">내용</th>
											<th class="head-item" scope="col">작성자</th>
											<th class="head-item" scope="col">작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${reviewList}" var="review" varStatus="vs">
											<tr>
												<td class="thumb">
													<img src="<c:url value="/file${review.re_thumb}"></c:url>" width="150" height="150">
												</td>
												<td class="body-item content" data-toggle="modal" data-target="#myModal${vs.count}">${review.re_content}</td>
												<td class="body-item">${review.re_me_id}</td>
												<td class="body-item">${review.re_reg_date_str}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<ul class="pagination justify-content-center">
							  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
							  		<a class="page-link" href="<c:url value="/review/list?page=1&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">처음</a>
							  	</li>
							  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
							  		<a class="page-link" href="<c:url value="/review/list?page=${pm.startPage-1}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">이전</a>
							  	</li>
							  	
							  	<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
							    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
							    		<a class="page-link" href="<c:url value="/review/list?page=${i}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">${i}</a>
							    	</li>
							    </c:forEach>
							
							    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
							    	<a class="page-link " href="<c:url value="/review/list?page=${pm.endPage+1}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">다음</a>
							    </li>
							    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
							    	<a class="page-link" href="<c:url value="/review/list?page=${pm.finalPage}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">마지막</a>
							    </li>
								</ul>
								<c:forEach items="${reviewList}" var="review" varStatus="vs">
								<div class="modal" id="myModal${vs.count}">
								  <div class="modal-dialog modal-dialog-centered modal-xl">
								    <div class="modal-content">
								    	<div class="total-content">
								    		<div class="total-close">
								    			<button type="button" class="modal-close" data-dismiss="modal"></button>
								    		</div>
								    		<div class="photo-box">
													<div id="demo${review.re_num}" class="carousel slide" data-ride="carousel">
													  <!-- Indicators -->
													  <ul class="carousel-indicators">
													    <c:set var="index" value="0"></c:set>
													    <c:forEach items="${reviewFileList}" var="reviewFile">
																<c:if test="${reviewFile.fi_same_num == review.re_num}">
																	<li data-target="#demo${review.re_num}" data-slide-to="${index}" <c:if test="${index == 0 }">class="active"</c:if>></li>
															    		<c:set var="index" value="${index+1}"></c:set>
																 </c:if>
															</c:forEach>
													  </ul>
													
													  <!-- The slideshow -->
													  <div class="carousel-inner">
												    	<c:set var="index" value="0"></c:set>
												      <c:forEach items="${reviewFileList}" var="reviewFile">
																<c:if test="${reviewFile.fi_same_num == review.re_num}">
																	 <div class="carousel-item <c:if test="${index == 0 }">active</c:if>">
																   		<img class="review-image" style="width: 100%; height: 100%;" src="<c:url value="/file${reviewFile.fi_name }"></c:url>">
																	</div>
																	<c:set var="index" value="${index+1}"></c:set>
																</c:if>
															</c:forEach>
													  </div>
													  <!-- Left and right controls -->
													  <a class="carousel-control-prev" href="#demo${review.re_num}" data-slide="prev">
													    <span class="carousel-control-prev-icon"></span>
													  </a>
													  <a class="carousel-control-next" href="#demo${review.re_num}" data-slide="next">
													    <span class="carousel-control-next-icon"></span>
													  </a>
													</div>
												</div>
												<div class="review">
													<div class="review-head">
															<div class="review-info">
																<strong>${review.re_me_id}</strong>
																<span>${review.re_reg_date_str}</span>
															</div>
													</div>
													<div class="review-body">
														<div class="review-content">
															<em class="cotract-num">${review.re_co_num}</em>
															<p class="review-detail">${review.re_content}</p>
														</div>
													</div>
												</div>
											</div>
							    	</div>
							  	</div>
							  </div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane container fade" id="root">
				<div class="container">
					<div class="row justify-content-center text-center mb-5">
						<div class="col-lg-12 mt-3">
							<h2 class="text-secondary heading-2">오시는길</h2>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-lg-10 bg-white p-5">
							

						</div>
					</div>
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