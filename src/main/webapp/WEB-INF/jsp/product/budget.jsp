<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="https://kit.fontawesome.com/48c3a06538.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/vc-toggle-switch.css" />
<link href="/resources/css/table.css" rel="stylesheet">
<link href="/resources/css/style-dash.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<title>원픽통장 설정</title>
<style>
.btn-area {
	margin-bottom: 50px;
}

.content-body {
	margin-left: 0px;
}

.ct-chart .ct-label {
	fill: black;
	font-size: 13px;
	font-weight: 600;
}

.card .card-size {
	min-height: 400px;
}

#banner-title {
	position: absolute;
	top: 40%;
	left: 35%;
}

#banner-title .animated.fadeInDown {
	font-size: 40px;
	font-weight: 800;
	color: #2F4F4F;
}

.carousel-item.active:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: inherit;
	z-index: -1;
	filter: blur(6px);
	-webkit-filter: blur(6px);
	-moz-filter: blur(6px);
	-o-filter: blur(6px);
	filter: url(#blur);
}

.sub-nav {
	margin-bottom: 40px;
}

#DataTables_Table_0_length {
	display: none;
}

#DataTables_Table_1_length {
	display: none;
}

#DataTables_Table_0_filter {
	display: none;
}

#DataTables_Table_1_filter {
	display: none;
}

#DataTables_Table_0_info {
	display: none;
}

#DataTables_Table_1_info {
	display: none;
}

#DataTables_Table_0_paginate {
	display: none;
}

