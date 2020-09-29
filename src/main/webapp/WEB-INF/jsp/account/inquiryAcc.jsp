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
<title>전체계좌조회</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<link href="/resources/css/table.css" rel="stylesheet">
<link href="/resources/css/style-dash.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	window.onload = function() {
		$("#modal_open_btn").click(function() {
			$("#modal").attr("style", "display:block");
		});

		$("#modal_close_btn").click(function() {
			$("#modal").attr("style", "display:none");
		});
	}
</script>
<script>
	$(document).ready(function(){
		let cal_sum = 0;
		let tmp_balance = '';
		let tmp_id ='';
		
		// 천단위 구분 함수
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 계좌 잔액 합계 계산
		$('.balance_val').each(function(){	
			cal_sum += Number($(this).val());
			
			tmp_id = $(this).attr('id');
			console.log(tmp_id)
			
			$('#' + tmp_id +'-p').text(numberWithCommas($(this).val()) + ' 원');
		});
		
		cal_sum = numberWithCommas(cal_sum);
		
		$('#cal_sum').text(cal_sum + ' 원');
		
	})
		
</script>

</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/inquiry">전체계좌조회</a></li>
					<li class="breadcrumb-item active"><a
						href="${pageContext.request.contextPath }/inquiry">조회</a></li>
				</ol>
			</div>
		</div>

		<jsp:include page="/WEB-INF/include/manageAccount.jsp"></jsp:include>
		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/inquirySidebar.jsp" />

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
									<h5 class="textarea-head">전체계좌조회</h5>
									<hr class="textarea-head-hr">
									<br>


									<form method="post" name="form">
										<p class="textarea-sub">자유입출금</p>
										<table class="table table-bordered" id="content-table">
											<thead>
												<tr class="table-highlight" id="tr-head">
													<th scope="col" style="text-align: center">예금명</th>
													<th scope="col" style="text-align: center">계좌번호</th>
													<th scope="col" style="text-align: center">계좌종류</th>
													<th scope="col" style="text-align: center">신규일</th>
													<th scope="col" style="text-align: center">잔액(원)</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ accountList }" var="account"
													varStatus="loop">
													<tr id="tr-con">
														<td rowspan="2"
															style="text-align: center; vertical-align: middle;">${ account.accName }</td>
														<td style="text-align: center; vertical-align: middle;">${ account.accNo }</td>
														<td style="text-align: center; vertical-align: middle;">${ account.accType }</td>
														<td style="text-align: center; vertical-align: middle;">${ account.regDate }</td>
														<td style="text-align: center; vertical-align: middle;">
														<p class="balance" id="${ account.accNo }-p"></p>
															<input type="hidden" id="${ account.accNo }" value="${ account.balance }" class="balance_val">
														</td>
													</tr>

													<tr id="tr-btn">
														<td colspan="4" style="text-align: right">
														<input type="button" onclick="location.href='${ pageContext.request.contextPath }/banking/transaction'"
															class="btn btn-outline-dark" value="조회" > 
														<input type="button" onclick="location.href='${ pageContext.request.contextPath }/banking/transfer'"
															class="btn btn-outline-dark" value="이체" > 
													</tr>
												</c:forEach>
											</tbody>
											<tr class="table-highlight">
												<td style="text-align: center;" id="sum-title">자유입출금 합계</td>
												<td colspan="4" style="text-align: right"><strong id="cal_sum" ></strong></td>
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

	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
</body>

</html>
