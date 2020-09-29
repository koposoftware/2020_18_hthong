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
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<title>자동이체 조회</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#search-btn").on("click", function() {

			let accNo = $('#accNo').val(); // 계좌번호
			let category = $('#category').val(); // 검색조건

			$.ajax({
				url : '${ pageContext.request.contextPath }/autodebit/info',
				type : 'post',
				data : {
					category : category,
					accNo : accNo,
					status : status
				},
				success : function(data) {
					$('#search_list').empty();
					
					if(data == '') {
						let str = '';
						str += '<tr id="tr-con" style="min-height: 100px;">'
						str += '<td colspan="6" style="text-align: center;">자동이체 정보가 존재하지 않습니다</td>'
						str += '</tr>'
						
						$('#search_list').append(str);
						
					} else{
						$(data).each(function() {
							let str = '';
							str += '<tr id="tr-con" style="min-height: 100px;">'
							str += '<td style="text-align: center;">' + this.category
							str += '<input type="hidden" name="category" value="' + this.category + '"></td>'
							str += '<td style="text-align: right; padding-right: 50px;">' + this.setMoney + ' 원'
							str += '<input type="hidden" name="setMoney" value="' + this.setMoney + '"></td>'
							str += '<td style="text-align: center;">' + this.setDate + ' 일'
							str += '<input type="hidden" name="setDate" value="' + this.setDate + '"></td>'
							str += '<td style="text-align: center;">' + this.startDate
							str += '<input type="hidden" name="startDate" value="' + this.startDate + '"></td>'
							str += '<td style="text-align: center;"></td>' 
							str += '<td style="text-align: center;">'
							str += '<input type="radio" name="autodebitCode" id="checked_info" value="' + this.autodebitCode + '">'
							str += '<input type="hidden" name="cycle" value="' + this.cycle + '">'
							str += '<input type="hidden" name="status" value="' + this.status + '">'
							str += '<input type="hidden" name="closeDate" value="' + this.closeDate + '">'
							str += '<input type="hidden" name="oppAccNo" value="' + this.oppAccNo + '">'
							str += '<input type="hidden" name="bankName" value="' + this.bankName + '">'
							str += '<input type="hidden" name="accNo" value="' + this.accNo + '">'
							str += '</td></tr>'
							$('#search_list').append(str);
						})
					}
				},
				error : function() {
					console.log("실패");
				}
			})
		})
	}); 
</script>
<script>
	function check(str) {
		if ($("input:radio[name=autodebitCode]:checked").length < 1) {
			alert('해지할 자동이체를 선택해주세요')
		} else {
			if(str=='cancle'){
				if (confirm("자동이체를 해지하시겠습니까?")) {
					deleteForm.action="${ pageContext.request.contextPath }/autodebit/manage/delete";
				} 
			} else if(str=='modify'){
				if (confirm("자동이체 정보를 변경하시겠습니까?")) {
					deleteForm.action="${ pageContext.request.contextPath }/autodebit/manage/modifyForm";
				} 
			}
		}
	}
</script>
<link href="/resources/css/table.css" rel="stylesheet">
<style>
.btn-area {
	margin-bottom: 50px;
}

.radio label input {
	margin-right: 3px;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active">자동이체 조회</li>
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/autodebit/info">자동이체</a></li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/bankingSidebar.jsp" />

			<!-- Content Column -->
			<div class="col-lg-9 mb-4">

				<%-- 카테고리 구분 --%>
				<section id="content">
					<div class="d-flex" id="wrapper">

						<!-- Page Content -->
						<div id="page-content-wrapper">
							<div class="container-fluid">

								<%-- textarea 영역 : 글내용 --%>
								<div class="textarea_wrap">
									<h5 class="textarea-head">자동이체 조회</h5>
									<hr class="textarea-head-hr">
									<br>
									<form
										action="${ pageContext.request.contextPath }/autodebit/manage/delete"
										method="POST" name="form">
										<table class="table table-bordered" id="content-table">
											<thead class="thead-light">
												<tr>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row" class="table-highlight"
														style="text-align: center; vertical-align: middle;">출금계좌번호</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<select id="accNo" name="accNo" class="custom-select"
																	aria-label="Example select with button addon">
																	<option value="$(this)" selected disabled>출금계좌
																		선택</option>
																	<c:forEach items="${ accountList }" var="accList"
																		varStatus="loop">
																		<option class="accNo" value=${ accList.accNo }>
																			${ accList.accNo }</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" class="table-highlight"
														style="text-align: center; vertical-align: middle;">자동이체종류</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<select name="category" id="category"
																	class="custom-select"
																	aria-label="Example select with button addon">
																	<option value="전체" selected>전체</option>
																	<option class="" value="계좌이체">계좌이체</option>
																	<option class="" value="펀드">펀드</option>
																	<option class="" value="적금/청약">적금/청약</option>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" class="table-highlight"
														style="text-align: center; vertical-align: middle;">처리상태</th>
													<td>
														<div class="radio icheck-primary">
															<span class="radio">
																<label> <input type="radio" name="status" value="정상" checked> 정상
																</label>
															</span>
															<span class="radio">
																<label> <input type="radio" name="status" value="해지"> 해지
																</label>
															</span>
															<span class="radio">
																<label> <input type="radio" name="status" value="전체"> 전체
																</label>
															</span>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</form>
									<div class="btn-area">
										<div class="btn-wrap">
											<button type="submit" id="search-btn"
												class="btn btn-outline-info">조회</button>
										</div>
									</div>

									<%-- ajax 결과부분 --%>
									<div>
									<form method="POST" name="deleteForm" id="deleteForm" >
										<table class="table table-bordered" id="content-table">
											<thead class="thead-light">
												<tr class="table-highlight" id="tr-head">
													<th scope="col" style="text-align: center; width: 15%">구분</th>
													<th scope="col" style="text-align: center; width: 20%">이체금액</th>
													<th scope="col" style="text-align: center; width: 15%">이체주기</th>
													<th scope="col" style="text-align: center; width: 20%">이체시작일</th>
													<th scope="col" style="text-align: center; width: 10%">변경</th>
													<th scope="col" style="text-align: center; width: 10%">해지</th>
												</tr>
											</thead>
											<tbody id="search_list">
											</tbody>
										</table>
											<div class="btn-area">
												<div class="btn-wrap" id="cancle_btn">
													<input type="submit" id="submit-btn" class="btn btn-outline-info" value="자동이체 해지 " onclick="check('cancle')">
													<input type="submit" id="submit-btn" class="btn btn-outline-info" value="자동이체 변경 " onclick="check('modify')">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- /#page-content-wrapper -->

					</div>
					<!-- /#wrapper -->
				</section>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>

</body>

</html>
