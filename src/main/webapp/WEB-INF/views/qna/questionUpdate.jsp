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
				<h2 class="text-secondary heading-2">Q & A 수정</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-9 bg-white p-5">
				<form class="contact-form" data-aos="fade-up" data-aos-delay="200" method="post" enctype="multipart/form-data">
					<table>
						<colgroup>
							<col style="width:10%">
							<col style="width:21%">
							<col style="width:10%">
							<col style="width:21%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">문의유형</th>
								<td>
									<input class="form-control" type="text" value="${question.qu_type}" readonly>
								</td>
								<th scope="row">작성자</th>
								<td>
									<input class="form-control" type="text"value="${question.qu_me_id}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td colspan="6">
									<input class="form-control col-14" type="text" name="qu_title" id="qu_title" value="${question.qu_title}">
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="6">
									<textarea style="width:700px; height:150px;" name="qu_content" id="qu_content">${question.qu_content}</textarea>
								</td>
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td>
									<div class="form-group box-files">
										<c:forEach items="${fileList}" var="file">
											<a class="form-control" href="javascript:0;">
												<span>${file.fi_ori_name}</span>
												<span class="btn-close" data-target="${file.fi_num }">X</span>
											</a>
										</c:forEach>
										<c:forEach begin="1" end="${3-fileList.size()}">
											<input type="file" class="form-control" name="files">
										</c:forEach>
									</div>
								</td>
							</tr>
							<tr>
								<th>비밀글</th>
								<td>
									<div class="form-check">
										<input type="checkbox" class="form-check-input" value="1" name="qu_secret" <c:if test="${question.qu_secret == '1'}">checked</c:if>>비밀글을 원하면 체크 해주세요.
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<button class="btn btn-primary float-right mt-4">QnA수정</button>
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
<script type="text/javascript">
$(function(){
	$('[name=qu_content]').summernote({
    placeholder: '문의 내용을 입력하세요.',
    tabsize: 2,
    height: 400
  });
	$('form').submit(function(){
		let qu_title = $('[name=qu_title]').val();
		if(qu_title == ''){
			alert('제목을 입력하세요.');
			$('[name=qu_title]').focus();
			return false;
		}
		let qu_content = $('[name=qu_content]').val();
		if(qu_content == ''){
			alert('내용을 입력하세요.');
			$('[name=qu_content]').focus();
			return false;
		}
	});
	$(document).on('click', '.btn-close', function(){
		let fi_num = $(this).data('target');
		$(this).parent().remove();
		let str = '';
		str += '<input type="file" class="form-control" name="files">';
		str += '<input type="hidden" name="nums" value="'+fi_num+'">';
		$('.box-files').append(str);
	})
})
</script>
</body>
</html>