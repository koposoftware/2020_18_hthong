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
<link
	href="${ pageContext.request.contextPath }/resources/css/table.css"
	rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<title>회원정보</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.btn.btn-outline-info {
	margin-left: 20px;
}
</style>
<script>
	function changeForm(type) {
		if (type == 'M') {
			location.href = "${ pageContext.request.contextPath }/mypage";
		} else if (type == 'D') {
			location.href = "${ pageContext.request.contextPath }/#";
		}
	}
</script>
<script>
	function smsAuth() {
		$.ajax({
			url : "${ pageContext.request.contextPath }/sendSMS",
			data : {
				//receiver: '내 전화번호'
				receiver : '01092768500'
			},
			type : "post",
			success : function(result) {
				if (result == "ok") {
					alert("문자 보내기 성공");
				} else {
					alert("문자 보내기 실패");
				}
			},
			error : function(result) {
				alert("응답 오류");
			}
		});
	}
</script>
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
					<li class="breadcrumb-item"><a href="#">회원</a></li>
					<li class="breadcrumb-item active">회원정보</li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/memberSidebar.jsp" />

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
									<h5 class="textarea-head">회원정보</h5>
									<hr class="textarea-head-hr">
									<br>

									<%-- 회원정보수정 form --%>
									<form name="signUpForm">
										<table class="table table-bordered" id="content-table">
											<tr>
												<th class="id">아이디</th>
												<td>
													<div class="row">
														<div class="col-xs-6 col-md-6" style="">
															<input type="text" class="form-control" id="user_id"
																name="id" value="${ memberInfoVO.id }" disabled>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th class="password">비밀번호</th>
												<td>
													<div class="row">
														<div class="col-xs-6 col-md-6">
															<input type="password" class="form-control" id="password"
																name="password" disabled
																value="${ memberInfoVO.password }">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th class="name">이름</th>
												<td><input type="text" class="form-control" id="name"
													name="user_name" disabled value="${ memberInfoVO.name }">
												</td>
											</tr>
											<tr>
												<th class="ssn">주민번호</th>
												<td><input type="text" class="form-control-col"
													name="ssn1" id="ssn1" disabled
													value="${ memberInfoVO.ssn1 }"> &macr; <input
													type="password" class="form-control-col" name="ssn2"
													id="ssn2" disabled value="${ memberInfoVO.ssn2 }">
												</td>
											</tr>

											<tr>
												<th class="email">이메일</th>
												<td>
													<div class="row">
														<div class="col-xs-6 col-md-6">
															<input class="form-control" type="text" name="email"
																disabled value="${ memberInfoVO.email }">
														</div>
													</div>
											</tr>
											<tr>
												<th class="accNickname">휴대전화</th>
												<td><input class="form-control" type="text"
													name="mobile" disabled value="${ memberInfoVO.mobile }"></td>

											</tr>
										</table>
										<%-- button 영역 : 버튼 --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="button"
													onclick="location.href='${ pageContext.request.contextPath }/editInfo'"
													class="btn btn-outline-info" value="정보수정"> <input
													type="button"
													onclick="location.href='${ pageContext.request.contextPath }/signOut'"
													class="btn btn-outline-info" value="회원탈퇴">
											</div>
										</div>
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
</body>
</html>