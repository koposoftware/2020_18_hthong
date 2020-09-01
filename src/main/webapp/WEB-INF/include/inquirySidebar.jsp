<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
function doAction(type) {
		let bankCD = 1001;
		
		switch(type) {
		case 'I' :
				location.href = '${ pageContext.request.contextPath }/inquiry';
			break;
		case 'O' :
				location.href = '${ pageContext.request.contextPath }/banking/transaction';
			break;
		}
	}
</script>
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
<!-- Sidebar -->
<div class="col-lg-3 mb-4">
	<div class="list-group">
		<div class="list-head">조회</div>
		<div class="list-group">
			<a href="javascript:doAction('I')" class="list-group-item">전체계좌조회</a>
			<a href="javascript:doAction('O')" class="list-group-item">거래내역조회</a>
		</div>
	</div>
</div>
