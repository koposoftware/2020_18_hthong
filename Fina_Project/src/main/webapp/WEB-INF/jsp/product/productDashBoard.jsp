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
<link href="/Final-Project/resources/css/table.css" rel="stylesheet">
<title>원픽통장</title>
<script>
	window.onload = function() {
		var t = document.getElementById('t-btn');
		t.onclick = function() {
			location.href = "transfer.do?service=KPBanking";
		}

		var m = document.getElementById('m-btn');
		m.onclick = function() {
			location.href = "editAccInfo.do";
		}
	}
</script>
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
					<li class="breadcrumb-item active">원픽통장 조회</li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/depositSidebar.jsp" />

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
									<h5 class="textarea-head">원픽통장 상세조회</h5>
									<hr class="textarea-head-hr">
									<br>

									<form method="post" name="form">
										<table class="table table-bordered" id="content-table">
											<thead>
												<tr class="table-highlight" id="tr-head">
													<th scope="col" style="text-align: center">예금명</th>
													<th scope="col" style="text-align: center">계좌번호</th>
													<th scope="col" style="text-align: center">신규일</th>
													<th scope="col" style="text-align: center">최종거래일</th>
													<th scope="col" style="text-align: center">잔액(원)</th>
												</tr>
											</thead>
											<tbody>
												<tr id="tr-con">
													<td rowspan="2"
														style="text-align: center; vertical-align: middle;">하나
														원픽통장${ accList.accType }</td>
													<td style="text-align: center">하나은행${ accList.bankNM }</td>
													<td style="text-align: center">1584-8548${ accList.accNO }
														<input type="hidden" name="accNO"
														value="1548-515${ accList.accNO }">
													</td>
													<td style="text-align: center">500,000${ accList.balance }</td>
													<td style="text-align: center">2020-02-02${ accList.regDate }</td>
												</tr>

												<tr id="tr-btn">
													<td colspan="4" style="text-align: right"><input
														type="submit"
														onclick="javascript: form.action='http://localhost:9999/Final-Project/banking/transactionDetails.jsp';"
														class="btn btn-outline-dark" value="조회"> <input
														type="submit"
														onclick="javascript: form.action='http://localhost:9999/Final-Project/banking/transfer.jsp';"
														class="btn btn-outline-dark" value="이체"> 
												</tr>
											</tbody>
											<tr class="table-highlight">
												<td style="text-align: center;" id="sum-title">자유입출금 합계</td>
												<td colspan="4" id="sum-money" style="text-align: right">500,000</td>
											</tr>
										</table>
										
										<%-- button 영역 : 버튼 --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" value="상세조회" class="btn btn-outline-info">
											</div>
										</div>
										
									</form>
								</div>
							</div>
							<%-- button 영역 : 버튼 --%>
						</div>
					</div>
				</section>

				<!-- ======= Counts Section ======= -->
				<section class="counts section-bg">
					<h4>ONE-PICK 포트폴리오 조회</h4>
					<br>
					<div class="container">
						<div class="row">
							<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up">
								<div class="count-box">
									<i class="icofont-simple-smile" style="color: #20b38e;"></i> <span
										data-toggle="counter-up" style="font-size: 30px;">0</span>
									<p>기본금</p>
								</div>
							</div>

							<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
								data-aos-delay="200">
								<div class="count-box">
									<i class="icofont-document-folder" style="color: #c042ff;"></i>
									<span data-toggle="counter-up" style="font-size: 30px;">453,000</span>
									<p>생활비 잔액</p>
								</div>
							</div>

							<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
								data-aos-delay="400">
								<div class="count-box">
									<i class="icofont-live-support" style="color: #46d1ff;"></i> <span
										data-toggle="counter-up" style="font-size: 30px;">1,853,000</span>
									<p>비상금</p>
								</div>
							</div>

							<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
								data-aos-delay="600">
								<div class="count-box">
									<i class="icofont-users-alt-5" style="color: #ffb459;"></i> <span
										data-toggle="counter-up" style="font-size: 30px;">30,000,000</span>
									<p>투자금</p>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- End Counts Section -->


				<!-- ======= Counts Section ======= -->
				<section class="counts section-bg">
					<h4>홍길동님의 재무 목표달성률</h4>
					<br>
					<div class="container">
						<div class="row">
							<div class="col-lg-4 col-md-6 text-center" data-aos="fade-up"
								data-aos-delay="200">
								<div class="count-box">
									<h5>생활비 지출</h5>
									<i class="icofont-document-folder" style="color: #c042ff;"></i>
									<span data-toggle="counter-up" style="font-size: 30px;">87.3</span>
									<h2>%</h2>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 text-center" data-aos="fade-up"
								data-aos-delay="400">
								<div class="count-box">
									<h5>
										소득 대비 <br>비상금<br>적립률
									</h5>
									<i class="icofont-live-support" style="color: #46d1ff;"></i> <span
										data-toggle="counter-up" style="font-size: 30px;">227.4</span>
									<h2>%</h2>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 text-center" data-aos="fade-up"
								data-aos-delay="600">
								<div class="count-box">
									<h5>투자 수익률</h5>
									<i class="icofont-users-alt-5" style="color: #ffb459;"></i> <span
										data-toggle="counter-up" style="font-size: 30px;">10.28</span>
									<h2>%</h2>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- End Counts Section -->


				<!-- ======= Counts Section ======= -->
				<section class="counts section-bg">
					<h4>홍길동님의 재무현황 또래비교</h4>
					<br>
					<div class="container">
						<div class="row">
							<div class="col-lg-4 col-md-6 text-center" data-aos="fade-up"
								data-aos-delay="200">
								<div class="count-box">
									<h5>
										소득 대비 <br>생활비 지출
									</h5>
									<i class="icofont-document-folder" style="color: #c042ff;"></i>
									상위<span data-toggle="counter-up" style="font-size: 30px;">5.4</span>
									<h2>%</h2>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 text-center" data-aos="fade-up"
								data-aos-delay="400">
								<div class="count-box">
									<h5>
										비상금 <br>초과 적립률
									</h5>
									<i class="icofont-live-support" style="color: #46d1ff;"></i> <span
										data-toggle="counter-up" style="font-size: 30px; color: red;">48.5</span>
									<h2>%</h2>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 text-center" data-aos="fade-up"
								data-aos-delay="600">
								<div class="count-box">
									<h5>투자 수익률</h5>
									<i class="icofont-users-alt-5" style="color: #ffb459;"></i> 상위<span
										data-toggle="counter-up" style="font-size: 30px;">32.8</span>
									<h2>%</h2>
								</div>
							</div>
							<div>
								<h5>
									초과 적립된 비상금을 <strong> [ 하나은행 365 적금 ] </strong> 에 투자해 수익률을 높이는 건
									어떨까요?
								</h5>
							</div>
						</div>
					</div>
				</section>
				<!-- End Counts Section -->


			</div>
			<!-- /#page-content-wrapper -->
		</div>
		<!-- /#wrapper -->
	</div>
	<!-- /.row -->

	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>

	<!-- main boot -->
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="/Final-Project/resources/css/vendor/jquery/jquery.min.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/php-email-form/validate.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/jquery-sticky/jquery.sticky.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/venobox/venobox.min.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/counterup/counterup.min.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/Final-Project/resources/css/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="/Final-Project/resources/js/main.js"></script>
</body>

</html>
