<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="https://kit.fontawesome.com/48c3a06538.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/vc-toggle-switch.css" />
<link href="/resources/css/table.css" rel="stylesheet">
<link href="/resources/css/style-dash.css" rel="stylesheet">
<title>원픽통장 설정</title>
<style>
.btn-area {
	margin-bottom: 50px;
}

.content-body {
	margin-left: 0px;
}

.ct-chart .ct-label {
	fill: black;
	font-size: 13px;
	font-weight: 600;
}

.card .card-size {
	min-height: 400px;
}

#banner-title {
	position: absolute;
	top: 40%;
	left: 35%;
}

#banner-title .animated.fadeInDown {
	font-size: 40px;
	font-weight: 800;
	color: #2F4F4F;
}

.carousel-item.active:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: inherit;
	z-index: -1;
	filter: blur(6px);
	-webkit-filter: blur(6px);
	-moz-filter: blur(6px);
	-o-filter: blur(6px);
	filter: url(#blur);
}

.sub-nav {
	margin-bottom: 40px;
}

#DataTables_Table_0_length {
	display: none;
}

#DataTables_Table_1_length {
	display: none;
}

#DataTables_Table_0_filter {
	display: none;
}

#DataTables_Table_1_filter {
	display: none;
}

#DataTables_Table_0_info {
	display: none;
}

#DataTables_Table_1_info {
	display: none;
}

#DataTables_Table_0_paginate {
	display: none;
}

#DataTables_Table_1_paginate {
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">   
	$(document).ready(function() {
		
		$("#append_row").on("click", function() {
			let fixedBudget = $('#fixed-table > table');
			let accNo = '${ onepickInfo.accNo }';
			let category = $("#add_category").val();
			let budgetName = $("#add_budgetName").val(); 
			let budget = $("#add_budget").val(); 
			let tmp_setDate = $("#add_setDate").val().split(' ');  
			let setDate = tmp_setDate[1];
			
			console.log(fixedBudget);
			console.log(accNo + " : " + category + " : " + budgetName + " : " + budget + " : " + setDate);
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/makeBudget',
				type : 'post',
				data : {
					accNo : accNo,
					category : category,
					budgetName : budgetName,
					budget : budget,
					setDate : setDate
				},
				success : function(data) {	
					$('#add_budget').empty();	///////////
					console.log("성공");
					
					let str = '';
					str += '<tr>'
					str += '<td>' + category + '</td>'
					str += '<td>' + budgetName + '</td>'
					str += '<td>' + budget + '</td>'
					str += '<td>' + tmp_setDate + '</td>'
					str += '</tr>'
					
					$('#append-area').append(str);
					
				},
				error : function() {
					console.log("실패");
				}
			})
		})
	});
</script>
<script>
	$(document).ready(function() {
		// 한달예산 변경
		$("#tBudget-btn").on("click", function() {
			let accNo = '${ onepickInfo.accNo }';
			let totalBudget = $('#totalBudget').val(); 
			console.log(totalBudget)

			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/totalBudget',
				type : 'post',
				data : {
					accNo : accNo,
					totalBudget : totalBudget
				},
				success : function(data) {		
					console.log("yes");
				},
				error : function() {
					console.log("실패");
				}
			})
		})
		
		// 자동입금 설정( 기본금 -> 생활비 )
		$("#lCost-submit").on("click", function() {
			let flag = 'living';
			let accNo = '${ onepickInfo.accNo }';
			let moneyToLiving = $('#lSetMoney').val(); 
			let tmp_dateToLiving = $('#lSetDate').val().split(' '); 
			let dateToLiving = tmp_dateToLiving[1];
			
			console.log(accNo + " : " + moneyToLiving + " : " + dateToLiving);
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/autoSend',
				type : 'post',
				data : {
					flag : flag,
					accNo : accNo,
					moneyToLiving : moneyToLiving,
					dateToLiving : dateToLiving
				},
				success : function(data) {	
					console.log("yse")
				},
				error : function() {
					console.log("실패");
				}
			})
		})
		
		// 자동입금 설정( 기본금 -> 예비금 )
		$("#eCost-submit").on("click", function() {
			let flag = 'extra';
			let accNo = '${ onepickInfo.accNo }';
			let moneyToExtra = $('#eSetMoney').val(); 
			let tmp_dateToExtra = $('#eSetDate').val().split(' '); 
			let dateToExtra = tmp_dateToExtra[1];
			
			console.log(accNo + " : " + moneyToExtra + " : " + dateToExtra)
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/autoSend',
				type : 'post',
				data : {
					flag : flag,
					accNo : accNo,
					moneyToExtra : moneyToExtra,
					dateToExtra : dateToExtra
				},
				success : function(data) {	
					console.log("yes")
				},
				error : function() {
					console.log("실패");
				}
			})
		})
		
		// 예산 삭제
		$('#delete-btn').on('click', function() {
			let budgetNo = $('#delete-btn').val(); 
			
			console.log(budgetNo)
			$.ajax({
				url : '${ pageContext.request.contextPath }/product/onepick/budget/deleteBudget',
				type : 'post',
				data : {
					budgetNo : budgetNo
				},
				success : function(data) {	
					console.log("yes")
				},
				error : function() {
					console.log("실패");
				}
			})
		})
	}); 
