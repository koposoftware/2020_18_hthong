<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE 
m	html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<!-- Template Main CSS File -->
<link href="/resources/css/table.css" rel="stylesheet">

<title>KEB 하나은행</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">
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
						style="background-image: url('resources/images/slide/slide-1.jpg');">
						<div class="carousel-container">
							<div class="carousel-content container">
								<h2 class="animated fadeInDown">
									원픽통장 마케팅 배너
								</h2>
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
					</div>

					<!-- Slide 2 -->
					<div class="carousel-item"
						style="background-image: url('resources/images/slide/slide-2.jpg');">
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
					</div>

					<!-- Slide 3 -->
					<div class="carousel-item"
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
					</div>

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
					<h2>원픽 관련 메뉴들</h2>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<div class="icon">
							<i class="icofont-computer"></i>
						</div>
						<h4 class="title">
							<a href="">Lorem Ipsum</a>
						</h4>
						<p class="description">Voluptatum deleniti atque corrupti quos
							dolores et quas molestias excepturi sint occaecati cupiditate non
							provident</p>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up"
						data-aos-delay="100">
						<div class="icon">
							<i class="icofont-chart-bar-graph"></i>
						</div>
						<h4 class="title">
							<a href="">Dolor Sitema</a>
						</h4>
						<p class="description">Minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat tarad
							limino ata</p>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up"
						data-aos-delay="200">
						<div class="icon">
							<i class="icofont-earth"></i>
						</div>
						<h4 class="title">
							<a href="">Sed ut perspiciatis</a>
						</h4>
						<p class="description">Duis aute irure dolor in reprehenderit
							in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
					</div>
				</div>

			</div>
		</section>
		<!-- End Services Section -->
		
		
		<!-- ======= Counts Section ======= -->
		<section class="counts section-bg">
			<div class="container">
			<h2>원픽 통장별 잔액들 띄워주려고 했으나 보류.</h2>
				<div class="row">
					<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up">
						<div class="count-box">
							<i class="icofont-simple-smile" style="color: #20b38e;"></i> <span
								data-toggle="counter-up">0</span>
							<p>기본금</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
						data-aos-delay="200">
						<div class="count-box">
							<i class="icofont-document-folder" style="color: #c042ff;"></i> <span
								data-toggle="counter-up">800,000</span>
							<p>생활비</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
						data-aos-delay="400">
						<div class="count-box">
							<i class="icofont-live-support" style="color: #46d1ff;"></i> <span
								data-toggle="counter-up">2,000,000</span>
							<p>비상금</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 text-center" data-aos="fade-up"
						data-aos-delay="600">
						<div class="count-box">
							<i class="icofont-users-alt-5" style="color: #ffb459;"></i> <span
								data-toggle="counter-up">30,000,000</span>
							<p>투자금</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Counts Section -->


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