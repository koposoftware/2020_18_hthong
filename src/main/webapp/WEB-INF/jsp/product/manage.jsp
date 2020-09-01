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
<link rel="stylesheet" type="text/css"
	href="/Final-Project/resources/css/vc-toggle-switch.css" />
<title>원픽통장 설정</title>
<style>
</style>
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
					<li class="breadcrumb-item active">원픽통장 설정</li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/productSidebar.jsp" />

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
									<h5 class="textarea-head">예산쪼개기 설정</h5>
									<hr class="textarea-head-hr">
									<br>
									
									<h5>off 할경우 계좌 잔액은 기본금으로 이동</h5>


									<form method="post" name="form">
										<p class="textarea-sub">생활비 설정</p>
										<table class="table table-bordered" id="content-table">
											<tr class="table-highlight" id="tr-head">
												<th style="text-align: center; vertical-align: middle;">생활비</th>
												<td><div class="vc-toggle-container">
														<label class="vc-switch"> <input type="checkbox"
															class="vc-switch-input" checked /> <span data-on="on"
															data-off="off" class="vc-switch-label"></span> <span
															class="vc-handle" ></span>
														</label>
													</div></td>
											</tr>
											<tr id="tr-con">
												<td style="text-align: center; vertical-align: middle;">자동입금 금액</td>
												<td style="text-align: center">매월이용 12,000원 -> </td>
											</tr>
											<tr id="tr-con">
												<td rowspan="2"
													style="text-align: center; vertical-align: middle;">자동입금 날짜</td>
												<td style="text-align: center">드롭다운 매월 며칠</td>
											</tr>
										</table>
										
										<p class="textarea-sub">예비금 설정</p>
										<table class="table table-bordered" id="content-table">
											<tr class="table-highlight" id="tr-head">
												<th style="text-align: center; vertical-align: middle;">예비금</th>
												<td><div class="vc-toggle-container">
														<label class="vc-switch"> <input type="checkbox"
															class="vc-switch-input" /> <span data-on="on"
															data-off="off" class="vc-switch-label"></span> <span
															class="vc-handle"></span>
														</label>
													</div></td>
											</tr>
											<tr id="tr-con">
												<td style="text-align: center; vertical-align: middle;">자동입금 금액</td>
												<td style="text-align: center">매월이용 12,000원 -> </td>
											</tr>
											<tr id="tr-con">
												<td rowspan="2"
													style="text-align: center; vertical-align: middle;">자동입금 날짜</td>
												<td style="text-align: center">드롭다운 매월 며칠</td>
											</tr>
										</table>
										
										<p class="textarea-sub">투자예정금 설정</p>
										<table class="table table-bordered" id="content-table">
											<tr class="table-highlight" id="tr-head">
												<th style="text-align: center; vertical-align: middle;">투자예정금</th>
												<td><div class="vc-toggle-container">
														<label class="vc-switch"> <input type="checkbox"
															class="vc-switch-input" /> <span data-on="on"
															data-off="off" class="vc-switch-label"></span> <span
															class="vc-handle"></span>
														</label>
													</div></td>
											</tr>
											<tr id="tr-con">
												<td style="text-align: center; vertical-align: middle;">자동입금 금액</td>
												<td style="text-align: center">매월이용 12,000원 -> </td>
											</tr>
											<tr id="tr-con">
												<td rowspan="2"
													style="text-align: center; vertical-align: middle;">자동입금 날짜</td>
												<td style="text-align: center">드롭다운 매월 며칠</td>
											</tr>
										</table>
									</form>

								</div>
							</div>
							<%-- button 영역 : 버튼 --%>
						</div>
					</div>
				</section>
			</div>
			<!-- /#page-content-wrapper -->
		</div>
		<!-- /#wrapper -->

	</div>
	<!-- /.row -->
	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>
</body>
</html>
