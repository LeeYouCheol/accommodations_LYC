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
<title>안내사항 상세</title>
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
        <h2 class="text-secondary heading-2">안내사항 상세</h2>
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
								<th scope="row">작성자</th>
								<td>
									<input class="form-control" type="text" value="${info.bi_me_id}" readonly>
								</td>
								<th scope="row">이름</th>
								<td>
									<input class="form-control" type="text" value="${info.bi_me_name}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td colspan="6">
									<input class="form-control col-14" type="text" id="bi_title" name="bi_title" value="${info.bi_title}">
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="6">
									<textarea style="width:700px; height:500px;" id="bi_content" name="bi_content">${info.bi_content}</textarea>
								</td>
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td colspan="6">
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
						</tbody>
					</table>
		      <button class="btn btn-outline-success mb-4" style="float: right;">수정완료</button>
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
	$('[name=bi_content]').summernote({
    placeholder: 'QnA 내용을 입력하세요.',
    tabsize: 2,
    height: 400
  });
	$('form').submit(function(){
		let bi_title = $('[name=bi_title]').val();
		if(bi_title == ''){
			alert('안내사항 제목을 입력하세요.');
			$('[name=bi_title]').focus();
			return false;
		}
		let bi_content = $('[name=bi_content]').val();
		if(bi_content == ''){
			alert('안내사항 내용을 입력하세요.');
			$('[name=bi_content]').focus();
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

