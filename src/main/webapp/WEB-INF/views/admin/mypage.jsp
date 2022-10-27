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

<div class="untree_co-section bg-light" id="bg-light">
	<div class="sidetext">
		<h6>마이페이지</h6>
	</div>
	<div class="container" id="container">
		<div class="row justify-content-center" id="box">
      <div class="mypage accomodations">
      	<h5 class="text-secondary heading-5">사업자회원관리</h5>
     		<div class="content" id="content">
     			<table border="1">
						<colgroup>
							<col style="width:80px;">
							<col style="width:250px;">
							<col style="width:auto;">
							<col style="width:auto;">
        		</colgroup>
        		<thead id="head">
        			<tr>
        				<th id="head-item" scope="col">아이디</th>
        				<th id="head-item" scope="col">사업자등록번호</th>
        				<th id="head-item" scope="col">등급</th>
        				<th id="head-item" scope="col">관리</th>
        			</tr>
        		</thead>
       			<tbody>
							<c:forEach items="${bmList}" var="bm">
							<tr>
								<td class="body-item bm_me_id">${bm.bm_me_id}</td>
								<td class="body-item">${bm.bm_number}</td>
								<td class="body-item">
									<c:if test="${bm.bm_pos == 'N'}">
										일반
									</c:if>
									<c:if test="${bm.bm_pos == 'B'}">
										사업자
									</c:if>
								</td>
								<td class="body-item">
									<c:if test="${bm.bm_pos == 'N'}">
										<button type="button" class="btn btn-outline-primary accept">가입승인</button>
									</c:if>
									<c:if test="${bm.bm_pos == 'B'}">
										<button type="button" class="btn btn-outline-danger cancel">가입취소</button>
									</c:if>
								</td>
							</tr>
							</c:forEach>
       			</tbody>
        	</table>
     		</div>
			</div>
			<div class="mypage accomodations">
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
        			<c:forEach items="${accList}" var="accommodations">
							<tr>
								<td class="body-item ac_num">${accommodations.ac_num}</td>
								<td class="body-item">
									<img src="<c:url value="/file${accommodations.ac_thumb}"></c:url>" width="150" height="150">
								</td>
								<td class="body-item">${accommodations.ac_name}</td>
								<td class="body-item">
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
								<td class="body-item">
									<c:if test="${accommodations.ac_permit !='Y'}">
										<a class="btn btn-outline-light text-dark" href="<c:url value="/accommodations/select/${accommodations.ac_num}"></c:url>">상세내용</a>
									</c:if>
									<c:if test="${accommodations.ac_permit !='Y'}">
										<button type="button" class="btn btn-outline-primary register">등록수락</button>
									</c:if>
									<button type="button" class="btn btn-outline-dark turn">등록보류</button>
									<c:if test="${accommodations.ac_permit !='S'}">
										<button type="button" class="btn btn-outline-danger refuse">등록취소</button>
									</c:if>
								</td>
							</tr>
							</c:forEach>				
       			</tbody>
       		</table>
       	</div>
       </div>
       <div class="mypage accomodations">
    		<h5 class="text-secondary heading-5">광고신청 목록</h5>
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
       					<th id="head-item" scope="col">계약코드</th>
       					<th id="head-item" scope="col">고시원이름</th>
       					<th id="head-item" scope="col">이름</th>
       					<th id="head-item" scope="col">개월수</th>
       					<th id="head-item" scope="col">결제금액</th>
       					<th id="head-item" scope="col">신청여부</th>
       					<th id="head-item" scope="col">관리</th>
       				</tr>
       			</thead>
       			<tbody>
        			<c:forEach items="${adList}" var="ad">
							<tr>
								<td class="body-item ad_code">${ad.ad_code}</td>
								<td class="body-item">${ad.ad_ac_name}</td>
								<td class="body-item">${ad.ad_ac_representation}</td>
								<td class="body-item ad_month">${ad.ad_month}</td>
								<td class="body-item">${ad.ad_to_price_str}</td>
								<td class="body-item">
									<c:if test="${ad.ad_state == 'S'}">
										대기중
									</c:if>
									<c:if test="${ad.ad_state == 'Y'}">
										광고중
									</c:if>
									<c:if test="${ad.ad_state == 'C'}">
										중단
									</c:if>
								</td>
								<td class="body-item">
									<c:if test="${ad.ad_state !='Y'}">
										<button type="button" class="btn btn-outline-primary adinsert">등록</button>
									</c:if>
									<c:if test="${ad.ad_state =='Y'}">
										<button type="button" class="btn btn-outline-danger adcancel">취소</button>
									</c:if>
								</td>
							</tr>
							</c:forEach>				
       			</tbody>
       		</table>
       	</div>
       </div>
       <div class="mypage accomodations">
    		<h5 class="text-secondary heading-5">Q & A</h5>
       	<div class="content" id="content">
					<table class="question">
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
					<ul class="pagination justify-content-center">
					  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
					  		<a class="page-link" href="<c:url value="/qna/list?page=1&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">처음</a>
					  	</li>
					  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
					  		<a class="page-link" href="<c:url value="/qna/list?page=${pm.startPage-1}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">이전</a>
					  	</li>
					  	
					  	<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
					    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
					    		<a class="page-link" href="<c:url value="/qna/list?page=${i}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">${i}</a>
					    	</li>
					    </c:forEach>
					
					    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
					    	<a class="page-link " href="<c:url value="/qna/list?page=${pm.endPage+1}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">다음</a>
					    </li>
					    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
					    	<a class="page-link" href="<c:url value="/qna/list?page=${pm.finalPage}&search=${pm.cri.search}&qu_where=${qu_where}"></c:url>">마지막</a>
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
       <div class="mypage accomodations">
    		<h5 class="text-secondary heading-5">공지사항</h5>
       	<div class="content" id="content">
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
					<c:if test="${user.me_authority == 'M'}">
						<a href="<c:url value="/notice/insert"></c:url>" class="btn btn-primary float-right mt-4 mb-4">공지사항등록</a>
					</c:if>
					<ul class="pagination justify-content-center">
					  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
					  		<a class="page-link" href="<c:url value="/notice/list?page=1&no_where=${no_where}"></c:url>">처음</a>
					  	</li>
					  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
					  		<a class="page-link" href="<c:url value="/notice/list?page=${pm.startPage-1}&no_where=${no_where}"></c:url>">이전</a>
					  	</li>
					  	
					  	<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
					    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
					    		<a class="page-link" href="<c:url value="/notice/list?page=${i}&no_where=${no_where}"></c:url>">${i}</a>
					    	</li>
					    </c:forEach>
					
					    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
					    	<a class="page-link " href="<c:url value="/notice/list?page=${pm.endPage+1}&no_where=${no_where}"></c:url>">다음</a>
					    </li>
					    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
					    	<a class="page-link" href="<c:url value="/notice/list?page=${pm.finalPage}&no_where=${no_where}"></c:url>">마지막</a>
					    </li>
					</ul>
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
<script>
$(function(){
	$('.accept').click(function(){
		let bm_me_id = $(this).parent().siblings('.bm_me_id').text();
		let bm_pos = 'B';
		let obj = {
				bm_me_id : bm_me_id,
				bm_pos : bm_pos
		}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/bm/pos/permit',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('가입을 승인 했습니다.');
					document.location.href = document.location.href;
				}else{
					alert('잘못된 접근입니다.');
				}
			}
		})
	})
	$('.cancel').click(function(){
		let bm_me_id = $(this).parent().siblings('.bm_me_id').text();
		console.log(bm_me_id);
		let bm_pos = 'N';
		let obj = {
				bm_me_id : bm_me_id,
				bm_pos : bm_pos
		}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/bm/pos/cancel',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('가입을 취소 했습니다.');
					document.location.href = document.location.href;
				}else{
					alert('잘못된 접근입니다.');
				}
			}
		})
	})
	$('.register').click(function(){
		let ac_num = $(this).parent().siblings('.ac_num').text();
		let ac_permit = 'Y';
		let obj = {
				ac_num : ac_num,
				ac_permit : ac_permit
		}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/accommodations/permit/register',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('고시원 등록을 승인했습니다.');
					document.location.href = document.location.href;
				}else{
					alert('잘못된 접근입니다.');
				}
			}
		})
	})
	$('.turn').click(function(){
		let ac_num = $(this).parent().siblings('.ac_num').text();
		let ac_permit = 'S';
		let obj = {
				ac_num : ac_num,
				ac_permit : ac_permit
		}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/accommodations/permit/turn',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('고시원 등록을 보류했습니다.');
					document.location.href = document.location.href;
				}else{
					alert('잘못된 접근입니다.');
				}
			}
		})
	})
	$('.refuse').click(function(){
		let ac_num = $(this).parent().siblings('.ac_num').text();
		let ac_permit = 'N';
		let obj = {
				ac_num : ac_num,
				ac_permit : ac_permit
		}
		
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/accommodations/permit/refuse',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('고시원 등록을 취소했습니다.');
					document.location.href = document.location.href;
				}else{
					alert('잘못된 접근입니다.');
				}
			}
		})
	})
	
	$('.adinsert').click(function(){
		let ad_code = $(this).parent().siblings('.ad_code').text();
		let ad_month = $(this).parent().siblings('.ad_month').text();
		let ad_state = 'Y';
		let ad_start_date = new Date();
		console.log(ad_start_date)
		let now = new Date();
		let ad_end_date = new Date(now.setMonth(now.getMonth() + parseInt(ad_month)));
		console.log(ad_end_date)
		let obj = {
				ad_code : ad_code,
				ad_start_date : ad_start_date,
				ad_end_date : ad_end_date,
				ad_state : ad_state
		}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/ad/state/permit',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('광고를 승인 했습니다.');
					document.location.href = document.location.href;
				}else{
					alert('잘못된 접근입니다.');
				}
			}
		})
	})
	$('.adcancel').click(function(){
		let ad_code = $(this).parent().siblings('.ad_code').text();
		let ad_state = 'C';
		let ad_end_date = new Date();
		let obj = {
				ad_code : ad_code,
				ad_end_date : ad_end_date,
				ad_state : ad_state
		}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/ad/state/cancel',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('광고를 취소 했습니다.');
					document.location.href = document.location.href;
				}else{
					alert('잘못된 접근입니다.');
				}
			}
		})
	})
})
</script>
</body>
</html>