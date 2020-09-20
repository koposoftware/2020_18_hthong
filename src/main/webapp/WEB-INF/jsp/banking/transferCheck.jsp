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
<title>계좌이체결과</title>
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
					<li class="breadcrumb-item"><a href="transfer.do">이체</a></li>
					<li class="breadcrumb-item active">계좌이체</li>
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
									<h5 class="textarea-head">계좌이체</h5>
									<hr class="textarea-head-hr">
									<br>

									<%-- 계좌이체 form --%>
									<h5 class="textarea-head-mid">이체하실 내역</h5>
									<p class="textarea-head-ex">입력하신 내용이 정확한지 확인해주세요.</p>
									<form
										action="<%=request.getContextPath()%>/banking/transferResult.jsp"
										method="POST" name="form">
										<table class="table table-bordered" id="content-table">
											<thead>
												<tr class="table-highlight" id="tr-head">
													<th scope="col" style="text-align: center">출금계좌</th>
													<th scope="col" style="text-align: center">입금계좌</th>
													<th scope="col" style="text-align: center">받는분</th>
													<th scope="col" style="text-align: center">이체금액</th>
													<th scope="col" style="text-align: center">상태</th>
												</tr>
											</thead>
											<tbody>
												<tr id="tr-con">
													<td style="text-align: center;">하나원픽 통장${ accList.accType }</td>
													<td style="text-align: center">하나은행${ accList.bankNM }</td>
													<td rowspan="3"
														style="text-align: center; vertical-align: middle;">홍길동${ accList.accNO }
														<input type="hidden" name="accNO"
														value="1548-515${ accList.accNO }">
													</td>
													<td rowspan="3"
														style="text-align: center; vertical-align: middle;">500,000${ accList.balance }</td>
													<td rowspan="3"
														style="text-align: center; vertical-align: middle;">대기${ accList.regDate }</td>
												</tr>
												<tr>
													<td rowspan="2"
														style="text-align: center; vertical-align: middle;">1584-8548123123</td>
													<td rowspan="2"
														style="text-align: center; vertical-align: middle;">48120651651163165</td>
												</tr>
											</tbody>
										</table>

										<%-- button 영역 : 버튼 --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="button" value="취소"
													onclick="javascript:history.go(-1);"
													class="btn btn-outline-info">
												<input type="submit" value="이체실행"
													class="btn btn-outline-info">
											</div>
										</div>
										
									</form>
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
