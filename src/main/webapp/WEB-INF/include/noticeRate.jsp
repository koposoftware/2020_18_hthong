<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Vendor CSS Files -->
<link
	href="/resources/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/css/vendor/icofont/icofont.min.css"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<button type="button" class="btn btn-outline-info" data-toggle="modal"
		data-target="#noticeModal">
		하나원픽 통장 금리안내</button>
	<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">금리안내</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered" id="content-table">
						<tr>
							<th style="width: 30%; text-align: center;">분류</th>
							<th style="width: 30%; text-align: center;">금리(연율, 세전)
						</tr>
						<tr>
							<td style="width: 30%">-</td>
							<td>저축예금: 0.1%, 보통예금 0.1%</td>
						</tr>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-info" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>