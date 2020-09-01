<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
function doAction(type) {
		let bankCD = 1001;
		
		switch(type) {
		case 'openAcc' :
				location.href = '<%=request.getContextPath()%>' + '/openAccount.do';
			break;
		case 'manageAcc' :
				location.href = '<%=request.getContextPath()%>' + '/editAccInfo.do';
			break;
		case 'closeAcc' :
				location.href = '<%=request.getContextPath()%>' + '/closeAccount.do';
			break;
		}
	}

</script>
<!-- Custom styles for this template -->

<!-- Sidebar -->
<div class="col-lg-3 mb-4">
	<div class="list-group">
		<a href="javascript:doAction('openAcc')" class="list-group-item">비대면 계좌가입</a> 
		<a href="javascript:doAction('manageAcc')" class="list-group-item">계좌관리</a> 
	</div>
</div>
