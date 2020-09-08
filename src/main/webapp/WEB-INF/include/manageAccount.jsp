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
<link href="/resources/images/apple-touch-icon.png"
	rel="apple-touch-icon">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900"
	rel="stylesheet">
<!-- Vendor CSS Files -->
<link
	href="/resources/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/vendor/icofont/icofont.min.css"
	rel="stylesheet">
<link
	href="/resources/css/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="/resources/css/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="/resources/css/vendor/venobox/venobox.css"
	rel="stylesheet">
<link href="/resources/css/vendor/aos/aos.css"
	rel="stylesheet">
<!-- Template Main CSS File --> 
<link href="/resources/css/style.css" rel="stylesheet">
<style>
#modal {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 100%;
	height: 100%;
	z-index: 1;
	transform: translate(-50%, -50%);
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	width: 600px;
	height: 500px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	width: 100%;
	height: 200%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	window.onload = function() {

		$("#modal_open_btn").click(function() {
			$("#modal").attr("style", "display:block");
		});

		$("#modal_close_btn").click(function() {
			$("#modal").attr("style", "display:none");
		});
	}
</script>
<!-- 계좌관리 모달창 -->
<title>계좌정보</title>
</head>
<body>
	<!-- Page Content -->
	<div class="" id="modal">
		<div class="modal_content">
			<!-- Content Row -->
			<div class="row">
					<div id="modal_close">
						<span id="modal_close_btn">X</span>
					</div>
				<div class="col-lg-9 mb-4">
					<%-- 카테고리 구분 --%>
					<section id="content">
						<div class="d-flex" id="wrapper">
							<!-- Page Content -->

							<%-- textarea 영역 : 글내용 --%>
							<div class="textarea_wrap">
								<h5 class="textarea-head">계좌정보보기</h5>
								<hr class="textarea-head-hr">
								<br>

								<%-- 회원가입 form --%>
								<form method="POST" name="signUpForm"
									onsubmit="return doWrite()">
									<table class="table table-bordered" id="content-table">
										<%-- 아이디 --%>
										<tbody>
											<tr>
												<th scope="row">계좌명</th>
												<td colspan="3">하나 원픽통장</td>
											</tr>

											<tr>
												<th scope="row">예금주</th>
												<td>홍길동</td>
												<th scope="row">계좌정보</th>
												<td>1011-5154845-5181</td>
											</tr>

											<tr>
												<th scope="row">계좌잔액</th>
												<td>100,000</td>
												<th scope="row">출금가능금액(원)</th>
												<td>100,000</td>
											</tr>

											<tr>
												<th scope="row">최근거래일</th>
												<td>2020-05-20</td>
												<th scope="row">신규일자</th>
												<td>2020-05-20</td>
											</tr>

										</tbody>
									</table>
								</form>
							</div>
						</div>
						<!-- /#wrapper -->
					</section>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</body>
</html>

<!-- 계좌관리 모달창 -->
