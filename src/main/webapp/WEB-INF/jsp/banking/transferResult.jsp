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
<title>계좌이체</title>
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
										<h5 class="textarea-head-mid">이체결과 확인</h5>
										<p class="textarea-head-ex">계좌이체가 완료되었습니다. 아래의 처리결과를 확인해주세요.</p>
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
													<td style="text-align: center;">${ transferResult }</td>
													<td style="text-align: center">${ transferResult.bankNM }</td>
													<td rowspan="3" style="text-align: center; vertical-align: middle;">${ transferResult.accNo }</td>
													<td rowspan="3" style="text-align: center; vertical-align: middle;">${ transferResult.balance }</td>
													<td rowspan="3" style="text-align: center; vertical-align: middle;">${ transferResult.regDate }</td>
												</tr>
												<tr>
												<td rowspan="2"
														style="text-align: center; vertical-align: middle;"></td>
												<td rowspan="2"
														style="text-align: center; vertical-align: middle;">48120651651163165</td>
												</tr>
											</tbody>
										</table>
										
										<%-- button 영역 : 버튼 --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="button" onclick="location.href='<%=request.getContextPath()%>/banking/transactionDetails.jsp'" value="거래내역조회" class="btn btn-outline-info" >
												<input type="button" onclick="location.href='<%=request.getContextPath()%>/banking/transfer.jsp'" value="계속이체하기" class="btn btn-outline-info" >
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