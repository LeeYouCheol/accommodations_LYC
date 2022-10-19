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

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
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
        <h2 class="text-secondary heading-2">사업자이용정보 등록</h2>
        <p>아래 사항을 기입해주세요</p>
      </div>
    </div>
    <div class="row justify-content-center">
    	<div class="col-lg-9 bg-white p-5">
	    	<form class="contact-form" data-aos="fade-up" data-aos-delay="200" action="<%=request.getContextPath()%>/admin/insert" method="post" id="signup">
		      <table>
						<colgroup>
							<col style="width:10%">
							<col style="width:21%">
							<col style="width:10%">
							<col style="width:21%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">작성자</th>
								<td>
									<input class="form-control" type="text" name="bi_me_id" value="${user.me_id}" readonly>
								</td>
								<th scope="row">이름</th>
								<td>
									<input class="form-control" type="text" name="bi_me_name" value="${user.me_name}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td colspan="6">
									<input class="form-control col-14" type="text" name="bi_title" id="bi_title">
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="6">
									<textarea style="width:700px; height:150px;" name="bi_content" id="bi_content"></textarea>
								</td>
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td colspan="6">
									<div class="form-group">
										<input type="file" class="form-control file" name="files">
										<input type="file" class="form-control file" name="files">
										<input type="file" class="form-control file" name="files">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
	      <button type="submit" class="btn btn-primary mb-4" style="float: right;">완료</button>
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

<script>
$(function(){
	$('[name=bi_content]').summernote({
    placeholder: '내용을 입력하세요.',
    tabsize: 2,
    height: 400
  });
	$('form').submit(function(){
		let bi_title = $('[name=bi_title]').val();
		if(bi_title == ''){
			alert('제목을 입력하세요.');
			$('[name=bi_title]').focus();
			return false;
		}
		let bi_content = $('[name=bi_content]').val();
		if(bi_content == ''){
			alert('내용을 입력하세요.');
			$('[name=bi_content]').focus();
			return false;
		}
	});
})
</script>
</body>
</html>

