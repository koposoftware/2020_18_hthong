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
	href="/resources/images/favicon.png">
<!-- Custom Stylesheet -->
<link rel="stylesheet"
	href="/resources/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<link href="/resources/css/style-dash.css" rel="stylesheet">
<title>원픽통장</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
.content-body {
	margin-left: 0px;
}

.ct-chart .ct-label {
	fill: black;
	font-size: 13px;
	font-weight: 600;
}

.card.card-widget.card-size {
	min-height: 450px;
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

#DataTables_Table_0_filter {
	display: none;
}

#DataTables_Table_0_info {
	display: none;
}

#DataTables_Table_0_paginate {
	display: none;
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

		<!-- banner****************************** -->
		<div class="carousel-item active"
			style="background-image: url('${pageContext.request.contextPath }/resources/images/dashboard_main.jpg'); height: 400px; margin-bottom: 50px;">
			<div id="banner-title">
				<h2 class="animated fadeInDown">Financial Report</h2>
			</div>
		</div>

		<!-- tab****************************** -->
		<jsp:include page="/WEB-INF/include/budgetTab.jsp" />

		<!-- ******content-body******* -->
		<div class="content-body">

			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******나이대 비교****** -->
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">또래 예산 구성</h4>
							<p>하나은행 20대 손님들의 예산비율 평균입니다.</p>
							<div id="multi-line-chart" class="ct-chart ct-golden-section"></div>
						</div>
					</div>
				</div>
				<!-- *******#/나이대 비교****** -->
				
				<!-- *******예산별 비교****** -->
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">자산 규모에 따른 예산 구성</h4>
							<p>유사한 금융 자산규모를 가진 하나은행 손님들의 예산 구성입니다.</p>
							<div id="multi-line-chart2" class="ct-chart ct-golden-section"></div>
						</div>
					</div>
				</div>
				<!-- *******#/예산별 비교****** -->
			</div>
			<!-- ******#/content-row******* -->
			
			
			
			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******나 vs 또래****** -->
				<div class="col-lg-6">
					<div class="card card-widget">
						<div class="card-body">
							<h2 class="text-muted" id="chartTitle">나 vs 또래</h2>
							<h5 class="text-muted" id="chartTitle">하나은행 20대 손님 대비 예비금 비율이 14% 더 높습니다.</h5>
							<div class="mt-4"></div>
						</div>
					</div>
				</div>
				<!-- *******#/나 vs 또래****** -->
				
				<!-- *******고객별 상품추천****** -->
				<div class="col-lg-6">
					<div class="card card-widget">
						<div class="card-body">
							<h2 class="text-muted" id="chartTitle">추천 상품</h2>
							<h5 class="text-muted" id="chartTitle">180만원의 여유금으로 [하나원큐적금]에 투자하는 것은 어떻까요?</h5>
							<div class="mt-4"></div>
						</div>
					</div>
				</div>
				<!-- *******#/고객별 상품추천****** -->
			</div>
			<!-- ******#/content-row******* -->



			<!-- ******content-row******* -->
			<div class="row">
				<div class="col-lg">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">돈모으기 예상 시나리오</h4>
							<div id="line-chart-tooltips" class="ct-chart ct-golden-section"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- ******#/content-row******* -->



		</div>
		<!-- ****** #/content-body******* -->
	</div>


	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>
	<!-- main boot -->
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>

<!--**********************************
        Scripts
    ***********************************-->
<script src="/resources/css/vendor/plugins/chartist/js/chartist.min.js"></script>
<script
	src="/resources/css/vendor/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>

<script>
	//Multi-line labels1
	new Chartist.Bar('#multi-line-chart', {
		labels : [ '고정비', '투자금', '생활비', '예비금' ],
		series : [ [ 60000, 40000, 80000, 70000 ],
				[ 40000, 30000, 70000, 65000 ] ]
	}, {
		seriesBarDistance : 10,
		axisX : {
			offset : 60
		},
		axisY : {
			offset : 80,
			labelInterpolationFnc : function(value) {
				return value + ' CHF'
			},
			scaleMinSpace : 15
		},
		plugins : [ Chartist.plugins.tooltip() ]
	});
	
	//Multi-line labels2
	new Chartist.Bar('#multi-line-chart2', {
		labels : [ '고정비', '투자금', '생활비', '예비금' ],
		series : [ [ 60000, 40000, 80000, 70000 ],
				[ 40000, 30000, 70000, 65000 ] ]
	}, {
		seriesBarDistance : 10,
		axisX : {
			offset : 60
		},
		axisY : {
			offset : 80,
			labelInterpolationFnc : function(value) {
				return value + ' CHF'
			},
			scaleMinSpace : 15
		},
		plugins : [ Chartist.plugins.tooltip() ]
	});
</script>
<script>
//Line chart with tooltips

new Chartist.Line('#line-chart-tooltips', {
  labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
  series: [
    {
      name: '전문가 추천 포트폴리오',
      data: [1, 2, 3, 5, 9, 13, 16, 20, 26, 31]
    },
    {
      name: '현재 나의 포트폴리오',
      data: [1, 1.618, 2.618, 4.236, 5.854, 8.09, 10, 12.2, 13.6, 15]
    }
  ]
},
    {
  plugins: [
    Chartist.plugins.tooltip()
  ]
}
);

var $chart = $('#line-chart-tooltips');

var $toolTip = $chart
  .append('<div class="tooltip"></div>')
  .find('.tooltip')
  .hide();

$chart.on('mouseenter', '.ct-point', function() {
  var $point = $(this),
    value = $point.attr('ct:value'),
    seriesName = $point.parent().attr('ct:series-name');
  $toolTip.html(seriesName + '<br>' + value).show();
});

$chart.on('mouseleave', '.ct-point', function() {
  $toolTip.hide();
});

$chart.on('mousemove', function(event) {
  $toolTip.css({
    left: (event.offsetX || event.originalEvent.layerX) - $toolTip.width() / 2 - 10,
    top: (event.offsetY || event.originalEvent.layerY) - $toolTip.height() - 40
  });
});
</script>


<!--**********************************
        Scripts
    ***********************************-->
<script src="/resources/plugins/common/common.min.js"></script>
<script src="/resources/js/custom.min.js"></script>
<script src="/resources/js/settings.js"></script>
<script src="/resources/js/gleek.js"></script>
<script src="/resources/js/styleSwitcher.js"></script>

<script src="/resources/plugins/chartist/js/chartist.min.js"></script>
<script
	src="/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
</html>
