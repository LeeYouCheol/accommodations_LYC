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

<title>아이디/비밀번호찾기</title>
</head>

<body>
<div class="untree_co-section bg-light">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-lg-6">
				<h2 class="text-secondary heading-2">아이디/비밀번호찾기</h2>
	        </div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-5 bg-white p-5">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#id">아이디찾기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#pw">비밀번호찾기</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="id" class="container tab-pane active"><br>
						<div class="form-group">
							<label class="text-black" for="me_name">이름</label>
							<input type="text" class="form-control" id="me_name" name="me_name">
						</div>
						<div class="form-group">
							<label class="text-black" for="me_email">이메일</label>
							<input type="password" class="form-control" id="me_email" name="me_email">
						</div>
						<button type="submit" class="btn btn-primary mb-4 btn-find-id">아이디찾기</button>
					</div>
					<div id="pw" class="container tab-pane fade"><br>
						<div class="form-group">
							<label class="text-black" for="me_id">아이디</label>
							<input type="text" class="form-control" id="me_id" name="me_id">
						</div>
						<div class="form-group">
							<label class="text-black" for="me_email">이메일</label>
							<input type="password" class="form-control" id="me_email" name="me_email">
						</div>
						<button type="submit" class="btn btn-primary mb-4 btn-find-pw">비밀번호찾기</button>
					</div>
		        </div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	let type = '${type}';
	$('a[href="#'+type+'"]').click();
	
	$('.btn-find-id').click(function(){
		let me_name = $('#id [name=me_name]').val();
		let me_email = $('#id [name=me_email]').val();
		let obj = {
				me_name : me_name,
				me_email : me_email
		}
		if(me_name.trim() == ''){
			alert('이름을 입력하세요.');
			$('#id [name=me_name]').focus();
			return;
		}
		if(me_email.trim() == ''){
			alert('이메일을 입력하세요.');
			$('#id [name=me_email]').focus();
			return;
		}
		$.ajax({
		     async:true,
		     type:'POST',
		     data:JSON.stringify(obj),
		     url: '<%=request.getContextPath()%>/find/id',
		     dataType:"json",
		     contentType:"application/json; charset=UTF-8",
		     success : function(data){
		    	 if(data.idList.length == 0){
		    		 alert('가입된 아이디가 없습니다.')
		    		 return;
		    	 }
		    	 let str = '회원님의 아이디는 다음과 같습니다. \n';
		    	for(id of data.idList){
		    		str += id + '\n'
		    	}
		    	alert(str);
		     }
		});
	})
	$('.btn-find-pw').click(function(){
		let me_id = $('#pw [name=me_id]').val();
		let me_email = $('#pw [name=me_email]').val();
		let obj = {
				me_id : me_id,
				me_email : me_email
		}
		if(me_id.trim() == ''){
			alert('아이디를 입력하세요.');
			$('#pw [name=me_id]').focus();
			return;
		}
		if(me_email.trim() == ''){
			alert('이메일을 입력하세요.');
			$('#pw [name=me_email]').focus();
			return;
		}
		var str = '<div class="alert">확인중입니다.</div>';
		$('.container').after(str);
		$.ajax({
		     async:true,
		     type:'POST',
		     data:JSON.stringify(obj),
		     url: '<%=request.getContextPath()%>/find/pw',
		     dataType:"json",
		     contentType:"application/json; charset=UTF-8",
		     success : function(data){
		    	 $('.alert').remove();
		    	 setTimeout(() => {
		    		 if(data.res){
			    		 alert('가입하신 이메일로 새 비밀번호를 전송했습니다. 확인해주세요.');
			    	 }else{
			    		 alert('입력한 정보가 잘못됐거나 없는 회원 정보입니다.');
			    	 }
			    	 if(data.xeception){
			    		 alert('서버 문제입니다. 전화로 문의해주세요.');
			    	 }
		    	 })
		     }
		});
	})
})
</script>
</body>
</html>