</script>
<script>
	$(document).ready(function() {
			let totalBudget = $('#totalBudget').val();
			let fixed_sum = 0; // 고정지출 합계
			let cal_result = $('#cal_result').val();
			
			
			// 고정지출 합계(dom 구성시)
			$('.cal-budget').each(function(){ 			//클래스가 money인 항목의 갯수만큼 진행
				fixed_sum += Number($(this).val());
				});
			$('#fixed_sum').val(fixed_sum);
			
			
			
			// 고정지출 합계 변경(고정지출 추가시)
			$('#append_row').on('click' ,function(){
				let sum = parseInt($('#fixed_sum').val());		// 고정지출 
				let result = parseInt($('#cal_result').val());	// 지출합계
				let add = parseInt($('#add_budget').val());		// 고정지출 추가 금액
				
				sum = parseInt(sum + add);			// 고정지출 합계 갱신
				result = parseInt(result + add);	// 지출합계 갱신
				
				$('#fixed_sum').val(sum);			// 값 변경
				$('#cal_result').val(result);
			});
			
			
			// 총 지출 합계(dom 구성시)
			cal_result = parseInt(totalBudget - fixed_sum)
			$('#cal_result').val(cal_result);
			
			
			
			
			
			
			
			
			
			/////////////////////////////////////////////////////////////////////
			
			
			// 총 예산 변경
			$('#totalBudget').on('change keydown' ,function(){
				totalBudget = $('#totalBudget').val();	// 한달 예산의 값
				$('#cal_total').val(totalBudget);		// 총 예산의 값을 변경
			});
			
			
			
			
			

	});
