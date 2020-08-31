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
<link href="/Final-Project/resources/css/table.css" rel="stylesheet">
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
					<li class="breadcrumb-item"><a href="transfer.do">자동이체</a></li>
					<li class="breadcrumb-item active">자동이체 등록</li>
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
									<h5 class="textarea-head-mid">자동이체 결과 확인</h5>
									<p class="textarea-head-ex">자동이체 등록이 완료되었습니다. 아래의 처리결과를 확인해주세요.</p>

									<form
										action="<%=request.getContextPath()%>/transferFromKPBank.do"
										method="POST" name="form">

										<table class="table table-bordered" id="content-table">
											<tr>
												<th>출금계좌번호</th>
												<td colspan="3">
													<div class="display_table">
														<div class="input-group mb-3">
														<input type="hidden" name="accNO" value="">출금계좌${ autoAcc.accNO }
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th>입금계좌번호</th>
												<td>
													<div class="display_table">
														<div class="input-group mb-3">
														<input type="hidden" name="accNO" value="">입금계좌${ autoAcc.accNO }
														</div>
													</div>
												</td>
												<th>이체구분</th>
												<td>
													<div class="display_table">
														<div class="input-group mb-3">
														<input type="hidden" name="accNO" value="">계좌이체${ autoAcc.accNO }
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th>이체금액</th>
												<td>
													<div class="display_table">
														<div class="input-group mb-3">
														<input type="hidden" name="accNO" value="">금액${ autoAcc.accNO }
														</div>
													</div>
												</td>
												<th>받는분</th>
												<td>
													<div class="display_table">
														<div class="input-group mb-3">
														<input type="hidden" name="accNO" value="">상대 계좌주${ autoAcc.accNO }
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th>이체주기</th>
												<td>
													<div class="display_table">
														<div class="input-group mb-3">
														<input type="hidden" name="accNO" value="">주기${ autoAcc.accNO }
														</div>
													</div>
												</td>
												<th>이체지정일</th>
												<td>
													<div class="display_table">
														<div class="input-group mb-3">
														<input type="hidden" name="accNO" value="">지정일${ autoAcc.accNO }
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th>이체시작일</th>
												<td>
													<div class="display_table">
														<div class="input-group mb-3">
														<input type="hidden" name="accNO" value="">이체시작일${ autoAcc.accNO }
														</div>
													</div>
												</td>
												<th>이체종료일</th>
												<td>
													<div class="display_table">
														<div class="input-group mb-3">
														<input type="hidden" name="accNO" value="">종료일/미지정${ autoAcc.accNO }
														</div>
													</div>
												</td>
											</tr>
										</table>
										<br>
										<hr>

										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" value="자동이체 등록진행"
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