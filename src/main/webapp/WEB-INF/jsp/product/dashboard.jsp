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
				<!-- *******이번달 예산 구성****** -->
				<div class="col-lg col-md-6">
					<div class="card card-widget">
						<div class="card-body">
							<h2 class="text-muted" id="chartTitle">홍길동 고객님 이번주 사용 가능한
								생활비는 100,000원입니다.</h2>
							<div class="mt-4"></div>
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
							<h5 class="text-muted">주간 생활비 지출 현황</h5>
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
											<td>자동이체 설정값</td>
											<td>${ onepickInfo.livingCost }원</td>
											<td style="text-align: right; width: 25%;">
												<div class="progress" style="height: 10px;">
													<div class="progress-bar gradient-1" style="width: 90%;"
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
											<td>자동이체 설정값</td>
											<td>${ onepickInfo.livingCost }원</td>
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
											<td>자동이체 설정값</td>
											<td>${ onepickInfo.livingCost }원</td>
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
											<td>자동이체 설정값</td>
											<td>${ onepickInfo.livingCost }원</td>
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



			<!-- ******content-row******* -->
			<div class="row">
				<!-- ******이번달 예산 상세보기******* -->
				<div class="col-lg">
					<div class="card card-widget">
						<div class="card-body">
							<h5 class="text-muted" id="chartTitle">이번달 예산구성 상세(매달 1일 기준)</h5>
							<p>자동이체 테이블 그대로 가져와서 보여줄 경우, 중간에 자동이체 수정하면 예산 전체가 이상해짐. / 예산
								테이블 따로 만들고 매월 1일에 갱신되도록 설정</p>
							<div class="mt-4">
								<div class="table-responsive">
									<table
										class="table table-striped table-bordered zero-configuration">
										<thead>
											<tr>
												<th style="width: 10%;">구분</th>
												<th style="width: 10%;">상세구분</th>
												<th style="width: 30%;">금액</th>
												<th style="width: 30%;">비중</th>
												<th style="width: 10%;">예산설정</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>기본금</td>
												<td>집세</td>
												<td>700,230</td>
												<td>40%</td>
												<td><button>설정</button></td>
											</tr>
											<tr>
												<td>기본금</td>
												<td>대출금</td>
												<td>135,000</td>
												<td>10%</td>
												<td><button>설정</button></td>
											</tr>
											<tr>
												<td>기본금</td>
												<td>공과금</td>
												<td>132,000</td>
												<td>12%</td>
												<td><button>설정</button></td>
											</tr>
											<tr>
												<td>기본금</td>
												<td>교통비</td>
												<td>70,000</td>
												<td>8%</td>
												<td><button>설정</button></td>
											</tr>
											<tr>
												<td>기본금</td>
												<td>통신비</td>
												<td>120,000</td>
												<td>14%</td>
												<td><button>설정</button></td>
											</tr>
											<tr>
												<td>생활비</td>
												<td>생활비</td>
												<td>900,000</td>
												<td>50%</td>
												<td><button>설정</button></td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<th>구분</th>
												<th>상세구분</th>
												<th>금액</th>
												<th>비중</th>
												<th></th>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
						<!-- #/ container -->
					</div>
				</div>
				<!-- ******#/이번달 예산 상세보기******* -->
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
			var b = ${onepickInfo.baseMoney};
			var c = ${onepickInfo.livingCost};
			var d = ${onepickInfo.extraMoney};

			var chart = new Chartist.Pie('#animating-donut', {
				series : [ a, b, c, d ],
				labels : [ '기본금', '고정비', '생활비', '예비금' ]
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
