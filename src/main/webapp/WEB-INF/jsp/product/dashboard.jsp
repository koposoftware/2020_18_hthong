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
	href="/resources/css/vendor/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="/resources/css/vendor/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
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

.card.card-widget.card-size{
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
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/product/onepick/dashboard">개인분석</a></li>
					<li class="breadcrumb-item active"><a
						href="${pageContext.request.contextPath }/product/onepick/info">하나 원픽통장</a></li>
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
				<li class="nav-item"><a class="nav-link active"
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
				<!-- *******이번달 예산 구성****** -->
				<div class="col-lg col-md-6">
					<div class="card card-widget">
						<div class="card-body">
							<h2 class="text-muted" id="chartTitle" style="text-align: center;">홍길동 고객님 하루 권장 
								생활비는 ${ dashboardInfo.dailyBudget }원입니다.</h2>
						</div>
					</div>
				</div>
				<!-- *******#/이번달 예산 구성****** -->
			</div>
			<!-- ******#/content-row******* -->


			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******이번달 예산 구성****** -->
				<div class="col-lg-4 col-md-6">
					<div class="card card-widget card-size">
						<div class="card-body">
							<h5 class="text-muted" id="chartTitle">이번달 예산 구성</h5>
							<h2 class="mt-4">${ onepickInfo.balance }원</h2>
							<span>총 예산</span>
							<div class="mt-4">
								<div id="animating-donut" class="ct-chart ct-golden-section"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- *******#/이번달 예산 구성****** -->

				<!-- *******주간 예산 목표 달성률******* -->
				<div class="col-lg-8 col-md-6">
					<div class="card card-widget card-size">
						<div class="card-body">
							<h5 class="text-muted">생활비 예산</h5>
							<div style="text-align: right;">
								<h5 class="mt-4"><strong style="font-size: 30px; color: blue"> ${ dashSpending.remainingBudget } 원</strong>  남음</h5><br>
								<span>예산을 맞추려면 하루에 <strong style="font-size: 15px; text-decoration: underline; ">${ dashSpending.recDailyBudget }원</strong>을 써야해요</span><br>
								<span>이 추세로 쓴다면 이번달 지출 <strong style="font-size: 15px; text-decoration: underline;"> ${ dashSpending.estimSum }원</strong>  예상</span><br><br>
								<div class="bootstrap-badge">
									<span class="badge badge-secondary" onclick="location.href='${ pageContext.request.contextPath }/product/onepick/budget'" style="cursor: pointer;">
										예산 설정  &nbsp;<i class="fas fa-arrow-right"></i>
									</span> 
                                </div>
								
							</div>
							<div class="mt-4">
								<div class="progress mb-3" style="height: 30px">
									<div class="progress-bar gradient-1" id="progress-bar" style="width: ${ dashSpending.spendingRatio }%; height: 100%; text-align: right; "
										role="progressbar" >
										<span class="label" style="font-size: 20px;">${ dashSpending.spendingRatio }%</span>
									</div>
								</div>
								<h6>
									<span style="font-size: 18px;">예산</span>
									<span style="font-size: 18px; padding-left: 10px;">${ dashboardInfo.moneyToLiving }원</span>
								</h6>
								<h6>
									<span style="font-size: 18px;">지출</span>
									<span style="font-size: 18px; padding-left: 10px;">  ${ dashSpending.monthSpending }원</span>
								</h6>
							</div>
						</div>
					</div>
				</div>
			<!-- *******#/주간 예산 목표 달성률******* -->
			</div>
			<!-- ******content-row******* -->
			<div class="row">
				<div class="col-lg">
					<div class="card card-widget">
						<div class="card-body">
							<h5 class="text-muted">연간 지출 현황(꺽은선 그래프로 예산 이행률 000%로 표시)</h5>
							<br>
							<div id="stacked-bar-chart" class="ct-chart ct-golden-section"></div>
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
			//Animating a Donut with Svg.animate
			var a = ${onepickInfo.baseMoney};
			var b = ${onepickInfo.livingCost};
			var c = ${onepickInfo.extraMoney};

			var chart = new Chartist.Pie('#animating-donut', {
				series : [ a, b, c ],
				labels : [ '기본금', '생활비', '예비금' ]
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
						'stroke-dasharray' : pathLength + 'px ' + pathLength
								+ 'px'
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
			
			
	/** ====================================== */
	//Stacked bar chart
  
  new Chartist.Bar('#stacked-bar-chart', {
    labels: [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    series: [
      [800000, 1200000, 1400000, 1300000, 800000, 1200000, 1400000, 1300000, 800000, 1200000, 1400000, 1300000],
      [800000, 1200000, 1400000, 1300000, 800000, 1200000, 1400000, 1300000, 800000, 1200000, 1400000, 1300000],
      [200000, 400000, 500000, 300000, 200000, 400000, 500000, 300000, 200000, 400000, 500000, 300000],
      [160000, 290000, 410000, 600000, 200000, 400000, 500000, 300000, 200000, 400000, 500000, 300000],
    ]
  }, {
    stackBars: true,
    axisY: {
      labelInterpolationFnc: function(value) {
        return (value / 1000) + 'k';
      }
    },
    plugins: [
      Chartist.plugins.tooltip()
    ]
  }).on('draw', function(data) {
    if(data.type === 'bar') {
      data.element.attr({
        style: 'stroke-width: 30px'
      });
    }
  });
			
</script>
<!--**********************************
        Scripts
    ***********************************-->
<script src="/resources/plugins/common/common.min.js"></script>
<script src="/resources/js/custom.min.js"></script>
<script src="/resources/js/settings.js"></script>
<script src="/resources/js/styleSwitcher.js"></script>
<script src="/resources/plugins/tables/js/jquery.dataTables.min.js"></script>
<script
	src="/resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
<script
	src="/resources/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
<script src="/resources/js/gleek.js"></script>
<script src="/resources/plugins/chartist/js/chartist.min.js"></script>
<script
	src="/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
</html>
