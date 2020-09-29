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
		switch(type) {
		case 'T' :
				location.href = '${ pageContext.request.contextPath }/banking/transfer';
			break;
		case 'R' :
				location.href = '${ pageContext.request.contextPath }/banking/transaction';
			break;
		case 'C' :
				location.href = '${ pageContext.request.contextPath }/paying/card';
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
<script src="/resources/plugins/common/common.min.js"></script>
<script src="/resources/js/custom.min.js"></script>
<!--menu side bar-->
<div class="col-lg-3 mb-4">
	<div class="list-head">이체</div>
	<div id="main-menu" class="list-group">
		<a href="javascript:doAction('T')" id="case_t" class="list-group-item">계좌이체</a>
		<a href="javascript:doAction('R')" class="list-group-item">거래내역조회</a>
		<a href="#sub-menu" class="list-group-item" id="case_a" data-toggle="collapse" data-parent="#main-menu">
			자동이체<span class="caret"></span>
		</a>
		<div class="collapse list-group-level1" id="sub-menu">
			<a href="javascript:doAction('A')" id="case_a" class="list-group-item" data-parent="#sub-menu">자동이체 조회</a> 
			<a href="javascript:doAction('AR')" id="case_ar" class="list-group-item" data-parent="#sub-menu">자동이체 등록</a>
			<a href="javascript:doAction('AM')" id="case_am" class="list-group-item" data-parent="#sub-menu">자동이체 변경</a>
		</div>
		<a href="javascript:doAction('C')" class="list-group-item">임시 카드결제</a>
	</div>
</div>

