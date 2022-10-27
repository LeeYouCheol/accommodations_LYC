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
      			<h5 class="text-secondary heading-5">객실현황</h5>
	        	<div class="content" id="content">
	        		<table border="1">
								<colgroup>
									<col style="width:auto;">
									<col style="width:auto;">
									<col style="width:auto;">
									<col style="width:auto;">
									<col style="width:auto;">
	        			</colgroup>
	        			<thead id="head">
	        				<tr>
	        					<th id="head-item" scope="col" class="type">객실코드</th>
	        					<th id="head-item" scope="col" class="type">객실타입</th>
	        					<th id="head-item" scope="col" class="num">객실호수</th>
	        					<th id="head-item" scope="col" class="price">객실가격</th>
	        					<th id="head-item" scope="col" class="premium">프리미엄</th>
	        					<th id="head-item" scope="col" class="state">이용여부</th>
	        					<th id="head-item" scope="col" class="statement">관리</th>
	        				</tr>
	        			</thead>
	        			<tbody>
	        				<c:forEach items="${roomList}" var="room">
									<tr>
										<td class="body-item ro_code">${room.ro_code}</td>
										<td id="body-item">${room.ro_type}</td>
										<td id="body-item">${room.ro_num}</td>
										<td id="body-item">${room.ro_price}</td>
										<td id="body-item">
											<c:if test="${room.ro_premium == 'P'}">
												<span style="color: black;">프리미엄</span>
											</c:if>
											<c:if test="${room.ro_premium == 'N'}">
												<span style="color: black;">일반</span>
											</c:if>
										</td>
										<td>
											<c:if test="${room.ro_state == 'A'}">
												<span style="color: black;">예약가능</span>
											</c:if>
											<c:if test="${room.ro_state == 'R'}">
												<span style="color: black;">예약불가</span>
											</c:if>
											<c:if test="${room.ro_state == 'F'}">
												<span style="color: black;">수리중</span>
											</c:if>
										</td>
										<td>
											<a class="btn btn-outline-light text-dark" href="<c:url value="/room/select/${room.ro_code}"></c:url>">상세</a>
											<a class="btn btn-outline-primary" href="<c:url value="/room/update/${room.ro_code}"></c:url>">수정</a>
											<a class="btn btn-outline-danger" href="<c:url value="/room/delete/${room.ro_code}"></c:url>">삭제</a>
											<c:if test="${room.ro_state == 'A'}">
												<button type="button" class="btn btn-outline-secondary fix">수리</button>
											</c:if>
											<c:if test="${room.ro_state == 'F'}">
												<button type="button" class="btn btn-outline-success use">사용</button>
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
<script>
$(function(){
	$('.fix').click(function(){
		let ro_code = $(this).parent().siblings('.ro_code').text();
		let ro_state = 'F';
		let obj = {
			ro_code : ro_code,
			ro_state : ro_state
		}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/room/state/fix',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('객실상태를 변경했습니다.');
					document.location.href = document.location.href;
				}else{
					alert('잘못된 접근입니다.');
				}
			}
		})
	})
	$('.use').click(function(){
		let ro_code = $(this).parent().siblings('.ro_code').text();
		let ro_state = 'A';
		let obj = {
			ro_code : ro_code,
			ro_state : ro_state
		}
		$.ajax({
			async:true,
			type:'POST',
			data:JSON.stringify(obj),
			url: '<%=request.getContextPath()%>/room/state/use',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.res){
					alert('객실상태를 변경했습니다.');
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