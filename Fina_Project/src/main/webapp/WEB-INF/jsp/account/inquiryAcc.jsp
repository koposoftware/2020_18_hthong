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
<title>전체계좌조회 < 조회</title>
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

</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />
	<jsp:include page="/WEB-INF/include/manageAccount.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-sm-8"></div>
			<div class="col-sm-4">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">전체계좌조회</a></li>
					<li class="breadcrumb-item active">조회</li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/inquirySidebar.jsp" />

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
									<h5 class="textarea-head">전체계좌조회</h5>
									<hr class="textarea-head-hr">
									<br>


									<form method="post" name="form">
										<p class="textarea-sub">자유입출금</p>
										<table class="table table-bordered" id="content-table">
											<thead>
												<tr class="table-highlight" id="tr-head">
													<th scope="col" style="text-align: center">예금명</th>
													<th scope="col" style="text-align: center">계좌번호</th>
													<th scope="col" style="text-align: center">계좌종류</th>
													<th scope="col" style="text-align: center">신규일</th>
													<th scope="col" style="text-align: center">잔액(원)</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ accountList }" var="account"
													varStatus="loop">
													<tr id="tr-con">
														<td rowspan="2"
															style="text-align: center; vertical-align: middle;">${ account.accName }</td>
														<td style="text-align: center; vertical-align: middle;">${ account.accNo }</td>
														<td style="text-align: center; vertical-align: middle;">${ account.accType }</td>
														<td style="text-align: center; vertical-align: middle;">${ account.regDate }</td>
														<td style="text-align: center; vertical-align: middle;">${ account.balance }</td>
													</tr>

													<tr id="tr-btn">
														<td colspan="4" style="text-align: right"><input
															type="submit"
															onclick="javascript: form.action='http://localhost:9999/Final-Project/banking/transactionDetails.jsp';"
															class="btn btn-outline-dark" value="조회"> <input
															type="submit"
															onclick="javascript: form.action='http://localhost:9999/Final-Project/banking/transfer.jsp';"
															class="btn btn-outline-dark" value="이체"> <input
															type="button" class="btn btn-outline-dark"
															id="modal_open_btn" value="계좌관리">
													</tr>
												</c:forEach>
											</tbody>
											<tr class="table-highlight">
												<td style="text-align: center;" id="sum-title">자유입출금 합계</td>
												<td colspan="4" id="sum-money" style="text-align: right">500,000</td>
											</tr>
										</table>
									</form>

									<%-- form2 --%>
									<form method="post" name="form">
										<p class="textarea-sub">정기예금/적금/신탁/ISA/개인형IRP</p>
										<table class="table table-bordered" id="content-table">
											<thead>
												<tr class="table-highlight" id="tr-head">
													<th scope="col" style="text-align: center">예금명</th>
													<th scope="col" style="text-align: center">계좌번호</th>
													<th scope="col" style="text-align: center">최종거래일</th>
													<th scope="col" style="text-align: center">만기일</th>
													<th scope="col" style="text-align: center">잔액(원)</th>
												</tr>
											</thead>
											<tbody>
												<tr id="tr-con">
													<td rowspan="2"
														style="text-align: center; vertical-align: middle;">${ accList.accType }</td>
													<td style="text-align: center">${ accList.bankNM }</td>
													<td style="text-align: center">${ accList.accNO }<input
														type="hidden" name="accNO" value="${ accList.accNO }">
													</td>
													<td style="text-align: center">${ accList.balance }</td>
													<td style="text-align: center">${ accList.regDate }</td>
												</tr>

												<tr id="tr-btn">
													<td colspan="4" style="text-align: right"><input
														type="submit"
														onclick="javascript: form.action='transfer.do?service=KPBanking';"
														class="btn btn-outline-dark" value="조회"> <input
														type="submit"
														onclick="javascript: form.action='transfer.do?service=KPBanking';"
														class="btn btn-outline-dark" value="이체"> <input
														type="submit"
														onclick="javascript: form.action='editAccInfo.do';"
														class="btn btn-outline-dark" value="계좌관리">
												</tr>
											</tbody>
											<tr class="table-highlight">
												<td style="text-align: center;" id="sum-title">합계</td>
												<td colspan="4" id="sum-money" style="text-align: right">0</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
							<%-- button 영역 : 버튼 --%>
						</div>
					</div>
				</section>
			</div>
			<!-- /#page-content-wrapper -->
		</div>
		<!-- /#wrapper -->

	</div>
	<!-- /.row -->

	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>

</html>
