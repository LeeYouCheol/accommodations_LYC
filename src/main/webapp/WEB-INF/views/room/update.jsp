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

<title>객실등록</title>
<style>
#table-box{
	width:100%; line-height: 1.4; border-spacing: 0; border-collapse: collapse;
}
#head{
	color: black; font-size:14px; padding: 13px 0p 13px 8px; font-weight: 700px;
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
				<h2 class="text-secondary heading-2">객실수정</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-9 bg-white p-5">
				<form class="contact-form" data-aos="fade-up" data-aos-delay="200" action="<c:url value="/room/insert"></c:url>" method="post" enctype="multipart/form-data">
					<div class="table-box" id="table-box">
						<table>
							<colgroup>
								<col style="width: 13%">
								<col style="width: 37%">
								<col style="width: 12%">
								<col style="width: 38%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" id="head">객실유형</th>
									<td>
										<select class="form-control col-6" name="ro_type" id="ro_type">
											<option value="0" selected="selected">유형</option>
											<option value="room">객실</option>
											<option value="facilities">공용시설</option>
										</select>
									</td>
								</tr>
								<tr class="box-ro-type1">
									<th scope="row" id="head">층수</th>
									<td>
										<input type="text" class="form-control col-4" id="ro_floor" name="ro_floor" value="${room.ro_floor}" placeholder="숫자">
									</td>
									<th scope="row" id="head">호수</th>
									<td>
										<input type="text" class="form-control col-4" id="ro_num" name="ro_num" value="${room.ro_num}" placeholder="숫자">
									</td>
								</tr>
								<tr class="box-ro-type2">
									<th scope="row" id="head">층수</th>
									<td>
										<input type="text" class="form-control col-4" id="ro_floor" name="ro_floor" placeholder="숫자">
									</td>
									<th scope="row" id="head">시설이름</th>
									<td>
										<input type="text" class="form-control" id="ro_num" name="ro_num" placeholder="이름을입력하세요(ex: 세탁실)">
									</td>
								</tr>
								<tr class="box-ro-type1">
									<th scope="row" id="head">객실옵션</th>
									<td style="">
										<div>
											<input type="checkbox" class="form-check-input" name="sp_bed" value="${spec.sp_bed}">침대
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_table" value="${spec.sp_table}">책상
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_chair" value="${spec.sp_chair}">의자
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_ac" value="${spec.sp_ac}">개별에어컨
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_hit" value="${spec.sp_hit}">개별난방
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_bathroom" value="${spec.sp_bathroom}">화장실
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_refrigerator" value="${spec.sp_refrigerator}">냉장고
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_shower" value="${spec.sp_shower}">샤워실
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_window" value="${spec.sp_window}">창문
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_internet" value="${spec.sp_internet}">인터넷
										</div>
										<div>
											<input type="checkbox" class="form-check-input" name="sp_wifi" value="${spec.sp_wifi}">개별와이파이
										</div>
									</td>
								</tr>
								<tr class="box-ro-type1">
									<th scope="row" id="head">가격</th>
									<td>
										<input type="text" class="form-control col-6" id="ro_price" name="ro_price" value="${room.ro_price}" placeholder="숫자">
									</td>
								</tr>
								<tr class="box-ro-type1">
									<th scope="row" id="head">객실설명</th>
									<td colspan="6">
										<textarea name="ro_content" id="ro_content">${room.ro_content}</textarea>
									</td>
								</tr>
								<tr class="box-ro-type1">
									<th scope="row" id="head">객실사진</th>
									<td colspan="6">
										<c:forEach items="${fileList}" var="file">
											<a class="form-control" href="javascript:0;">
												<span>${file.fi_ori_name}</span>
												<span class="btn-close" data-target="${file.fi_num }">X</span>
											</a>
										</c:forEach>
										<c:forEach begin="1" end="${3-fileList.size()}">
											<input type="file" class="form-control" name="files">
										</c:forEach>
									</td>
								</tr>
								<tr class="box-ro-type2">
									<th scope="row" id="head">공용공간설명</th>
									<td colspan="6">
										<textarea name="ro_content" id="ro_content">${room.ro_content}</textarea>
									</td>
								</tr>
								<tr class="box-ro-type2">
									<th scope="row" id="head">공용공간사진</th>
									<td colspan="6">
										<c:forEach items="${fileList}" var="file">
											<a class="form-control" href="javascript:0;">
												<span>${file.fi_ori_name}</span>
												<span class="btn-close" data-target="${file.fi_num }">X</span>
											</a>
										</c:forEach>
										<c:forEach begin="1" end="${3-fileList.size()}">
											<input type="file" class="form-control" name="files">
										</c:forEach>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<button type="submit" class="btn btn-outline-primary float-right mt-4">객실수정</button>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//셀렉트박스
$(function(){
	$('.box-ro-type1').hide();
	$('.box-ro-type2').hide();
	
	$('#ro_type').change(function() {
		var result = $(this).val();
		if (result == '0') {
			$('.box-ro-type1').hide();
			$('.box-ro-type2').hide();
		} else if(result == 'room'){
			$('.box-ro-type1').show();
			$('.box-ro-type2').remove();
		} else {
			$('.box-ro-type1').remove();
			$('.box-ro-type2').show();
		}
	}); 
	
})
//써머노트
$(function(){
	$('[name=ro_content]').summernote({
	    placeholder: '소개글을 작성해주세요.',
	    tabsize: 2,
	    height: 700
	  });
	$('form').submit(function(){
		let ro_floor = $('[name=ro_floor]').val();
		if(ro_floor == ''){
			alert('층수를 입력하세요.');
			$('[name=ro_floor]').focus();
			return false;
		}
		let ro_num = $('[name=ro_num]').val();
		if(ro_num == ''){
			alert('호수를 입력하세요.');
			$('[name=ro_num]').focus();
			return false;
		}
		let ro_content = $('[name=ro_content]').val();
		if(ro_content == ''){
			alert('소개글을 입력하세요.');
			$('[name=ro_content]').focus();
			return false;
		}
	});
})
//유효성 검사
$(function(){
	$("form").validate({
    	rules: {
        	ro_type: {
            	required : true,
        	},
        	ro_floor: {
        		required : true,
        	},
        	ro_num: {
            	required : true,
        	},
        	ro_content: {
        		required : true,
        	}
    	},
    	//규칙체크 실패시 출력될 메시지
    	messages : {
        	ro_type: {
            	required : "필수로입력하세요"
        	},
        	ro_floor: {
            	required : "필수로입력하세요",
        	},
        	ro_num: {
            	required : "필수로입력하세요",
        	},
        	ro_content: {
        		required : "필수로입력하세요"
        	}
    	},
    	submitHandler: function(form){
    		return true;
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