</script>
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">원픽
							대시보드</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">Home</a></li>
				</ol>
			</div>
		</div>

		<!-- banner****************************** -->
		<div class="carousel-item active"
			style="background-image: url('${pageContext.request.contextPath }/resources/images/dashboard_main.jpg'); height: 400px; margin-bottom: 50px;">
			<div id="banner-title">
				<h2 class="animated fadeInDown">Financial Report</h2>
			</div>
		</div>

		<!-- tab****************************** -->
		<jsp:include page="/WEB-INF/include/budgetTab.jsp" />

		<!-- ******content-body******* -->
		<div class="content-body">
		
			
			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******한달 예산****** -->
				<div class="col-lg col-md-6">
					<div class="card card-widget">
						<div class="card-body">
							<div class="row">
								<div class="col" style="text-align: left;">
									<h4 style="margin-bottom: 5px;">한 달 예산</h4>
									<p style="font-size: 14px; color: grey;">월 급여액을 입력하면 정확한
										예산 설정이 가능합니다</p>
								</div>
								<div class="col">
									<input class="form-control form-control-lg" type="text" id="totalBudget"
										name="totalBudget" value="${ onepickInfo.totalBudget }">
									<input type="submit" id="tBudget-btn" value="저장">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- *******#/한달 예산****** -->
			</div>
			<!-- ******#/content-row******* -->
			
			
			

			<!-- ******content-row******* -->
			<div class="row">

				<!-- *******이번달 고정지출****** -->
				<div class="col-lg">
					<div class="card card-widget">
						<div class="card-body card-size">
							<h4 id="tableTitle">고정지출</h4>
							<p style="font-size: 14px; color: grey;">기본금에서 매달 자동이체로 빠져나가는
								고정지출입니다</p>
							<div class="mt-4">
								<div class="table-responsive" id="fixed-table">
									<table class="table table-striped table-bordered zero-configuration">
										<thead>
											<tr>
												<th style="width: 10%;">구분</th>
												<th style="width: 20%;">예산명</th>
												<th style="width: 20%;">이체금액</th>
												<th style="width: 20%;">이체일</th>
												<th style="width: 20%;">삭제</th>
											</tr>
										</thead>
										<tbody id="append-area">
											<c:forEach items="${ budgetList }" var="budget"
												varStatus="loop">
												<tr>
													<td>${ budget.category }</td>
													<td>${ budget.budgetName }</td>
													<td>${ budget.budget }<input type="hidden" class="cal-budget" value="${ budget.budget }"></td>
													<td>매달 ${ budget.setDate } 일</td>
													<td>
													<button id="delete-btn" value="${ budget.budgetNo }">삭제</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr style="background-color: white;">
												<th>합계</th>
												<th colspan="4"><input type="text" disabled id="fixed_sum"></th>
											</tr>
										</tfoot>
										<tr id="input-area" style="background-color: white;">
											<td>
												<select name="category" class="custom-select" id="add_category" style=" width: 10%; ">
													<option selected>고정비</option>
													<option selected>기본금</option>
													<option selected>생활비</option>
													<option selected>예비금</option>
												</select>
											</td>
											<td>
												<input type="text" name="budgetName" class="form-control" id="add_budgetName" style=" width: 10%; ">
											</td>
											<td>
												<input type="text" name="budget" class="form-control" id="add_budget" style=" width: 10%; ">
											</td>
											<td>
												<select name="setDate" class="custom-select" id="add_setDate"
													aria-label="Example select with button addon">
													<option selected>없음</option>
													<c:forEach begin="1" end="28" var="x">
														<option>매달 <c:out value="${x}" /> 일</option><br>
													</c:forEach>
												</select>
											</td>
											<td>
											</td>
										</tr>
										<tr>
											<td colspan="5" style="margin: 0; padding: 0;"
												style="text-align: center;">
												<button id="append_row"
													style="width: 100%; height: 49px; border: 0px; font-weight: 800;">
													<i class="fas fa-plus"
														style="font-size: 20px; padding-right: 7px;"></i>고정지출 추가
												</button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<!-- #/ container -->
					</div>
				</div>
				<!-- *******#/이번달 고정지출****** -->
			</div>
			<!-- ******#/content-row******* -->

			
			
			<!-- ******content-row******* -->
			<div class="row">
				<!-- *******주간 예산 목표 달성률******* -->
				<div class="col-lg">
					<div class="card card-widget">
						<div class="card-body">
							<h4 id="tableTitle">자동입금</h4>
							<p style="font-size: 14px; color: grey;">기본금에서 생활비/예비금으로 매달
								자동으로 금액이동 설정이 가능합니다</p>
							<div class="mt-4">
								<div class="table-responsive">
									<table
										class="table table-striped table-bordered zero-configuration">
										<thead>
											<tr>
												<th colspan="4"
													style="text-align: center; background-color: rgb(233, 236, 239);">총
													예산 <strong style="color: red; font-size: 25px;"><input type="text" disabled id="cal_total" value="${ onepickInfo.totalBudget }"></strong>
													원 중 <strong style="color: blue; font-size: 25px;"><input type="text" disabled id="cal_result"></strong>
													원 남음
												</th>
											</tr>
											<tr>
												<th style="width: 40%;">금액이동</th>
												<th style="width: 30%;">예산금액</th>
												<th style="width: 30%;">이체일</th>
												<th style="width: 30%;">버튼</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>기본금 <i class="fas fa-arrow-right"></i> 생활비
												</td>
												<td><input type="text" name="setMoney" id="lSetMoney" value="${ autoInfo.moneyToLiving }"></td>
												<td>
													<select name="setDate" class="custom-select" id="lSetDate"
													aria-label="Example select with button addon">
														<option selected >없음</option>
														<c:forEach begin="1" end="28" var="x">
															<option><c:out value="매달 ${x} 일" />
															</option><br>
														</c:forEach>
													</select>
												</td>
												<td><button id="lCost-submit">설정</button></td>
											</tr>
											<tr>
												<td>기본금 <i class="fas fa-arrow-right"></i>예비금
												</td>
												<td><input type="text" name="setMoney" id="eSetMoney" value="${ autoInfo.moneyToExtra }"></td>
												<td>
													<select name="setDate" class="custom-select" id="eSetDate"
													aria-label="Example select with button addon">
														<option selected>없음</option>
														<c:forEach begin="1" end="28" var="x">
															<option><c:out value="매달 ${x} 일" /></option><br>
														</c:forEach>
													</select>
												</td>
												<td><button id="eCost-submit">설정</button></td>
											</tr>
										</tbody>
										<tfoot>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
						<div class="btn-area">
							<div class="btn-wrap" id="cancle_btn">
								<input type="submit" id="submit-btn" class="btn btn-outline-info" value="초기화"
									onclick="check('cancle')"> 
								<input type="submit" id="submit-btn2" class="btn btn-outline-info" value="완료"
									onclick="check('modify')">
							</div>
						</div>
					</div>

				</div>
				<!-- *******#/주간 예산 목표 달성률******* -->
			</div>
			<!-- ******#/content-row******* -->
		</div>
	
		<!-- ****** #/content-body******* -->
	</div>

	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>
</body>
<script src="/resources/plugins/common/common.min.js"></script>
<script src="/resources/js/settings.js"></script>
<script src="/resources/js/styleSwitcher.js"></script>
<script src="/resources/plugins/tables/js/jquery.dataTables.min.js"></script>
<script
	src="/resources/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
</html>
