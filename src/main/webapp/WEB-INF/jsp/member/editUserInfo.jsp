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
<link href="${ pageContext.request.contextPath }/resources/css/table.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<title>회원정보수정</title>
<script>
	function changeForm(type) {
		if(type == 'M'){
			location.href = "${ pageContext.request.contextPath }/#";
		}
		else if(type == 'D'){
			location.href = "${ pageContext.request.contextPath }/#";
		}
	}
	
	function doWrite() {
		let path = document.signUpForm;

		if (path.password.value == '') {
			alert("비밀번호를 입력해주세요");
			path.password.focus();
			return false;
		}

		if (path.password.value.length < 6) {
			alert("비밀번호를 6자리 이상 입력하세요.");
			path.password.focus();
			return false;
		}

		if (path.chkPassword.value != path.password.value) {
			alert("비밀번호를 동일하게 입력하세요");
			path.chkPassword.focus();
			return false;
		}

		return true;
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
					<li class="breadcrumb-item active">회원정보수정</li>
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
									<h5 class="textarea-head">회원정보수정</h5>
									<hr class="textarea-head-hr">
									<br>

									<%-- 계좌가입 form --%>
									<form action="${ pageContext.request.contextPath }/editInfo" method="POST"
										name="signUpForm" onsubmit="return doWrite()">
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
																name="password" placeholder="비밀번호">
															<div style="height: 20px;"></div>
															<input type="password" class="form-control"
																id="chkPassword" name="checkpassword"
																placeholder="비밀번호 확인">
														</div>
														<div class="col-xs-6 col-md-6">
															<small>비밀번호는 6자리 이상을 입력하세요</small>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th class="name">이름</th>
												<td><input type="text" class="form-control" id="user_name"
													name="name" disabled value="${ memberInfoVO.name }">
												</td>
											</tr>
											<tr>
												<th class="ssn">주민번호</th>
												<td><input type="text" class="form-control-col"
													name="ssn1" id="ssn1" disabled value="${ memberInfoVO.ssn1 }">
													&macr; <input type="password" class="form-control-col"
													name="ssn2" id="ssn2" disabled value="${ memberInfoVO.ssn2 }">
												</td>
											</tr>

											<tr>
												<th class="email">이메일</th>
												<td>
													<div class="row">
														<div class="col-xs-6 col-md-6">
															<input class="form-control" type="text" name="email"
																value="${ memberInfoVO.email }">
														</div>
													</div>
											</tr>
											<tr>
												<th class="accNickname">휴대전화</th>
												<td><input class="form-control" type="text"
													name="mobile" value="${ memberInfoVO.mobile }"></td>

											</tr>
										</table>

										<%-- button 영역 : 버튼 --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" class="btn btn-outline-info" id="c-btn"
													value="회원정보수정">
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