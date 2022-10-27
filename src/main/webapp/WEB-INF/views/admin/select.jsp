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
								<input class="form-control col-14" type="text" value="${info.bi_title}" readonly>
							</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="6">
								<div style="width:700px; height:500px; margin-top: 5px;">${info.bi_content}</div>
							</td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td colspan="6">
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
				<c:if test="${user.me_authority == 'M'}">
	      	<a class="btn btn-primary mb-4" href="<c:url value="/admin/update?bi_num=${info.bi_num}"></c:url>" style="float: right;">수정</a>
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

