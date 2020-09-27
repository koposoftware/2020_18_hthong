<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<link href="/resources/css/table.css" rel="stylesheet">
<title>하나은행</title>
</head>
<body>
	<!-- ======= navbar ======= -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />
	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div class="hero-container">
			<div id="heroCarousel" class="carousel slide carousel-fade"
				data-ride="carousel">

				<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">
					
					<!-- Slide 1 -->
					<div class="carousel-item active"
						style="background-image: url('/resources/images/slide/slide-11.jpg');">
						<div class="carousel-container">
							<div class=" carousel-content container">
								<h2 class="animated fadeInDown" style="font-size: 58px;">
									Hana One-Pick
								</h2>
								<h2 class="animated fadeInDown" style="font-size: 27px;">자산관리의 시작은 통장 하나로 충분합니다.</h2>
								<a href="${ pageContext.request.contextPath }/product/onepick/info"
									class="btn-get-started animated fadeInUp scrollto">자세히 보기</a>
							</div>
						</div>
					</div>
					
					<!-- Slide 2 -->
					<!-- <div class="carousel-item"
						style="background-image: url('resources/images/slide/m-slide-1.jpg');">
						<div class="carousel-container">
							<div class="carousel-content container">
								<h2 class="animated fadeInDown">Lorem Ipsum Dolor</h2>
								<p class="animated fadeInUp">Ut velit est quam dolor ad a
									aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut
									aliquam. Occaecati alias dolorem mollitia ut. Similique ea
									voluptatem. Esse doloremque accusamus repellendus deleniti vel.
									Minus et tempore modi architecto.</p>
								<a href="#about"
									class="btn-get-started animated fadeInUp scrollto">Read
									More</a>
							</div>
						</div>
					</div> -->

					<!-- Slide 3 -->
					<!-- <div class="carousel-item"
						style="background-image: url('resources/images/slide/slide-3.jpg');">
						<div class="carousel-container">
							<div class="carousel-content container">
								<h2 class="animated fadeInDown">Sequi ea ut et est quaerat</h2>
								<p class="animated fadeInUp">Ut velit est quam dolor ad a
									aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut
									aliquam. Occaecati alias dolorem mollitia ut. Similique ea
									voluptatem. Esse doloremque accusamus repellendus deleniti vel.
									Minus et tempore modi architecto.</p>
								<a href="#about"
									class="btn-get-started animated fadeInUp scrollto">Read
									More</a>
							</div>
						</div>
					</div> -->
				</div>

				<a class="carousel-control-prev" href="#heroCarousel" role="button"
					data-slide="prev"> <span
					class="carousel-control-prev-icon icofont-rounded-left"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#heroCarousel" role="button"
					data-slide="next"> <span
					class="carousel-control-next-icon icofont-rounded-right"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>

			</div>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container">

				<div class="section-title">
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up" style="cursor: pointer;"
					 data-aos-delay="200" OnClick="location.href='${ pageContext.request.contextPath }/banking/transfer'">
						<div class="icon">
							<i class="icofont-computer"></i>
						</div>
						<h4 class="title">
							<a>전체계좌조회</a>
						</h4>
						<p class="description"></p>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up" style="cursor: pointer;"
						data-aos-delay="200" OnClick="location.href='${ pageContext.request.contextPath }/banking/transfer'">
						<div class="icon">
							<i class="icofont-money"></i>
						</div>
						<h4 class="title">
							<a>계좌이체</a>
						</h4>
						<p class="description"></p>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up" style="cursor: pointer;"
						data-aos-delay="100" OnClick="location.href='${ pageContext.request.contextPath }/product/onepick/info'" >
						<div class="icon">
							<i class="icofont-chart-bar-graph"></i>
						</div>
						<h4 class="title">
							<a>하나 원픽통장</a>
						</h4>
						<p class="description"></p>
					</div>
				</div>

			</div>
		</section>
		<!-- End Services Section -->
		
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
	<!-- End Footer -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="resources/css/vendor/jquery/jquery.min.js"></script>
	<script src="resources/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/css/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="resources/css/vendor/php-email-form/validate.js"></script>
	<script src="resources/css/vendor/jquery-sticky/jquery.sticky.js"></script>
	<script src="resources/css/vendor/venobox/venobox.min.js"></script>
	<script src="resources/css/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="resources/css/vendor/counterup/counterup.min.js"></script>
	<script src="resources/css/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resources/css/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/js/main.js"></script>

</body>

</html>