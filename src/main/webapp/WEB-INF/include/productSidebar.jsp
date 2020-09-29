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
		case 'PI' :
				location.href = '<%=request.getContextPath()%>/product/onepick/info';
			break;
		case 'PD' :
				location.href = '<%=request.getContextPath()%>/product/onepick/dashboard';
			break;
		case 'T' :
				location.href = '<%=request.getContextPath()%>/product/onepick/change';
			break;
		}
	}
</script>
<!--menu side bar-->
<div class="col-lg-3 mb-4">
	<div class="list-head">하나원픽통장</div>
	<div id="main-menu" class="list-group">
		<a href="#sub-menu" class="list-group-item"
			data-toggle="collapse" data-parent="#main-menu">통장조회<span
			class="caret"></span></a>
		<div class="collapse list-group-level1" id="sub-menu">
			<a href="javascript:doAction('PI')" id="case_pi" class="list-group-item" data-parent="#sub-menu">원픽통장
				조회</a> <a href="javascript:doAction('PD')" id="case_pd" class="list-group-item" data-parent="#sub-menu">대시보드</a>
		</div>
		<a href="javascript:doAction('T')" id="case_t" class="list-group-item">통장전환</a>
	</div>
</div>

