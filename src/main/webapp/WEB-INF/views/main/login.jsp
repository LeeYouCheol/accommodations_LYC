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

<title>로그인</title>
</head>

<body>
<div class="untree_co-section bg-light">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-lg-6">
				<h2 class="text-secondary heading-2">Log in</h2>
				<p>아이디와 비밀번호를 입력해주세요.</p>
	        </div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-5 bg-white p-5">
				<form class="contact-form" data-aos="fade-up" data-aos-delay="200" action="/spring/login" method="post">
		            <div class="form-group">
						<label class="text-black" for="me_id">Id</label>
						<input type="text" class="form-control" id="me_id" name="me_id">
		            </div>
		
		            <div class="form-group">
						<label class="text-black" for="me_pw">Password</label>
						<input type="password" class="form-control" id="me_pw" name="me_pw">
		            </div>
		            <div class="form-check">
			  			<label class="form-check-label">
			    			<input type="checkbox" class="form-check-input" value="true" name="autoLogin">자동로그인
			  			</label>
			  		</div>
		            <button type="submit" class="btn btn-primary mb-4">Log in</button>
		            
		            <div class="form-group">
						<p><small>아직 회원이 아닙니까? <a href="<c:url value="/signup"></c:url>">회원가입</a></small></p>
						<small>기억이나질않으세요?</small><small><a href="<c:url value="/find?type=id"></c:url>">아이디 찾기</a></small>/
						<small><a href="<c:url value="/find?type=pw"></c:url>">비밀번호 찾기</a></small>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		$('form').submit(function(){
			let id = $('[name=id]').val()
			if(id.length == 0){
				alert('아이디를 입력하세요.')
				$('[name=id]').focus();
				return false;
			}
			let pw = $('[name=pw]').val()
			let pwRegex = /^[a-z,0-9]+$/
			if(!pwRegex.test(pw)){
				alert('문자와 정수만 입력가능합니다.')
				$('[name=pw]').focus();
				return false;
			}
		})
	})
</script>
</body>
</html>

