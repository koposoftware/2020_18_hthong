<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="col-lg-9 mb-4">
				<%-- 카테고리 구분 --%>
				<section id="content">
					<h2>임시 카드결제 페이지</h2>
					<form action="${ pageContext.request.contextPath }/paying/card"
						method="POST" name="form">
						<input type="text" name="money">
						<input type="submit" value="카드결제">
					</form>
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