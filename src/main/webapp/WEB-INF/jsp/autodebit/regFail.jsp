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
<title>자동이체 등록</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<link href="/resources/css/table.css" rel="stylesheet">
<link href="/resources/css/style-dash.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active">자동이체 등록</li>
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/autodebit/info">자동이체</a></li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/bankingSidebar.jsp" />

			<!-- Content Column -->
			<div class="col-lg-9 mb-4">

				<%-- 카테고리 구분 --%>
				<section id="content">
					<div class="d-flex" id="wrapper">

						<!-- Page Content -->
						<div id="page-content-wrapper">
							<div class="container-fluid">

								<%-- textarea 영역 : 글내용 --%>
								<div class="textarea_wrap">
									<h5 class="textarea-head">자동이체 등록</h5>
									<hr class="textarea-head-hr">
									<br>

									<%-- 계좌이체 form --%>
									<h5 class="textarea-head-mid">자동이체등록 실패</h5>
									<p class="textarea-head-ex">입력하신 내용이 정확한지 확인해주세요.</p>
									<br> <br>

									<div style="text-align: center">
										<h2 style="margin: 0 auto">자동이체 등록이 실패했습니다.</h2>
									</div>
									<br> <br> <br>
									<hr>

									<div class="btn-area">
										<div class="btn-wrap">
											<input type="button" value="자동이체 등록"
												onclick="location.href='${ pageContext.request.contextPath }/autodebit/registration'"
												class="btn btn-outline-info"> <input type="button"
												value="자동이체 등록조회"
												onclick="location.href='${ pageContext.request.contextPath }/autodebit/info'"
												class="btn btn-outline-info">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /#page-content-wrapper -->
					</div>
					<!-- /#wrapper -->
				</section>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>
</body>
</html>