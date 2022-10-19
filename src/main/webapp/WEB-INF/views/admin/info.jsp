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
.info-box{
	color : black;
}
</style>
<title>마이페이지</title>
</head>
<body>
<div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
      <div class="site-mobile-menu-close">
        <span class="icofont-close js-menu-toggle"></span>
      </div>
    </div>
    <div class="site-mobile-menu-body"></div>
</div>

<div class="untree_co-section">
  <div class="container">
    <div class="row justify-content-center text-center">
      <div class="col-lg-6">
        <h2 class="text-secondary heading-2">사업자 이용정보</h2>
        <p>사업자 회원분들은 아래의 내용을 참고하시고 이용해주십시오.</p>
      </div>
    </div>
  </div>
</div>
 
<div class="untree_co-section bg-light" id="bg-light">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-10 bg-white p-5 info-box">
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
      </div>
		</div>
		<c:if test="${user.me_authority == 'M'}">
			<a class="btn btn-primary mt-5" href="<c:url value="/admin/insert"></c:url>" style="float: right;">등록</a>
		</c:if>
	</div>
</div>
<div id="overlayer"></div>
<div class="loader">
	<div class="spinner-border" role="status">
		<span class="sr-only">Loading...</span>
    </div>
</div>
</body>
</html>