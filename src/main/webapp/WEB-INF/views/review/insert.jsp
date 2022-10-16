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


<title>QnA</title>
<style>
table{
	color: black;
}
td{
	padding: 13px 0px 13px 8px;
}
th{
	text-aligin: left;
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
				<h2 class="text-secondary heading-2">리뷰등록</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-9 bg-white p-5">
				<form class="contact-form" data-aos="fade-up" data-aos-delay="200" action="<c:url value="/review/insert"></c:url>" method="post" enctype="multipart/form-data">
					<table>
						<colgroup>
							<col style="width:10%">
							<col style="width:21%">
							<col style="width:10%">
							<col style="width:21%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">객실</th>
								<td>
									<input class="form-control" type="text" name="re_" value="${room.ro_num}" readonly>
								</td>
								<th scope="row">작성자</th>
								<td>
									<input class="form-control" type="text" name="re_me_id" value="${user.me_id}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">별점</th>
								<td>
									
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="6">
									<textarea style="width:700px; height:150px;" name="ro_content" id="ro_content"></textarea>
								</td>
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td>
									<div class="form-group">
										<input type="file" class="form-control file" name="files">
										<input type="file" class="form-control file" name="files">
										<input type="file" class="form-control file" name="files">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<button class="btn btn-primary float-right mt-4">리뷰등록</button>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('[name=ro_content]').summernote({
    placeholder: '내용을 입력하세요.',
    tabsize: 2,
    height: 400
  });
	$('form').submit(function(){
		let ro_content = $('[name=ro_content]').val();
		if(ro_content == ''){
			alert('내용을 입력하세요.');
			$('[name=ro_content]').focus();
			return false;
		}
	});
})
</script>
</body>
</html>