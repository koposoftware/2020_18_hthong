<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
function doAction(type) {
		switch(type) {
		case 'mypage' :
				location.href = '${ pageContext.request.contextPath }/mypage';
			break;
		case 'editinfo' :
				location.href = '${ pageContext.request.contextPath }/editInfo';
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
<!-- Custom styles for this template -->

<!-- Sidebar -->
<div class="col-lg-3 mb-4">
	<div class="list-group">
		<div class="list-head">회원가입</div>
		<div class="list-group">
			<a href="javascript:doAction('mypage')" class="list-group-item">회원정보
				조회</a> <a href="javascript:doAction('editinfo')" class="list-group-item">회원정보
				수정</a>
		</div>
	</div>
</div>
