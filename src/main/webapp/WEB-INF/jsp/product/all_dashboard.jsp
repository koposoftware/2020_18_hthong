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
<link rel="stylesheet" href="/resources/css/vendor/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="/resources/css/vendor/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<link href="css/style.css" rel="stylesheet">
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
			<!--**********************************
            Content body start
        ***********************************-->
			<div class="content-body">

				<div class="row page-titles mx-0">
					<div class="col p-md-0">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
							<li class="breadcrumb-item active"><a
								href="javascript:void(0)">Home</a></li>
						</ol>
					</div>
				</div>
				<!-- row -->

				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Advanced Smil Animation</h4>
									<div id="smil-animations" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Simple line chart</h4>
									<div id="simple-line-chart" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Line Scatter Diagram</h4>
									<div id="scatter-diagram" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Line chart with tooltips</h4>
									<div id="line-chart-tooltips"
										class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Line chart with area</h4>
									<div id="chart-with-area" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Bi-polar Line chart with area only</h4>
									<div id="bi-polar-line" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">SVG Path animation</h4>
									<div id="svg-animation" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Line Interpolation / Smoothing</h4>
									<div id="line-smoothing" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Different configuration for
										different series</h4>
									<div id="different-series" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">SVG Animations chart</h4>
									<div id="svg-dot-animation" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Bi-polar bar chart</h4>
									<div id="bi-polar-bar" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Overlapping bars on mobile</h4>
									<div id="overlapping-bars" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Multi-line labels</h4>
									<div id="multi-line-chart" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Stacked bar chart</h4>
									<div id="stacked-bar-chart" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Horizontal bar chart</h4>
									<div id="horizontal-bar-chart"
										class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Extreme responsive configuration</h4>
									<div id="extreme-chart" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Distributed series</h4>
									<div id="distributed-series" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Label placement</h4>
									<div id="label-placement-chart"
										class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Animating a Donut with Svg.animate</h4>
									<div id="animating-donut" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Simple pie chart</h4>
									<div id="simple-pie"
										class="ct-chart ct-golden-section simple-pie-chart-chartist"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Pie chart with custom labels</h4>
									<div id="pie-chart" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Gauge chart</h4>
									<div id="gauge-chart" class="ct-chart ct-golden-section"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- #/ container -->
			</div>
			<!--**********************************
            Content body end
        ***********************************-->


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

	<!--**********************************
        Scripts
    ***********************************-->
	<script src="/resources/css/vendor/plugins/common/common.min.js"></script>
	<script src="/resources/js/dashboard/custom.min.js"></script>
	<script src="/resources/js/dashboard/settings.js"></script>
	<script src="/resources/js/dashboard/gleek.js"></script>
	<script src="/resources/js/dashboard/styleSwitcher.js"></script>

	<script src="/resources/css/vendor/plugins/chartist/js/chartist.min.js"></script>
	<script
		src="/resources/css/vendor/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
	<script src="/resources/js/dashboard/plugins-init/chartist.init.js"></script>
</body>

</html>
