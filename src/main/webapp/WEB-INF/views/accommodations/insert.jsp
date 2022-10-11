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
[name=file]{
	display: none;
}
.box-thumb{
	width: 150px; height: 150px; border:1px solid blue;
	text-align: center; font-size : 50px; line-height: 148px;
	cursor: pointer; box-sizing: border-box;
}
#preview{
	display: none;
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
				<h2 class="text-secondary heading-2">고시원 등록 신청</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-9 bg-white p-5">
				<form class="contact-form" data-aos="fade-up" data-aos-delay="200" action="<c:url value="/accommodations/insert"></c:url>" method="post" enctype="multipart/form-data">
					<div class="clearfix">
						<div class="float-right" style="width:calc(100% - 150px - 10px)">
							<div class="form-group">
								<label for="ac_name">고시원 이름:</label>
								<input type="text" class="form-control" name="ac_name" id="ac_name">
							</div>
							<div style="display:flex">
								<div class="form-group" style="display:flex">
									<label for="ac_representation" style="line-height: 45px;">대표자:</label>
									<input type="text" class="form-control" value="${user.me_name}" name="ac_representation" id="ac_representation" style="width:45%;" readonly>
								</div>
								<div class="form-group" style="display:flex">
									<label for="ac_me_id" style="line-height: 45px;">아이디:</label>
									<input type="text" class="form-control" value="${user.me_id}" name="ac_me_id" id="ac_me_id" style="width:45%;" readonly>
								</div>
							</div>
							<div class="form-group">
								<label>주소:</label>
								<div class="input-group mb-3">
									<input type="text" id="ac_post_code" placeholder="우편번호" name="ac_post_code" id="ac_post_code" class="form-control">
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control">
							  	</div>
								<div class="input-group mb-3">
									<input type="text" id="ac_addr" placeholder="주소" name="ac_addr" id="ac_addr" class="form-control">
								</div>
								<div class="input-group mb-3">
									<input type="text" id="ac_addr_detail" placeholder="상세주소" name="ac_addr_detail" id="ac_addr_detail" class="form-control">
								</div>
							</div>
							<div class="form-group">
									<label for="ac_phone" style="line-height: 45px;">전화번호:</label>
									<div class="form-group phone" style="display:flex">
										<select class="input-group-prepend form-control" name="ac_phone1" id="ac_phone1">
											<option value="02" >02</option>
											<option value="051" >051</option>
											<option value="053" >053</option>
											<option value="032" >032</option>
											<option value="062" >062</option>
											<option value="042" >042</option>
											<option value="052" >052</option>
											<option value="044" >044</option>
											<option value="031" >031</option>
											<option value="033" >033</option>
											<option value="043" >043</option>
											<option value="041" >041</option>
											<option value="063" >063</option>
											<option value="061" >061</option>
											<option value="054" >054</option>
											<option value="055" >055</option>
											<option value="064" >064</option>
											<option value="010" >010</option>
											<option value="011" >011</option>
											<option value="016" >016</option>
										</select>
										<input type="text" class="form-control" id="ac_phone2" name="ac_phone2" placeholder="숫자만입력">
										<input type="hidden" name="me_phone">
								</div>
							</div>
							<div class="floor" style="display:flex;">
								<div class="form-group" style="display:flex;">
									<label for="ac_to_room" style="line-height: 45px;">층수:</label>
									<input type="text" class="form-control" id="ac_floor" name="ac_floor" placeholder="숫자" style="width:50%;">
								</div>
								<div class="form-group" style="display:flex;">
									<label for="ac_to_room" style="line-height: 45px;">객실수:</label>
									<input type="text" class="form-control" id="ac_to_room" name="ac_to_room" placeholder="숫자" style="width:50%;">
								</div>
							</div>
							<div class="form-group">
								<label>층별안내도:</label>
								<div class="box-floor">
									<div class="row">
										<input type="text" class="form-control file col-3" name="floor">
										<input type="file" class="form-control file col-9" name="floorImgs">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>상세페이지에 들어갈 고시원사진:</label>
								<input type="file" class="form-control file" name="files">
								<input type="file" class="form-control file" name="files">
								<input type="file" class="form-control file" name="files">
								<input type="file" class="form-control file" name="files">
							</div>
							<div class="form-group">
								<label for="ac_content">고시원소개글:</label>
								<textarea class="form-control" id="ac_content" name="ac_content"></textarea>
							</div>
						</div>
					</div>
					<button class="btn btn-outline-primary float-right mt-4">고시원 등록 신청</button>
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
	$('#ac_floor').change(function(){
		let floor = $(this).val();
		
		try{
			floor = new Number(floor);
		}catch(e){
			alert('정수를 입력하세요.');
			return;
		}
		let str = '';
		for(i = 0; i<floor; i++){
			str += '<div class="row">'
			str +=	'<input type="text" class="form-control file col-3" name="floor">'
			str +=	'<input type="file" class="form-control file col-9" name="floorImgs">'
			str += '</div>'
		}
		$('.box-floor').html(str)
	})
	
	$("form").validate({
    	rules: {
        	ac_name: {
            	required : true,
        	},
        	me_phone: {
        		required : true,
        	},
        	ac_to_room: {
            	required : true,
        	},
        	ac_content: {
        		required : true,
        	}
    	},
    	//규칙체크 실패시 출력될 메시지
    	messages : {
        	ac_name: {
            	required : "필수로입력하세요"
        	},
        	ac_phone: {
            	required : "필수로입력하세요",
        	},
        	ac_to_room: {
            	required : "필수로입력하세요",
        	},
        	ac_content: {
        		required : "필수로입력하세요"
        	}
    	},
    	submitHandler: function(form){
    		let p1 = $('[name=me_phone1]').val();
			let p2 = $('[name=me_phone2]').val();
			let me_phone = p1 + p2;
			$('[name=me_phone]').val(me_phone);
    		return true;
    	}
	});
})
<!-- 우편번호 함수 -->
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = ''; // 주소 변수

			if (data.userSelectedType === 'R') {
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}

			document.getElementById('ac_post_code').value = data.zonecode;
			document.getElementById("ac_addr").value = addr;
			document.getElementById("ac_addr_detail").focus();
		}
	}).open();
}
//써머노트
$(function(){
	$('[name=ac_content]').summernote({
    placeholder: '소개글을 작성해주세요.',
    tabsize: 2,
    height: 700
  });
	$('form').submit(function(){
		let qu_title = $('[name=ac_name]').val();
		if(qu_title == ''){
			alert('고시원 이름을 입력하세요.');
			$('[name=ac_title]').focus();
			return false;
		}
		let qu_content = $('[name=ac_content]').val();
		if(ac_content == ''){
			alert('소개글을 입력하세요.');
			$('[name=ac_content]').focus();
			return false;
		}
	});
})
</script>
</body>
</html>