#DataTables_Table_1_paginate {
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	let budget = ${ onepickInfo.totalBudget };
	let living = ${ autoInfo.moneyToLiving };
	let extra = ${ autoInfo.moneyToExtra };
	let budgetSum = ${ budgetSum };
	
	let totalBudget = numberWithCommas(budget);
	let living_money = numberWithCommas(living);
	let extra_money = numberWithCommas(extra);
	
	let cal_budget = numberWithCommas(parseInt(living + extra));
	budgetSum = numberWithCommas(budgetSum);
	
	console.log(budgetSum);
	
	// text 변경
	$('.cal_budget').text(cal_budget);
	$('.total_budget').text(totalBudget);
	$('.living_money').text(living_money);
	$('.extra_money').text(extra_money);
	$('.fixed_sum').text(budgetSum);
})
</script>
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/product/onepick/budget">나의 예산</a></li>
					<li class="breadcrumb-item active"><a
						href="${pageContext.request.contextPath }/product/onepick/info">하나원픽통장</a></li>
				</ol>
			</div>
		</div>

		<!-- banner****************************** -->
		<div class="carousel-item active"
			style="background-image: url('${pageContext.request.contextPath }/resources/images/dashboard_main.jpg'); height: 200px; margin-bottom: 50px;">
			<div id="banner-title">
				<h2 class="animated fadeInDown">Financial Report</h2>
			</div>
		</div>

		<!-- tab****************************** -->
		<div class="sub-nav">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath }/product/onepick/budget">나의
						예산</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/product/onepick/dashboard">개인분석</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/product/onepick/analysis">또래분석</a>
				</li>
			</ul>
		</div>

		<!-- ******content-body******* -->
		<div class="content-body">
			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******한달 예산****** -->
				<div class="col-lg col-md-6">
					<div class="card card-widget">
						<div class="card-body">
							<div class="row">
								<div class="col" style="text-align: left;">
									<h4 style="margin-bottom: 5px;">한 달 예산</h4>
									<p style="font-size: 14px; color: grey;">월 급여액을 입력하면 정확한
										예산 설정이 가능합니다</p>
								</div>
								<div class="col" style="text-align: right; margin-top: 0px; margin-right: 150px;">
									<strong class="total_budget" style="font-size: 35px;"></strong>  원
								</div>
							</div>
							<div class="col" style="text-align: right; margin-top: 0px;">
								<div class="bootstrap-badge">
									<span class="badge badge-pill badge-primary" onclick="location.href='${ pageContext.request.contextPath }/product/onepick/budgetEdit'" style="cursor: pointer;">
										예산 설정  &nbsp;<i class="fas fa-arrow-right"></i>
									</span> 
                               	</div>
							</div>
						</div>
					</div>
				</div>
				<!-- *******#/한달 예산****** -->
			</div>
			<!-- ******#/content-row******* -->
			
			
			

			<!-- ******content-row******* -->
			<div class="row">

				<!-- *******이번달 고정지출****** -->
				<div class="col-lg">
					<div class="card card-widget">
						<div class="card-body card-size">
							<h4 id="tableTitle">고정지출</h4>
							<p style="font-size: 14px; color: grey;">기본금에서 매달 자동이체로 빠져나가는
								고정지출입니다</p>
							<div class="mt-4">
								<div class="table-responsive" id="fixed-table">
									<table class="table table-striped table-bordered zero-configuration">
										<thead>
											<tr>
												<th style="width: 10%;">구분</th>
												<th style="width: 20%;">예산명</th>
												<th style="width: 20%;">이체일</th>
												<th style="width: 20%;">이체금액</th>
											</tr>
										</thead>
										<tbody id="append-area">
											<c:forEach items="${ budgetList }" var="budget"
												varStatus="loop">
												<tr>
													<td>${ budget.category }</td>
													<td>${ budget.budgetName }</td>
													<td>매달 ${ budget.setDate } 일</td>
													<td><fmt:formatNumber value="${ budget.budget }" type="number" /></td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr style="background-color: white;">
												<th colspan="3">합계</th>
												<th><strong class="fixed_sum" style="font-size: 18px;"></strong></th>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
							<div class="col" style="text-align: right; margin-top: 0px;">
								<div class="bootstrap-badge">
									<span class="badge badge-pill badge-primary" onclick="location.href='${ pageContext.request.contextPath }/product/onepick/budgetEdit'" style="cursor: pointer;">
										예산 설정  &nbsp;<i class="fas fa-arrow-right"></i>
									</span> 
                               	</div>
							</div>
						</div>
						<!-- #/ container -->
					</div>
				</div>
				<!-- *******#/이번달 고정지출****** -->
			</div>
			<!-- ******#/content-row******* -->

			
			
			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******주간 예산 목표 달성률******* -->
				<div class="col-lg">
					<div class="card card-widget">
						<div class="card-body">
							<h4 id="tableTitle">자동입금</h4>
							<p style="font-size: 14px; color: grey;">기본금에서 생활비/예비금으로 매달
								자동으로 금액이동 설정이 가능합니다</p>
							<div class="mt-4">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th colspan="3"
													style="text-align: center; background-color: rgb(233, 236, 239);">
													총 예산 <strong class="total_budget" style="font-size: 25px;">
													</strong> 원 중 <strong class="cal_budget" style="color: blue; font-size: 25px;"></strong> 원
												</th>
											</tr>
											<tr><th colspan="3"></th>
											</tr>
											<tr>
												<th style="width: 40%;">금액이동</th>
												<th style="width: 30%;">예산금액</th>
												<th style="width: 30%;">이체일</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>기본금 <i class="fas fa-arrow-right"></i> 생활비
												</td>
												<td>
													<strong class="living_money" style="font-size: 18px;"></strong> 원
												</td>
												<td>
													<strong class="extra_date" style="font-size: 15px;">매달 ${ autoInfo.dateToLiving } 일</strong><br>
												</td>
											</tr>
											<tr>
												<td>기본금 <i class="fas fa-arrow-right"></i> 예비금
												</td>
												<td><strong class="extra_money" style="font-size: 18px;"></strong> 원</td>
												<td>
													<strong class="extra_date" style="font-size: 15px;">매달 ${ autoInfo.dateToExtra } 일</strong><br>
												</td>
											</tr>
										</tbody>
										<tfoot>
										</tfoot>
									</table>
								</div>
							</div>
							<div class="col" style="text-align: right; margin-top: 0px;">
								<div class="bootstrap-badge">
									<span class="badge badge-pill badge-primary" onclick="location.href='${ pageContext.request.contextPath }/product/onepick/budgetEdit'" style="cursor: pointer;">
										예산 설정  &nbsp;<i class="fas fa-arrow-right"></i>
									</span> 
                               	</div>
							</div>
						</div>
					</div>

				</div>
				<!-- *******#/주간 예산 목표 달성률******* -->
			</div>
			<!-- ******#/content-row******* -->
			<div class="btn-area" style="text-align: center; margin-top: 0px;">
				<button type="button" class="btn btn-lg btn-outline-info "
					onclick="check('modify')">예산 수정</button>
			</div>
		</div>
		<!-- ****** #/content-body******* -->
	</div>

	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>
</body>
<script src="/resources/plugins/common/common.min.js"></script>
<script src="/resources/js/settings.js"></script>
<script src="/resources/js/styleSwitcher.js"></script>
<script src="/resources/plugins/tables/js/jquery.dataTables.min.js"></script>
<script
	src="/resources/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
</html>
