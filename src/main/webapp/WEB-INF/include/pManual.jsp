<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="/Final-Project/resources/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/Final-Project/resources/css/vendor/icofont/icofont.min.css"
	rel="stylesheet">
<title>하나원픽 상품설명서</title>
</head>
<body>
	<button type="button" class="btn btn-outline-info" data-toggle="modal"
		data-target="#pManual">하나원픽 통장 금리안내</button>
	<div class="modal fade" id="pManual" tabindex="-1" role="dialog"
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
					<iframe style="width: 100%; height: 550px;"
						src="/resources/doc/hana_onepick_product_manual.pdf">
					</iframe>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-info"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>