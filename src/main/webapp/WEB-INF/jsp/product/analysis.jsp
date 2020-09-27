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
	href="/resources/images/fav.png">
<!-- Custom Stylesheet -->
<link rel="stylesheet"
	href="/resources/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<link href="/resources/css/style-dash.css" rel="stylesheet">
<title>원픽통장</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/48c3a06538.js"></script>
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
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/product/onepick/analysis">또래분석</a></li>
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
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/product/onepick/budget">나의
						예산</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/product/onepick/dashboard">개인분석</a>
				</li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath }/product/onepick/analysis">또래분석</a>
				</li>
			</ul>
		</div>

		<!-- ******content-body******* -->
		<div class="content-body">

			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******나이대 비교****** -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">또래 예산 구성</h4>
							<p style="font-size: 13px; color: grey;">하나은행 ${analyAge.age}대 손님들의 예산비율 평균</p>
							<div id="multi-line-chart" class="ct-chart ct-golden-section"></div>
						</div>
					</div>
				</div>
				<!-- *******#/나이대 비교****** -->
				
				<!-- *******예산별 비교****** -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">예산 규모에 따른 구성</h4>
							<p style="font-size: 13px; color: grey;">유사한 예산규모를 가진 하나은행 손님들의 항목별 예산</p>
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
					<div class="card card-widget" style="min-hight: 180px;">
						<div class="card-body">
							<h4 class="text-muted" id="chartTitle">나 vs 또래</h4>
							<c:if test="${ flag == 'case1' }">
								<p id="chartTitle" style="color: black; font-size: 20px; margin-bottom: 0px;">하나은행 <strong>[ ${analyAge.age}대 ]</strong> 손님 대비 </p>
								<p id="chartTitle" style="color: black; font-size: 20px;">예비금 비율이 <Strong> [ ${ extraRatio }% ] </Strong> 더 높습니다.</p>
							</c:if>
							<c:if test="${ flag == 'case2' }">
								<p id="chartTitle" style="color: black; font-size: 20px; margin-bottom: 0px;">하나은행 <strong>[ ${analyAge.age}대 ]</strong> 손님 대비 </p>
								<p id="chartTitle" style="color: black; font-size: 20px;">예비금 비율이 <Strong> [ ${ extraRatio }% ] </Strong> 낮습니다.</p>
							</c:if>
							<div class="bootstrap-badge">
                            </div>
						</div>
					</div>
				</div>
				<!-- *******#/나 vs 또래****** -->
				
				<!-- *******고객별 상품추천****** -->
				<div class="col-lg-6">
					<div class="card card-widget" style="min-hight: 180px;">
						<div class="card-body">
							<c:if test="${ flag == 'case1' }">
								<h4 class="text-muted" id="chartTitle">추천 상품</h4>
								<p id="chartTitle" style="color: black; font-size: 20px; margin-bottom: 0px;">남는 예비금으로 <strong>[ 하나원큐적금 ]</strong>에 </p>
								<p id="chartTitle" style="color: black; font-size: 20px;">투자하는 것은 어떨까요?</p>
							</c:if>
							<c:if test="${ flag == 'case2' }">
								<h4 class="text-muted" id="chartTitle">전문가 조언</h4>
								<p id="chartTitle" style="color: black; font-size: 15px; margin-bottom: 0px;">불확실한 미래를 위해 </p>
								<p id="chartTitle" style="color: black; font-size: 15px;">예비금 비율을 늘리는 것은 어떨까요?</p>
								<div class="bootstrap-badge">
									<span class="badge badge-secondary" onclick="location.href='${ pageContext.request.contextPath }/product/onepick/budget'" style="cursor: pointer;">
										예산 설정  &nbsp;<i class="fas fa-arrow-right"></i>
									</span> 
                                </div>
							</c:if>
						</div>
					</div>
				</div>
				<!-- *******#/고객별 상품추천****** -->
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
	let my_buget_a = ${onepickInfo.baseMoney};
	let my_buget_b = ${autoInfo.moneyToLiving};
	let my_buget_c = ${autoInfo.moneyToExtra};
	let avg_buget_a = ${analyAge.fixedCostAge};
	let avg_buget_b = ${analyAge.livingCostAge};
	let avg_buget_c = ${analyAge.extraMoneyAge};

	
	//Multi-line labels1
	new Chartist.Bar('#multi-line-chart', {
		labels : [ '고정비', '생활비', '예비금' ],
		series : [ [ my_buget_a, my_buget_b, my_buget_c ],
				[ avg_buget_a, avg_buget_b, avg_buget_c ] ]
	}, {
		seriesBarDistance : 10,
		axisX : {
			offset : 60
		},
		axisY : {
			offset : 80,
			labelInterpolationFnc : function(value) {
				return value + ''
			},
			scaleMinSpace : 15
		},
		plugins : [ Chartist.plugins.tooltip() ]
	});
	
	let my_compare_a = ${onepickInfo.baseMoney};  
	let my_compare_b = ${autoInfo.moneyToLiving}; 
	let my_compare_c = ${autoInfo.moneyToExtra}; 
	let avg_compare_a = ${analySeg.fixedCostSeg}; 
	let avg_compare_b = ${analySeg.livingCostSeg};
	let avg_compare_c = ${analySeg.extraMoneySeg};
	
	//Multi-line labels2
	new Chartist.Bar('#multi-line-chart2', {
		labels : [ '고정비', '생활비', '예비금' ],
		series : [ [ my_compare_a, my_compare_b, my_compare_c ],
				[ avg_compare_a, avg_compare_b, avg_compare_c ] ]
	}, {
		seriesBarDistance : 10,
		axisX : {
			offset : 60
		},
		axisY : {
			offset : 80,
			labelInterpolationFnc : function(value) {
				return value + ''
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

<script src="/resources/plugins/chartist/js/chartist.min.js"><
/script>
<script
	src="/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
</html>
