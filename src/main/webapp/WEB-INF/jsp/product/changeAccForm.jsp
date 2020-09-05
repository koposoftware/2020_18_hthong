<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="/resources/css/table.css" rel="stylesheet">
<title>통장전환</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#submit-form").on("click", function() {
			
			let password = $("#input_pwd").val();	// 비밀번호
			let accNo = $("#accNo").val();			// 계좌번호
			
			// 비밀번호 validation
			if(password.length < 4){
				alert("비밀번호를 입력해주세요");
				return false;
			}
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/checkPwd',
				type : 'post',
				data : { accPwd : password,
						 accNo : accNo	},
				success : function(data) {
					console.log("0 = 비번틀림 / 1 = 비번맞음 : " + data);

					if (data == 0) {
						// 0 : 비번 틀림
						alert("패스워드가 틀렸습니다.");
						return;
					} else {
						if(confirm("하나원픽 통장으로 전환하겠습니까?")){
							$("#checkForm").submit();
						}
					}
				},
				error : function() {
					console.log("실패");
				}
			})
		})
	});
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

#input_pwd {
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
										action="${ pageContext.request.contextPath }/product/onepick/changeResult"
										method="POST" name="checkForm" id="checkForm" >
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
													style="width: 20%; text-align: center; vertical-align: middle;">예금잔액(원)</th>
											</tr>
											<tr>
												<td style="text-align: center; vertical-align: middle;">${ accountInfo.regDate }</td>
												<td style="text-align: center; vertical-align: middle;">${ accountInfo.accName }
													<input type="hidden" name="accName"
													value="${ accountInfo.accName }">
												</td>
												<td style="text-align: center; vertical-align: middle;">${ accountInfo.accNo }
													<input type="hidden" name="accNo" id="accNo"
													value="${ accountInfo.accNo }">
												</td>
												<td style="text-align: center; vertical-align: middle;">${ accountInfo.balance }
													<input type="hidden" name="balance"
													value="${ accountInfo.balance }">
												</td>
											</tr>
										</table>
										<%-- ./ form--%>

										<div class="div-input-form">
											<div class="div-input-form-label">
												<label style="margin-bottom: 0px">전환 계좌 비밀번호</label>
											</div>
											<div class="div-input-form-text">
												<input type="password" class="form-control" maxlength="4"
													id="input_pwd" name="accPwd">
												<div class="check_font" id="pwd_check"></div>
											</div>
										</div>
									</form>
									<%-- button --%>
									<div class="btn-area">
										<div class="btn-wrap">
											<button type="submit" id="submit-form"
												class="btn btn-outline-info">확인</button>
											<button class="btn btn-outline-info"
												onclick="javascript:history.go(-1)">취소</button>
										</div>
									</div>
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
	<script src="/resources/css/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
