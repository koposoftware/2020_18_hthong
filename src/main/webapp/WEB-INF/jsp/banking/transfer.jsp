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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#trans_submit").on("click", function() {
			
			let password = $("#acc_pwd").val();	// 비밀번호
			
			// 비밀번호 validation
			if(password.length < 4){
				alert("비밀번호를 입력해주세요");
				return false;
			}
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/banking/transfer/check',
				type : 'post',
				data : $('#form').serialize(),
				success : function(data) {
					console.log("0 = 비번틀림 / 1 = 비번맞음 : " + data);

					if (data == '1001') {
						alert("패스워드가 틀렸습니다.");
						return;
					} 
					else if(data == '1002'){
						alert("계좌 잔액이 부족합니다.");
						return;
					}
					else if(data == '1003'){
						alert("상대방 입금계좌를 확인해주세요.");
						return;
					}
					else {
						if(confirm("계좌이체를 진행하시겠습니까?")){
							$("#form").submit();
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
<title>계좌이체</title>
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/banking/transaction">이체</a></li>
					<li class="breadcrumb-item active"><a
						href="${pageContext.request.contextPath }/inquiry">계좌이체</a></li>
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
									<form
										action="${ pageContext.request.contextPath }/banking/transfer"
										method="POST" name="form" id="form">
										<table class="table table-bordered" id="content-table">
											<thead class="thead-light">
												<tr>
													<th scope="col" colspan="2">출금정보</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">출금계좌</th>
													<td>
														<div class="input-group">
															<select id="accNo" name="accNo" class="custom-select"
																aria-label="Example select with button addon">
																<option selected>출금계좌 선택</option>
																<c:forEach items="${ accountList }" var="account"
																	varStatus="loop">
																	<option class="accNo" value=${ account.accNo }>[
																		${ account.bankCode } ] ${ account.accNo }</option>
																</c:forEach>
															</select>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">계좌 비밀번호</th>
													<td>
														<div class="input-group mb-3">
															<input type="password" name="accPwd" id="acc_pwd" maxlength="4"
																class="form-control" placeholder="비밀번호 4자리 입력"
																aria-label="Recipient's username"
																aria-describedby="button-addon2">
														</div>
													</td>
												</tr>

												<tr>
													<th scope="row">이체금액</th>
													<td>
														<div class="input-group mb-3">
															<input type="text" name="money" class="form-control"
																placeholder="이체금액" aria-label="Recipient's username"
																aria-describedby="button-addon2">
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<br>


										<table class="table table-bordered" id="content-table">
											<thead class="thead-light">
												<tr>
													<th scope="col" colspan="2">입금정보</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">입금은행</th>
													<td>
														<div class="input-group">
															<select name="bankName" class="custom-select"
																id="inputGroupSelect04"
																aria-label="Example select with button addon">
																<option selected>은행명</option>
																<option value="하나은행" selected>하나은행</option>
																<option value="국민은행">국민은행</option>
																<option value="신한은행">신한은행</option>
																<option value="우리은행">우리은행</option>
																<option value="우리은행">기업은행</option>
															</select>
														</div>
													</td>
												</tr>

												<tr>
													<th scope="row">입금계좌번호</th>
													<td>
														<div class="input-group mb-3">
															<input type="text" name="oppAccNo" class="form-control"
																placeholder="-없이 입력하세요"
																aria-label="Recipient's username"
																aria-describedby="button-addon2">
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">받는분 통장표시</th>
													<td>
														<div class="input-group mb-3">
															<input type="text" name="memo" class="form-control"
																placeholder="-없이 입력하세요"
																aria-label="Recipient's username"
																aria-describedby="button-addon2"> <input
																type="hidden" name="summary" value="계좌이체">
														</div>
													</td>
												</tr>

											</tbody>
										</table>
									</form>
									<%-- button 영역 : 버튼 --%>
									<div class="btn-area">
										<div class="btn-wrap">
											<input type="submit" value="이체실행" id="trans_submit"
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
	<script src="/resources/plugins/common/common.min.js"></script>
	<script src="/resources/js/custom.min.js"></script>
	<script src="/resources/js/settings.js"></script>
	<script src="/resources/js/gleek.js"></script>
	<script src="/resources/js/styleSwitcher.js"></script>
</body>

</html>
