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
.phone{
	display: flex;
}
.rn-box{
	display: flex;
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
        <h2 class="text-secondary heading-2">회원정보수정</h2>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-lg-5 bg-white p-5">
        <form class="contact-form" data-aos="fade-up" data-aos-delay="200" action="<%=request.getContextPath()%>/update" method="post" id="signup">
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label class="text-black" for="me_name">이름</label>
                <input type="text" class="form-control" value="${user.me_name}" readonly>
              </div>
            </div>
          </div>
          <div class="form-group">
						<label>성별:</label>
					</div>
					<div class="form-group">
						<div class="form-check-inline">
							<label class="form-check-label">
		  					<input type="checkbox" class="form-check-input" name="me_gender" value="M" <c:if test="${user.me_gender == 'M'.charAt(0)}">checked</c:if> >남성
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label">
		  					<input type="checkbox" class="form-check-input" name="me_gender" value="F" <c:if test="${user.me_gender == 'F'.charAt(0)}">checked</c:if> >여성
							</label>
						</div>
						<div>
							<label class="error" id="me_gender-error" for="me_gender"></label>
						</div>
					</div>
          <div class="form-group">
            <label class="text-black" for="me_id">아이디</label>
            <input type="text" class="form-control" value="${user.me_id}" readonly>
          </div>
          <div class="form-group">
            <label class="text-black" for="me_pw">비밀번호</label>
            <input type="password" class="form-control" id="me_pw" name="me_pw">
          </div>

          <div class="form-group">
            <label class="text-black" for="me_pw2">비밀번호 확인</label>
            <input type="password" class="form-control" id="me_pw2" name="me_pw2">
          </div>
          <div class="form-group">
            <label class="text-black" for="me_email">Email</label>
            <input type="email" class="form-control" id="me_email" name="me_email" value="${user.me_email}">
          </div>
						<div class="form-group">
							<div class="input-group mb-3">
								<input type="text" id="me_post_code" placeholder="우편번호" name="me_post_code" id="me_post_code" value="${user.me_post_code}" class="form-control">
								<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control">
						  	</div>
							<div class="input-group mb-3">
								<input type="text" id="me_addr" placeholder="주소" name="me_addr" id="me_addr" value="${user.me_addr}" class="form-control">
							</div>
							<div class="input-group mb-3">
								<input type="text" id="me_addr_detail" placeholder="상세주소" name="me_addr_detail" id="me_addr_detail" value="${user.me_addr_detail}" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="text-black" for="me_phone">전화번호</label>
							<div class="form-group phone">
								<select class="input-group-prepend form-control col-3" name="me_phone1" id="me_phone1">
									<option value="010" >010</option>
									<option value="011" >011</option>
									<option value="016" >016</option>
								</select>
								<input type="text" class="form-control col-6" id="me_phone2" name="me_phone2" value="${user.me_phone}">
								<input type="hidden" name="me_phone">
          		</div>
          	</div>
						<div class="form-group">
							<label class="text-black" for="me_job">직업</label>
							<select class="input-group-prepend form-control col-3" name="me_job" id="me_job">
								<option value="studenet" <c:if test="${user.me_job == 'studenet'}">selected</c:if> >학생</option>
								<option value="jobSeeker" <c:if test="${user.me_job == 'jobSeeker'}">selected</c:if> >취준생</option>
								<option value="worker" <c:if test="${user.me_job == 'worker'}">selected</c:if> >직장인</option>
								<option value="aso" <c:if test="${user.me_job == 'aso'}">selected</c:if> >기타</option>
							</select>
						</div>

            <button type="submit" class="btn btn-primary mb-4">수정</button>
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
<!-- 유효성검사 -->
$(function(){
	$('#signup').validate({
		rule:{
		},
		submitHandler: function(form){
			let p1 = $('[name=me_phone1]').val();
			let p2 = $('[name=me_phone2]').val();
			let me_phone = p1 + p2;
			$('[name=me_phone]').val(me_phone);
       		let rn1 = $('[name=me_rn1]').val();
       		let rn2 = $('[name=me_rn2]').val();
       		let me_prn = rn1 + rn2;
       		$('[name=me_rn]').val(me_rn);
       		return true;
       	
    		return true;
       	}
		
	})
})
$.validator.addMethod(
	"regex",
    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    },
    "Please check your input."
);	
$(function(){
let idCheck = false;
function ajaxPost(async, dataObj, url, success){
	$.ajax({
    	async:async,
    	type:'POST',
    	data:JSON.stringify(dataObj),
    	url: "<%=request.getContextPath()%>"+url,
    	dataType:"json",
    	contentType:"application/json; charset=UTF-8",
    	success : function(data){
   	 		success(data)
    	}
	});
}
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

			document.getElementById('me_post_code').value = data.zonecode;
			document.getElementById("me_addr").value = addr;
			document.getElementById("me_addr_detail").focus();
		}
	}).open();
}
</script>
</body>
</html>

