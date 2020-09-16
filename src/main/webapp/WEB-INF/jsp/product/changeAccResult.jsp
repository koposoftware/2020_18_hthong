<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="/resources/css/table.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<title>통장전환</title>
<script>
	function doCheck() {
		// 비밀번호 입력확인
		if ($("#input-pwd-form").val().length < 4) {
			alert("전환하려는 통장을 선택하세요");
			return false;
		}
		return true;
	}
</script>
<style>
.div-input-form {
	display: table;
	width: 100%;
	height: 200px;
	margin-bottom: 50px;
	background-color: #F5F5F5;
}

.div-input-form-label {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
	font-size: 22px;
	font-weight: 550;
	margin: 0 auto;
}
</style>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-sm-8"></div>
			<div class="col-sm-4">

				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">예금</a></li>
					<li class="breadcrumb-item active">통장전환</li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/productSidebar.jsp" />

			<!-- Content Column -->
			<div class="col-lg-9 mb-4">

				<%-- 카테고리 구분 --%>
				<section id="content">
					<div class="d-flex" id="wrapper">

						<!-- Page Content -->
						<div id="page-content-wrapper">
							<div class="container-fluid">
								<%-- textarea 영역 : 글내용 --%>
								<div class="textarea_wrap">
									<h5 class="textarea-head">하나 원픽 통장전환</h5>
									<hr class="textarea-head-hr">
									<br>

									<%-- ./계좌가입 form--%>

									<div class="div-input-form">
										<div class="div-input-form-label">
											<span>고객님의 일반통장이</span><br> <span>하나 원픽통장으로
												전환되었습니다.</span>
										</div>
									</div>

									<%-- 계좌가입 form --%>
									<form name="editForm">
										<table class="table table-bordered" id="content-table">
											
											<tr id="tr-head">
												<th class="table-highlight"
													style="width: 20%; text-align: left; vertical-align: middle;">전환지정일자
												</th>
												<td style="text-align: left; vertical-align: middle;">${ convertAccResult.regDate }</td>
												<th class="table-highlight"
													style="width: 20%; text-align: left; vertical-align: middle;">예금종류</th>
												<td style="text-align: left; vertical-align: middle;">${ convertAccResult.accName }</td>
											</tr>
											<tr>
												<th class="table-highlight"
													style="width: 25%; text-align: left; vertical-align: middle;">계좌번호</th>
												<td style="text-align: left; vertical-align: middle;">${ convertAccResult.accNo }</td>
												<th class="table-highlight"
													style="width: 15%; text-align: left; vertical-align: middle;">예금주</th>
												<td style="text-align: left; vertical-align: middle;">${ convertAccResult.holder }</td>
											</tr>
											<tr>
												<th class="table-highlight"
													style="width: 20%; text-align: left; vertical-align: middle;">예금잔액(원)</th>
												<td colspan="4"
													style="text-align: left; vertical-align: middle;">${ convertAccResult.balance }</td>
											</tr>
										</table>

										<%-- button --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="button" class="btn btn-outline-info"
													value="통장 확인하기"
													onclick="location.href='<%=request.getContextPath()%>/product/onepick/info'">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- /#page-content-wrapper -->
	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/css/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
