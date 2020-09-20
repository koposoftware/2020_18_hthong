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
<link href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.css"
	rel="stylesheet">
<link href="/resources/css/dashboard.css" rel="stylesheet">
<link href="/resources/css/table.css" rel="stylesheet">
<link href="/resources/css/style-dash.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>원픽통장</title>
<style>
.float-right.display-14.opacity-5.font-1 {
	font-weight: 600;
	background-color: none;
	border-radius: 50px;
	height: 40px;
	width: 120px;
}
</style>
<script>
$(document).ready(function() {
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	let balance = ${ onepickInfo.balance };
	let baseMoney = ${ onepickInfo.baseMoney };
	let livingCost = ${ onepickInfo.livingCost };
	let extraMoney = ${ onepickInfo.extraMoney };

	balance = numberWithCommas(balance);
	baseMoney = numberWithCommas(baseMoney);
	livingCost = numberWithCommas(livingCost);
	extraMoney = numberWithCommas(extraMoney);
	
	// text 변경
	$('.balance').text(balance);
	$('.text-white.base').text(baseMoney);
	$('.text-white.living').text(livingCost);
	$('.text-white.extra').text(extraMoney);
})
</script>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active">나의 원픽통장</li>
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/product/onepick/info">하나원픽통장</a></li>
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
									<h5 class="textarea-head">나의 원픽통장</h5>
									<hr class="textarea-head-hr">
									<br>

									<table class="table table-bordered" id="content-table">
										<thead>
											<tr class="table-highlight" id="tr-head">
												<th scope="col" style="text-align: center">예금명</th>
												<th scope="col" style="text-align: center">계좌번호</th>
												<th scope="col" style="text-align: center">신규일</th>
												<th scope="col" style="text-align: center">잔액(원)</th>
											</tr>
										</thead>
										<tbody>
											<tr id="tr-con">
												<td rowspan="2"
													style="text-align: center; vertical-align: middle;">${ onepickInfo.accName }</td>
												<td style="text-align: center">${ onepickInfo.accNo }</td>
												<td style="text-align: center">${ onepickInfo.regDate }

												</td>
												<td style="text-align: center">
													<strong class="balance" style="font-size: 17px;"></strong>
												</td>
											</tr>

											<tr id="tr-btn">
												<td colspan="4" style="text-align: right"><input
													type="button"
													onclick="location.href='${ pageContext.request.contextPath }/banking/transaction'"
													class="btn btn-outline-dark" value="조회"> <input
													type="button"
													onclick="location.href='${ pageContext.request.contextPath }/banking/transfer'"
													class="btn btn-outline-dark" value="이체">
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>


					<!-- ======= Counts Section ======= -->

					<!-- Page Content -->
					<div id="page-content-wrapper">
						<div class="container-fluid">
							<%-- textarea 영역 : 글내용 --%>
							<div class="textarea_wrap">
								<h5 class="textarea-head">원픽 통장 현황</h5>
								<hr class="textarea-head-hr">
								<br>
								<div class="row">
									<div class="col">
										<div class="card gradient-4">
											<div class="card-body">
												<h3 class="card-title text-white">기본비</h3>
												<div class="d-inline-block">
													<h2 class="text-white base"></h2>
													<!-- <p class="text-white mb-0">Jan - March 2019</p> -->
												</div>
												<div>
													<button type="button" value="기본비" data-toggle="modal"
														data-target="#exampleModal" data-whatever="@mdo"
														class="float-right display-14 opacity-5 font-1">
														금액이동 <i class="fas fa-arrow-right"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col">
										<div class="card gradient-2">
											<div class="card-body">
												<h3 class="card-title text-white">생활비</h3>
												<div class="d-inline-block">
													<h2 class="text-white living"></h2>
													<!-- <p class="text-white mb-0">Jan - March 2019</p> -->
												</div>
												<div>
													<button type="button" value="생활비" data-toggle="modal"
														data-target="#exampleModal" data-whatever="@mdo"
														class="float-right display-14 opacity-5 font-1">
														금액이동 <i class="fas fa-arrow-right"></i>
													</button>
												</div>
											</div>
										</div>
									</div>

									<div class="col">
										<div class="card gradient-3">
											<div class="card-body">
												<h3 class="card-title text-white">예비금</h3>
												<div class="d-inline-block">
													<h2 class="text-white extra"></h2>
													<!-- <p class="text-white mb-0">Jan - March 2019</p> -->
												</div>
												<div>
													<button type="button" value="생활비" data-toggle="modal"
														data-target="#exampleModal" data-whatever="@mdo"
														class="float-right display-14 opacity-5 font-1">
														금액이동 <i class="fas fa-arrow-right"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
									<!-- <div class="col">
										<div class="card gradient-2">
											<div class="card-body">
												<h3 class="card-title text-white">투자예정금-삭제예정</h3>
												<div class="d-inline-block">
													<h2 class="text-white">원</h2>
													<p class="text-white mb-0">Jan - March 2019</p>
												</div>
												<div>
													<button value="투자금"
														class="float-right display-14 opacity-5 font-1">
														금액이동 <i class="fas fa-arrow-right"></i>
													</button>
												</div>
											</div>
										</div>
									</div> -->
								</div>

								<!-- 금액이동 모달창 -->
								<div class="bootstrap-modal">
									<div class="modal fade" id="exampleModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-lg" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">원픽 금액이동</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form
													action="${ pageContext.request.contextPath }/product/onepick/transfer"
													method="POST" name="form">
													<div class="modal-body">
														<input type="hidden" name="accNo"
															value="${ onepickInfo.accNo }">
														<table class="table table-bordered" id="content-table">
															<thead class="thead-light">
																<tr>
																	<th scope="col" colspan="4" id="onepick-type"
																		style="text-align: center;"></th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<th scope="row" style="text-align: center;">통장선택</th>
																	<td>
																		<div class="input-group">
																			<select id="sender" name="sender"
																				class="custom-select"
																				aria-label="Example select with button addon">
																				<option selected>통장선택</option>
																				<option class="type" value="base_money">기본금</option>
																				<option class="type" value="living_cost">생활비</option>
																				<option class="type" value="extra_money">예비금</option>
																			</select>
																		</div>
																	</td>
																	<td><i class="fas fa-arrow-right"></i></td>
																	<td>
																		<div class="input-group">
																			<select id="receiver" name="receiver"
																				class="custom-select"
																				aria-label="Example select with button addon">
																				<option selected>통장선택</option>
																				<option class="type" value="base_money">기본금</option>
																				<option class="type" value="living_cost">생활비</option>
																				<option class="type" value="extra_money">예비금</option>
																			</select>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th scope="row" style="text-align: center;">금액</th>
																	<td colspan="3">
																		<div class="input-group mb-3">
																			<input type="text" name="money" class="form-control"
																				placeholder="금액">
																		</div>
																	</td>
																</tr>

																<tr>
																	<th scope="row" style="text-align: center;">메모</th>
																	<td colspan="3">
																		<div class="input-group mb-3">
																			<input type="text" name="memo" class="form-control"
																				placeholder="메모">
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button type="submit" class="class = btn btn-outline-info">금액이동</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
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
	<script src="/resources/plugins/common/common.min.js"></script>
	<script src="/resources/js/custom.min.js"></script>
	<script src="/resources/js/settings.js"></script>
	<script src="/resources/js/gleek.js"></script>
	<script src="/resources/js/styleSwitcher.js"></script>
</body>

</html>