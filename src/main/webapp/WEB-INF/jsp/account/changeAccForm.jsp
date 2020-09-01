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
<link href="/Final-Project/resources/css/table.css" rel="stylesheet">
<title>통장전환</title>
<script>
	function doCheck() {
		// 비밀번호 입력확인
		if ($("#input-pwd-form").val().length < 4) {
			alert("비밀번호를 입력해주세요");
			return false;
		}
		return true;
	}
</script>
<style>
.div-input-form {
	display: table;
	width: 100%;
	height: 100px;
	background-color: #F5F5F5;
}

.div-input-form-label {
	display: table-cell;
	text-align: right;
	vertical-align: middle;
	font-size: 18px;
	font-weight: 550;
	margin: 0 auto;
}

.div-input-form-text {
	display: table-cell;
	text-align: left;
	vertical-align: middle;
	padding-left: 20px;
	font-size: 18px;
	font-weight: 550;
}

#input-pwd-form {
	margin-left: 20px;
}
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
					<li class="breadcrumb-item active">통장전환</li>
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
									<h5 class="textarea-head">통장전환</h5>
									<hr class="textarea-head-hr">
									<br>

									<%-- 계좌가입 form --%>
									<form
										action="<%=request.getContextPath()%>/account/changeAccResult.jsp"
										method="POST" name="editForm" onsubmit="return doCheck()">
										<table class="table table-bordered" id="content-table">
											<tr class="table-highlight" id="tr-head">
												<th class=""
													style="width: 20%; text-align: center; vertical-align: middle;">전환지정일자
												</th>
												<th class=""
													style="width: 20%; text-align: center; vertical-align: middle;">예금종류</th>
												<th class=""
													style="width: 25%; text-align: center; vertical-align: middle;">계좌번호</th>
												<th class=""
													style="width: 15%; text-align: center; vertical-align: middle;">예금주</th>
												<th class=""
													style="width: 20%; text-align: center; vertical-align: middle;">예금잔액(원)</th>
											</tr>
											<tr>
												<td style="text-align: center; vertical-align: middle;">2020-08-20</td>
												<td style="text-align: center; vertical-align: middle;">하나원픽
													통장</td>
												<td style="text-align: center; vertical-align: middle;">54841515155</td>
												<td style="text-align: center; vertical-align: middle;">홍길동</td>
												<td style="text-align: center; vertical-align: middle;">520,001</td>
											</tr>
										</table>
										<%-- ./계좌가입 form--%>

										<div class="div-input-form">
											<div class="div-input-form-label">
												<label style="margin-bottom: 0px">전환 계좌 비밀번호</label>
											</div>
											<div class="div-input-form-text">
												<input type="password" class="form-control" maxlength="4"
													id="input-pwd-form" name="password">
											</div>
										</div>
										<%-- button --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" class="btn btn-outline-info" value="확인">
												<input type="button" class="btn btn-outline-info" value="취소"
													onclick="javascript:history.go(-1)">
											</div>
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
	<!-- Bootstrap core JavaScript -->
	<script src="/Final-Project/resources/css/vendor/jquery/jquery.min.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
