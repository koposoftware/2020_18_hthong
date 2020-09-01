<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
col-lg-3.mb-4 {
	margin-top: 500px;
}

.list-head {
	margin-left: 10px;
	margin-bottom: 10px;
	text-align: left;
	height: 42px;
	font-size: 27px;
	font-weight: 600;
}
</style>
<script>
function doAction(type) {
		switch(type) {
		case 'T' :
				location.href = '${ pageContext.request.contextPath }/banking/transfer';
			break;
		case 'R' :
				location.href = '${ pageContext.request.contextPath }/banking/transaction';
			break;
		case 'A' :
				location.href = '${ pageContext.request.contextPath }/autodebit/info';
			break;
		case 'AR' :
				location.href = '${ pageContext.request.contextPath }/autodebit/registration';
			break;
		case 'AM' :
				location.href = '${ pageContext.request.contextPath }/autodebit/manage';
			break;
		}
	}
</script>
<!-- Custom styles for this template -->

<!-- Sidebar -->
<div class="col-lg-3 mb-4">
	<div class="list-group">
		<div class="list-head">이체</div>
		<div class="list-group">
			<a href="javascript:doAction('T')" class="list-group-item">계좌이체</a>
			<a href="javascript:doAction('R')" class="list-group-item">이체 결과조회</a>
			<a href="javascript:doAction('A')" class="list-group-item">자동이체</a>
			<a href="javascript:doAction('AR')" class="list-group-item">|_자동이체 등록</a>
			<a href="javascript:doAction('AM')" class="list-group-item">|_자동이체 조회/변경/취소</a>
		</div>
	</div>

</div>
