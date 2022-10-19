<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>    
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">

<meta name="description" content="" />
<meta name="keywords" content="" />

<link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/css/jquery.fancybox.min.css"></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/fonts/icomoon/style.css"></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/fonts/flaticon/font/flaticon.css"></c:url>">
<link rel="stylesheet" href="<c:url value="/resources/css/aos.css"></c:url>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">

</head>    
<body>
<nav class="site-nav">
    <div class="container">
		<div class="site-navigation">
			<a href="<c:url value="/"></c:url>" class="logo m-0">고시원모아 <span class="text-primary">.</span></a>
	
	        <ul class="js-clone-nav d-none d-lg-inline-block text-left float-right site-menu">
	          <li class="active"><a href="<c:url value="/"></c:url>">Home</a></li>
	          <li class="has-children">
	            <a href="#">고객센터</a>
	            <ul class="dropdown">
	              <li><a href="<c:url value="/notice/list"></c:url>">공지사항</a></li>
	              <li><a href="<c:url value="/qna/list"></c:url>">QnA</a></li>
	            </ul>
	          </li>
	          <c:if test="${user.me_authority == 'B'}">
		          <li class="has-children">
		            <a href="#">고시원</a>
		            <ul class="dropdown">
		              <li><a href="<c:url value="/accommodations/insert"></c:url>">고시원등록</a></li>
		              <li><a href="<c:url value="/room/insert"></c:url>">객실등록</a></li>
		            </ul>
		          </li>
		      </c:if>
          <li><a href="<c:url value="/accommodations/list"></c:url>">고시원찾기</a></li>
          <c:if test="${user.me_authority != 'N'}">
          	<li><a href="<c:url value="/admin/info"></c:url>">사업자이용정보</a></li>
					</c:if>
					<c:if test="${user == null}">
						<li><a href="<c:url value="/signup/sort"></c:url>">Sign up</a></li> 
						<li class="cta-button active"><a href="<c:url value="/login"></c:url>">Login</a></li>
					</c:if>
					<c:if test="${user.me_authority == 'M'}">
						${user.me_id} <a href="<c:url value="/admin/mypage"></c:url>">MyPage</a>
		      	<li class="nav-item">
		        	<a href="<c:url value="/logout"></c:url>">로그아웃</a>
		      	</li>
	      	</c:if>
	      	<c:if test="${user.me_authority == 'B'}">
	      		${user.me_id} <a href="<c:url value="/main/mypageBusiness"></c:url>">MyPage</a>
		      	<li class="nav-item">
		        	<a href="<c:url value="/logout"></c:url>">로그아웃</a>
		      	</li>
		      	<li class="nav-item">
		      		<a href="<c:url value="#"></c:url>">정보수정</a>
		      	</li>
	      	</c:if>
					<c:if test="${user.me_authority == 'N'}">
						${user.me_id}님 <a href="<c:url value="/main/mypage"></c:url>">MyPage</a>
						<li class="nav-item">
				    	<a href="<c:url value="/logout"></c:url>">로그아웃</a>
				    </li>
				    <li class="nav-item">
				    	<a href="<c:url value="/update"></c:url>">정보수정</a>
				    </li>
					</c:if>
	        </ul>
	
	        <a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
	          <span></span>
	        </a>
	
		</div>
    </div>
</nav>

</body>