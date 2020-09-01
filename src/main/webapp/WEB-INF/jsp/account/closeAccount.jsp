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
<title>계좌해지 < 계좌관리</title>
<style>
#content {
	min-height: 500px;
}

#content-table {
	text-align: center;
}

.small {
	font-size: 15px;
}

#account-list {
	margin-bottom: 50px;
}
</style>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">계좌해지</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.html">계좌관리</a></li>
			<li class="breadcrumb-item active">계좌해지</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/manageSidebar.jsp" />

			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<section id="content">
					<div class="d-flex" id="wrapper">
						<!-- Page Content -->
						<div id="page-content-wrapper">
							<div class="container-fluid">
								<%-- textarea 영역 : 글내용 --%>
								<div class="textarea_wrap">
									<h4>계좌해지</h4>
									<form
										action="<%=request.getContextPath()%>/closeAccountProcess.do"
										method="POST" name="form" onsubmit="doWrite()">
										<table class="table table-hover" id="content-table">
											<tr>
												<th class="bankNM">은행</th>
												<td><input type="text" class="input--style-5" disabled
													value="${ sessionBankNM }"></td>
											</tr>
											<tr>
												<th class="accountNo">계좌번호</th>
												<td><input type="text" class="input--style-5" disabled
													value="${ sessionAccNO }"></td>
											</tr>
											<tr>
												<th class="name">예금명</th>
												<td>${ sessionAccType }</td>
											</tr>
											<tr>
												<th class="balance">계좌 비밀번호</th>
												<td><input type="password" name="closeParamPwd"
													maxlength=4></td>
											</tr>
										</table>
										<br>

										<%-- button 영역 : 버튼 --%>
										<div id="btn-area">
											<input type="submit" value="계좌해지"
												class="btn btn--radius-2 btn--blue" id="btn-submit1">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- /#page-content-wrapper -->
	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>

</body>

</html>
