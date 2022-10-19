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

<title>공지사항</title>
<style>
table{
	color: black;
}
td{
	padding: 13px 13px 13px 8px;
}
.th{
	text-aligin: left;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
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

<div class="untree_co-section bg-light">
	<div class="container">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-lg-6">
				<h2 class="text-secondary heading-2">공지사항</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-9 bg-white p-5">
					<table>
						<colgroup>
							<col style="width:10%">
							<col style="width:21%">
							<col style="width:10%">
							<col style="width:21%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td colspan="6">
									<input class="form-control" type="text" value="${notice.no_title}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>
									<input class="form-control" type="text" value="${notice.no_me_id}" readonly>
								</td>
								<th scope="row">작성일</th>
								<td>
									<input class="form-control" type="text" value="${notice.no_date_str}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="6">
									<div style="width:631px; height:150px;">${notice.no_content}</div>
								</td>
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td>
									<div class="form-group">
										<c:if test="${fileList.size() == 0 }">없음</c:if>
						  				<c:if test="${fileList.size() != 0 }">
						  					<c:forEach items="${fileList}" var="file">
						  						<a class="form-group" href="<c:url value="/file${file.fi_ta_name }"></c:url>" class="form-control" download="${file.fi_ori_name }">${file.fi_ori_name}</a>
						  					</c:forEach>
						  				</c:if>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				<c:if test="${notice.no_me_id == user.me_id}">
					<a class="btn btn-primary float-right mt-4" href="<%=request.getContextPath()%>/notice/update/${notice.no_num}">수정</a>
					<a class="btn btn-secondary float-right mt-4" href="<%=request.getContextPath()%>/notice/delete?no_num=${notice.no_num}">삭제</a>
				</c:if>
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
</body>
</html>