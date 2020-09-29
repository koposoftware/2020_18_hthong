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
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<title>계좌관리 < 계좌관리</title>
<style>
#content {
	min-height: 500px;
}

#content-table {
	text-align: center;
}

.small {
	font-size: 15px;
}

#account-list {
	margin-bottom: 50px;
}
</style>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">계좌관리</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="editAccInfo.do">계좌관리</a></li>
			<li class="breadcrumb-item active">계좌 수정</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/manageSidebar.jsp" />

			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<section id="content">
					<div class="d-flex" id="wrapper">

						<!-- Page Content -->
						<div id="page-content-wrapper">
							<div class="container-fluid">
								<%-- textarea 영역 : 글내용 --%>
								<div class="textarea_wrap">
									<h4>계좌관리</h4>
									<p class="small">계좌관리는 KP은행 계좌만 가능합니다.</p>

									<%-- 조회할 계좌번호 선택 --%>
									<div id="account-list">
										<form action="<%=request.getContextPath()%>/detailAccInfo.do"
											method="POST" name="form">
											<select id="accNO" name="accNO">
												<option value="" selected disabled>수정/해지 계좌선택</option>
												<c:forEach items="${ accountList }" var="accList"
													varStatus="loop">
													<option class="accNo" value=${ accList.accNO }>[
														${ accList.bankNM } ] ${ accList.accNO }</option>
												</c:forEach>
											</select> <input type="submit" class="btn btn-outline-success"
												id="searchDetail" value="조회">
										</form>
									</div>
									<%-- ./조회할 계좌번호 선택 --%>

									<%-- 계좌번호 조회 클릭 시 나타나는 상세정보 --%>
									<form method="post" name="detailForm">
										<table class="table table-hover" id="content-table">
											<thead>
												<tr id="tr-head">
													<th scope="col">예금명</th>
													<th scope="col">은행</th>
													<th scope="col">별칭</th>
													<th scope="col">계좌번호</th>
													<th scope="col">잔액(원)</th>
													<th scope="col">신규일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ accDetail }" var="accDetail"
													varStatus="loop">
													<tr>
														<th rowspan="2" scope="row">
															<input type="hidden" name="paramAccType" value="${ accDetail.accType }" >
															${ accDetail.accType}
														</th>
														<td scope="row">
															<input type="hidden" name="paramBankNM" value="${ accDetail.bankNM }" >
															${ accDetail.bankNM }
														</td>
														<td scope="row">
															<input type="hidden" name="paramAccNickname" value="${ accDetail.accNickname }" >
															${ accDetail.accNickname }
														</td>
														<td scope="row">
															<input type="hidden" name="paramAccNO" value="${ accDetail.accNO }" >
															${ accDetail.accNO }
														</td>
														<td scope="row">
															<input type="hidden" name="paramBalance" value="${ accDetail.balance }" >
															${ accDetail.balance }
														</td>
														<td scope="row">
															${ accDetail.regDate }
														</td>
													</tr>

													<tr id="tr-btn">
														<td colspan="5"><input type="submit"
															onclick="javascript: form.action='editAccInfoForm.do';"
															class="btn btn-outline-success" value="별칭수정"> <input
															type="submit"
															onclick="javascript: form.action='closeAccount.do';"
															class="btn btn-outline-success" value="계좌해지"></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</form>
									<%-- ./계좌번호 조회 클릭 시 나타나는 상세정보 --%>

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
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
