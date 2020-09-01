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
		case 'PI' :
				location.href = '<%=request.getContextPath()%>' + '/product/onepick/info';
			break;
		case 'PD' :
				location.href = '<%=request.getContextPath()%>' + '/product/onepick/dashboard';
			break;
		case 'PM' :
				location.href = '<%=request.getContextPath()%>' + '/product/onepick/manage';
			break;
		case 'T' :
				location.href = '<%=request.getContextPath()%>' + '/account/changeAcc.jsp';
			break;
		}
	}

</script>
<!-- Custom styles for this template -->

<!-- Sidebar -->
<div class="col-lg-3 mb-4">
	<div class="list-group">
		<div class="list-head">상품</div>
		<div class="list-group">
			<a href="javascript:doAction('PI')" class="list-group-item">나의 원픽 통장 조회</a> 
			<a href="javascript:doAction('PI')" class="list-group-item"> |_원픽통장만 조회(전용페이지)</a>
			<a href="javascript:doAction('PD')" class="list-group-item"> |_대시보드</a>
			<a href="javascript:doAction('PM')" class="list-group-item"> |_원픽통장 관리(자동이체/예산 배분율/재무목표 관리)</a>
			<a href="javascript:doAction('T')" class="list-group-item">통장전환</a>
			<a href="javascript:doAction('T')" class="list-group-item"> |_하나 원픽 통장전환</a>
		</div>
	</div>
</div>
