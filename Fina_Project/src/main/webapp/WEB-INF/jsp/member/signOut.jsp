<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<style>
.wrap-login100.p-l-85.p-r-85.p-t-55.p-b-55 {
	width: 500px;
}
</style>
<script>
	function checkForm() {
		let f = document.lform;

		if (isNull(f.id, '아이디를 입력하세요'))
			return false;
		if (isNull(f.password, '패스워드를 입력하세요'))
			return false;
		
		return true;
	}
</script>
</head>
<body>
	<!-- ======= navbar ======= -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<div class="login-section">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">

				<form action="${ pageContext.request.contextPath }/signOut"
					method="post" name="lform" onsubmit="return checkForm()"
					class="login100-form validate-form flex-sb flex-w">

					<span class="login100-form-title p-b-32"> 회원탈퇴 </span> <span
						class="txt1 p-b-11"> ID </span>
					<div class="wrap-input100 validate-input m-b-36"
						data-validate="Username is required">
						<input class="input100" type="text" name="id" value="${ memberInfoVO.id }" disabled>
						<span class="focus-input100"></span>
					</div>

					<span class="txt1 p-b-11"> Password </span>
					<div class="wrap-input100 validate-input m-b-12"
						data-validate="Password is required">
						<span class="btn-show-pass"> <i class="fa fa-eye"></i>
						</span> <input class="input100" type="password" name="password"> 
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">탈퇴하기</button>
						<button class="login100-form-btn">취소</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<!-- ======= Footer ======= -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />

	<script src="/resources/css/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="/resources/css/vendor/animsition/js/animsition.min.js"></script>
	<script src="/resources/css/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/css/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/css/vendor/select2/select2.min.js"></script>
	<script src="/resources/css/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/css/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="/resources/css/vendor/countdowntime/countdowntime.js"></script>
	<script src="/resources/js/login.js"></script>

</body>
</html>