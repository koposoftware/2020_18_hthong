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
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/favicon.png">
<!-- Custom Stylesheet -->
<link rel="stylesheet"
	href="/resources/css/vendor/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="/resources/css/vendor/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<link href="/resources/css/style-dash.css" rel="stylesheet">
<title>원픽통장</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
.content-body {
	margin-left: 0px;
}

.card-body {
	height: 500px;
}

#weekly-budget {
	height: 400px;
}

.ct-chart .ct-label {
	fill: black;
	font-size: 13px;
	font-weight: 600;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">원픽
							대시보드</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">Home</a></li>
				</ol>
			</div>
		</div>
		<header class="cs-header">
			<a href="/" title="Bootstrap templates and themes"
				class="cs-header-logo"> <img
				src="images/hackerthemes-logo-bright.svg" class="ht-logo"
				alt="Bootstrap Templates and Themees" width="188">
			</a>

			<h1 class="cs-header-title">Bootstrap 4 Cheat Sheet</h1>
			<h3 class="cs-header-subline">An interactive list of Bootstrap
				classes for version 4.3.1</h3>
		</header>

		<!-- ****************************** -->
		<div class="content-body">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="card card-widget">
						<div class="card-body">
							<h5 class="text-muted" id="chartTitle">이번달 예산 계획 현황</h5>
							<h2 class="mt-4">3,000,000원</h2>
							<span>총 예산</span>
							<div class="mt-4">
								<div id="animating-donut" class="ct-chart ct-golden-section"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="card card-widget">
						<div class="card-body">
							<h5 class="text-muted">이번달 예산 목표 달성률</h5>
							<h2 class="mt-4">80%</h2>
							<span>2020-09-02</span>
							<div class="mt-4">
								<h4>50</h4>
								<h6>
									Online Order <span class="pull-right">50%</span>
								</h6>
								<div class="progress mb-3" style="height: 7px">
									<div class="progress-bar bg-primary" style="width: 30%;"
										role="progressbar">
										<span class="sr-only">30% Order</span>
									</div>
								</div>
							</div>
							<div class="mt-4">
								<h4>50</h4>
								<h6 class="m-t-10 text-muted">
									Offline Order <span class="pull-right">50%</span>
								</h6>
								<div class="progress mb-3" style="height: 7px">
									<div class="progress-bar bg-success" style="width: 50%;"
										role="progressbar">
										<span class="sr-only">50% Order</span>
									</div>
								</div>
							</div>
							<div class="mt-4">
								<h4>20</h4>
								<h6 class="m-t-10 text-muted">
									Cash On Develery <span class="pull-right">20%</span>
								</h6>
								<div class="progress mb-3" style="height: 7px">
									<div class="progress-bar bg-warning" style="width: 40%;"
										role="progressbar">
										<span class="sr-only">20% Order</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- /# column -->
		<div class="col-lg-13">
			<div class="card">
				<div class="card-body" id="weekly-budget">
					<h5 class="text-muted">주간 예산 목표 달성률</h5>
					<br>
					<div class="table-responsive">
						<table class="table header-border table-hover verticle-middle">
							<thead>
								<tr>
									<th scope="col" style="width: 6%">주차</th>
									<th scope="col" style="width: 10%">예산 금액</th>
									<th scope="col" style="width: 10%">지출 금액</th>
									<th colspan="2" scope="col" style="text-align: center;">지출/예산</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>1</th>
									<td>200,000원</td>
									<td>180,000원</td>
									<td style="text-align: right; width: 25%;">
										<div class="progress" style="height: 10px;">
											<div class="progress-bar gradient-1" style="width: 70%;"
												role="progressbar">
												<span class="sr-only">70% Complete</span>
											</div>
										</div>
									</td>
									<td style="text-align: center; width: 8%;"><span
										class="label gradient-1 btn-rounded">70%</span></td>
								</tr>
								<tr>
									<th>2</th>
									<td>200,000원</td>
									<td>250,000원</td>
									<td>
										<div class="progress" style="height: 10px">
											<div class="progress-bar gradient-2" style="width: 70%;"
												role="progressbar">
												<span class="sr-only">70% Complete</span>
											</div>
										</div>
									</td>
									<td style="text-align: center;"><span
										class="label btn-rounded gradient-2">70%</span></td>
								</tr>
								<tr>
									<th>3</th>
									<td>200,000원</td>
									<td>140,000원</td>
									<td>
										<div class="progress" style="height: 10px">
											<div class="progress-bar gradient-3" style="width: 70%;"
												role="progressbar">
												<span class="sr-only">70% Complete</span>
											</div>
										</div>
									</td>
									<td style="text-align: center;"><span
										class="label btn-rounded gradient-3">70%</span></td>
								</tr>
								<tr>
									<th>4</th>
									<td>200,000원</td>
									<td>120,000원</td>
									<td>
										<div class="progress" style="height: 10px">
											<div class="progress-bar gradient-8" style="width: 70%;"
												role="progressbar">
												<span class="sr-only">70% Complete</span>
											</div>
										</div>
									</td>
									<td style="text-align: center;"><span
										class="label gradient-8 btn-rounded">70%</span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>


	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>

	<!-- main boot -->
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!--**********************************
        Scripts
    ***********************************-->
	<script src="/resources/css/vendor/plugins/chartist/js/chartist.min.js"></script>
	<script
		src="/resources/css/vendor/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>


	<script>
		//Animating a Donut with Svg.animate

		var chart = new Chartist.Pie('#animating-donut', {
			series : [ 92, 80, 68, 60 ],
			labels : [ '고정지출', '생활비', '예비금', '투자예정금' ]
		}, {
			donut : true,
			showLabel : true,
			plugins : [ Chartist.plugins.tooltip() ]
		});

		chart.on('draw', function(data) {
			if (data.type === 'slice') {
				// Get the total path length in order to use for dash array animation
				var pathLength = data.element._node.getTotalLength();

				// Set a dasharray that matches the path length as prerequisite to animate dashoffset
				data.element.attr({
					'stroke-dasharray' : pathLength + 'px ' + pathLength + 'px'
				});

				// Create animation definition while also assigning an ID to the animation for later sync usage
				var animationDefinition = {
					'stroke-dashoffset' : {
						id : 'anim' + data.index,
						dur : 1000,
						from : -pathLength + 'px',
						to : '0px',
						easing : Chartist.Svg.Easing.easeOutQuint,
						// We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
						fill : 'freeze'
					}
				};

				// If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
				if (data.index !== 0) {
					animationDefinition['stroke-dashoffset'].begin = 'anim'
							+ (data.index - 1) + '.end';
				}

				// We need to set an initial value before the animation starts as we are not in guided mode which would do that for us
				data.element.attr({
					'stroke-dashoffset' : -pathLength + 'px'
				});

				// We can't use guided mode as the animations need to rely on setting begin manually
				// See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
				data.element.animate(animationDefinition, false);
			}
		});
	</script>
</body>
</html>
