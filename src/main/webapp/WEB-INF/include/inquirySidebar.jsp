<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#main-menu {
	
}

.list-group-item {
	border-bottom: 0.5px solid;
}

a.list-group-item {
	
}

a.list-group-item:hover, a.list-group-item:focus {
	background-color: #43D5B1;
}

a.list-group-item:hover, a.list-group-item:focus {
	background-color: #43D5B1;
}

a.list-group-item.active, a.list-group-item.active:hover, a.list-group-item.active:focus
	{
	color: #FFF;
	border: none;
}

.list-group-item:first-child, .list-group-item:last-child {
	border-radius: 0;
}

.list-group-level1 .list-group-item {
	padding-left: 30px;
}

.list-group-level2 .list-group-item {
	padding-left: 60px;
}

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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/resources/plugins/common/common.min.js"></script>
<script src="/resources/js/custom.min.js"></script>
<script>
	function doAction(type) {
		let bankCD = 1001;

		switch (type) {
		case 'I':
			location.href = '${ pageContext.request.contextPath }/inquiry';
			break;
		case 'O':
			location.href = '${ pageContext.request.contextPath }/banking/transaction';
			break;
		}
	}
</script>
<!-- Sidebar -->
<div class="col-lg-3 mb-4">
	<div class="list-head">조회</div>
	<div id="main-menu" class="list-group">
		<a href="javascript:doAction('I')" class="list-group-item">전체계좌조회</a>
		<a href="javascript:doAction('O')" class="list-group-item">거래내역조회</a>
	</div>
</div>
