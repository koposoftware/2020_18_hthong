<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title></title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/modal/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/modal/login_main.css" />
</head>
<body>

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-outline-info" data-toggle="modal"
		data-target="#exampleModalCenter">회원탈퇴</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">회원탈퇴</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"><span>회원탈퇴 시 모든 서비스 이용이 불가합니다.</span><br><br><span>탈퇴하시겠습니까?</span></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<input type="button" 
						onclick="location.href='${ pageContext.request.contextPath }/signOut'"
						class="btn btn-outline-info" value="회원탈퇴">
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript"
		src="${ pageContext.request.contextPath }/resources/js/modal/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="${ pageContext.request.contextPath }/resources/js/modal/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${ pageContext.request.contextPath }/resources/js/modal/login_main.js"></script>
</body>
</html>