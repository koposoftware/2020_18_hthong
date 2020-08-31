<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="descriptison">
<meta content="" name="keywords">

<link href="/resources/images/apple-touch-icon.png"
	rel="apple-touch-icon">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900"
	rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
<!-- Vendor CSS Files -->
<link
	href="/resources/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/vendor/icofont/icofont.min.css"
	rel="stylesheet">
<link
	href="/resources/css/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="/resources/css/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="/resources/css/vendor/venobox/venobox.css"
	rel="stylesheet">
<link href="/resources/css/vendor/aos/aos.css"
	rel="stylesheet">

<style>
	hr{
		margin: 0px;
	}
</style>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container">
			<div class="row">
				<!-- ======= logo ======= -->
				<div class="col">
					<div class="logo float-left">
						<!-- Uncomment below if you prefer to use an image logo -->
						<a href="/"><img
							src="/resources/images/hana_logo.png" alt=""
							class="img-fluid"></a>
					</div>
				</div>

				<!-- ======= menu ======= -->
				<div class="col-5" id="nav-grid">
					<nav class="nav-menu float-left d-none d-lg-block">
						<ul>
							<li class="drop-down"><a href="">조회</a>
								<ul>
									<li><a
										href="${ pageContext.request.contextPath }/inquiry">전체계좌조회</a></li>
									<li><a
										href="${ pageContext.request.contextPath }/banking/transaction">거래내역조회</a></li>
								</ul></li>
							<li class="drop-down"><a href="">이체</a>
								<ul>
									<li><a
										href="${ pageContext.request.contextPath }/banking/transfer">계좌이체</a></li>
									<li><a
										href="${ pageContext.request.contextPath }/banking/transaction">이체 결과조회</a></li>
									<li><a
										href="${ pageContext.request.contextPath }/autodebit/info">자동이체</a></li>
								</ul></li>
							<li class="drop-down"><a href="">상품</a>
								<ul>
									<li><a
										href="${ pageContext.request.contextPath }/product">하나원픽통장</a></li>
									<li><a
										href="${ pageContext.request.contextPath }/account">통장전환</a></li>
									<li><a
										href="${ pageContext.request.contextPath }/account">통장관리</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>

				<!-- ======= login ======= -->
				<div class="col-4" id="login-area">
					<ul>
						<c:choose>
							<c:when test="${ empty loginVO }">
								<li class="nav-item-hidden"><a class="btn btn-outline-info"
									href="${ pageContext.request.contextPath }/login">로그인</a></li>
								<li class="nav-item-hidden"><a class="btn btn-outline-info"
									href="${ pageContext.request.contextPath }/signUp">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item-hidden"><a class="nav-link" href="${ pageContext.request.contextPath }/mypage"
									style="text-decoration: underline; font-size: 17px; margin-right: 30px;">${ loginVO.id } 님</a></li>
								<li class="nav-item-hidden"><a class="btn btn-outline-info"
									href="${ pageContext.request.contextPath }/logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				
			</div>
		</div>
		<hr>
	</header>
	<!-- End Header -->
</html>
