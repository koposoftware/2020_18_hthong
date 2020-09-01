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
<title>비대면 계좌개설 < 계좌관리</title>
<script>
	function doAction() {
		let password = document.form.accPwd.value;

		console.log(password.length)

		if (password.length < 4) {
			alert("4자리의 비밀번호를 입력해주세요");
			password.focus();
			return false;
		}
		return true;
	}
</script>
<style>
#content {
	min-height: 500px;
}

#content-table th {
	padding-left: 80px;
}

.small {
	font-size: 15px;
}

#account-list {
	margin-bottom: 50px;
}

#tr-btn {
	text-align: center;
}
</style>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">비대면 계좌개설</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="openAccount.do">계좌관리</a></li>
			<li class="breadcrumb-item active">비대면 계좌개설</li>
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
									<h4>비대면 계좌가입</h4>
									<p class="small">계좌가입은 KP은행 계좌만 가능합니다.</p>

									<%-- 계좌가입 form --%>
									<form
										action="<%=request.getContextPath()%>/openAccountProcess.do"
										method="POST" name="form">
										<table class="table table-hover" id="content-table">
											<tr>
												<th class="name">예금주명</th>
												<td><input class="input--style-5" name="userName"
													disabled value=${ userVO.name }></td>
												<td><input type="hidden" name="userId"
													value=${ userVO.id }>
											</tr>
											<tr>
												<th class="bankNM">은행명</th>
												<td><input class="input--style-5" name="bankNM"
													value="KP은행" disabled></td>
											</tr>
											<tr>
												<th class="accType">통장종류</th>
												<td><select name="accType">
														<option value="입출금 통장">입출금 통장</option>
														<option value="정기적금">정기적금</option>
												</select></td>
											</tr>
											<tr>
												<th class="accPwd">계좌 비밀번호</th>
												<td><input type="password" class="input--style-5"
													name="accPwd" maxlength="4"></td>
											</tr>
											<tr>
												<th class="accNickname">별칭</th>
												<td><input type="text" class="input--style-5"
													name="accNickname" maxlength="10"></td>
											</tr>

											<%-- button 영역 : 버튼 --%>
											<tr id="tr-btn">
												<td colspan="4"><input type="submit"
													class="btn btn-outline-success" id="c-btn" value="계좌개설">
												</td>
											</tr>
										</table>
									</form>
									<%-- ./계좌가입 form--%>

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

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
