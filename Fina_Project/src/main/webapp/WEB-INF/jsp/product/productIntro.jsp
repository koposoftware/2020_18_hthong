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
<script src="https://kit.fontawesome.com/48c3a06538.js"></script>
<link
	href="/Final-Project/resources/fonts/font-awesome-4.7.0/css/font-awesome.css"
	rel="stylesheet">
<link href="/Final-Project/resources/css/dashboard.css" rel="stylesheet">
<title>원픽통장</title>
<style>
.float-right.display-14.opacity-5.font-1 {
	font-weight: 600;
	background-color: none;
	border-radius: 50px;
	height: 40px;
	width: 120px;
}

.float-right {
	
}
</style>
<!-- <script>
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
</script> -->
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
					<li class="breadcrumb-item"><a href="#">예금 </a></li>
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
												<input type="submit" value="상세조회"
													class="btn btn-outline-info">
												<h6>상세조회 클릭시 ajax</h6>
											</div>
										</div>

									</form>
								</div>
							</div>
							<%-- button 영역 : 버튼 --%>
						</div>
					</div>


					<!-- ======= Counts Section ======= -->
					<form method="post" name="form">

						<!-- Page Content -->
						<div id="page-content-wrapper">
							<div class="container-fluid">
								<%-- textarea 영역 : 글내용 --%>
								<div class="textarea_wrap">
									<p class="textarea-sub">원픽 통장 현황</p>
									<hr class="textarea-head-hr">
									<br>
									<p class="textarea-head-ex">?(모달창으로 통장쪼개기 소개)</p>
									<h3>금액이동 클릭스 모달창 -> 해당 클릭 통장에서 on 되어있는 통장으로 이동</h3>
									<div class="row">
										<div class="col">
											<div class="card gradient-1">
												<div class="card-body">
													<h3 class="card-title text-white">기본비</h3>
													<div class="d-inline-block">
														<h2 class="text-white">2,000,000원</h2>
														<!-- <p class="text-white mb-0">Jan - March 2019</p> -->
													</div>
													<div>
														<button class="float-right display-14 opacity-5 font-1">
															금액이동 <i class="fas fa-arrow-right"></i>
														</button>
													</div>
												</div>

											</div>
										</div>

										<div class="col">
											<div class="card gradient-4">
												<div class="card-body">
													<h3 class="card-title text-white">생활비</h3>
													<div class="d-inline-block">
														<h2 class="text-white">700,000원</h2>
														<!-- <p class="text-white mb-0">Jan - March 2019</p> -->
													</div>
													<div>
														<button class="float-right display-14 opacity-5 font-1">
															금액이동 <i class="fas fa-arrow-right"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col">
											<div class="card gradient-3">
												<div class="card-body">
													<h3 class="card-title text-white">예비금</h3>
													<div class="d-inline-block">
														<h2 class="text-white">1,000,000원</h2>
														<!-- <p class="text-white mb-0">Jan - March 2019</p> -->
													</div>
													<div>
														<button class="float-right display-14 opacity-5 font-1">
															금액이동 <i class="fas fa-arrow-right"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
										<div class="col">
											<div class="card gradient-2">
												<div class="card-body">
													<h3 class="card-title text-white">투자예정금</h3>
													<div class="d-inline-block">
														<h2 class="text-white">200,000원</h2>
														<!-- <p class="text-white mb-0">Jan - March 2019</p> -->
													</div>
													<div>
														<button class="float-right display-14 opacity-5 font-1">
															금액이동 <i class="fas fa-arrow-right"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
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
</body>

</html>
