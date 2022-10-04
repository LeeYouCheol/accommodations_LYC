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
.btn{
	margin-left: 30px;
}
</style>
<title>회원가입</title>
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
          <h2 class="text-secondary heading-2">회원가입</h2>
          <p>회원 구분을 선택해주세요.</p>
        </div>
      </div>
      <div class="row justify-content-center">
          <form class="contact-form" data-aos="fade-up" data-aos-delay="200" action="<%=request.getContextPath()%>/signup/sort" method="post" id="signup">
            

            <a type="submit" class="btn btn-primary mb-4 normal" href="<c:url value="/signup"></c:url>">일반회원가입</a>
			<a type="submit" class="btn btn-primary mb-4 business" href="<c:url value="/signup/business"></c:url>">사업자회원가입</a>
            <div class="form-group">
              <p><small>이미가입하셨나요? <a href="<c:url value="/login"></c:url>">로그인</a></small></p>
            </div>
          </form>
      </div>
    </div>
  </div>

</body>
</html>

