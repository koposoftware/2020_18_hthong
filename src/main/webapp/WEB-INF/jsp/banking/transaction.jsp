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
<link href="/resources/css/style-dash.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<title>거래내역조회</title>
<style>
#inquiry-date-table {
	width: 200px;
	background-color: black;
	margin-right: 0px;
}

#inquiry-date-group {
	width: 100px;
	background-color: black;
}

.radio label input {
	margin-right: 3px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function() {
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		
		$("#transListBtn").on("click", function() {
			
			let accNo = $('#accNo').val(); // 계좌번호
			let searchType = $(':radio[name=searchType]:checked').val();
		
			$.ajax({
				url : '${ pageContext.request.contextPath }/banking/transaction',
				type : 'post',
				data : $('#serchForm').serialize(),
				success : function(data) {
					$('#search_list').empty();
					$('#search_head').empty();
					
					if(data == '') {
						
						let str1 = '';
						str1 += '<tr class="table-highlight" id="tr-head">'
						str1 +=		'<th scope="col" style="text-align: center">거래일시</th>'
						str1 +=		'<th scope="col" style="text-align: center">구분</th>'
						str1 +=		'<th scope="col" style="text-align: center">적요</th>'
						str1 +=		'<th scope="col" style="text-align: center">입금액</th>'
						str1 +=		'<th scope="col" style="text-align: center">출금액</th>'
						str1 +=		'<th scope="col" style="text-align: center">잔액(원)</th>'
						str1 +=	'</tr>'
						
						let str2 = '';
						str2 += '<tr id="tr-con" style="min-height: 100px;">'
						str2 += '<td colspan="6" style="text-align: center;">거래내역이 존재하지 않습니다</td>'
						str2 += '</tr>'
						
						$('#search_head').append(str);
						$('#search_list').append(str2);
						
					} else{
						if(searchType == 'listAll'){
							
							let str1 = '';
							str1 += '<tr class="table-highlight" id="tr-head">'
							str1 +=		'<th scope="col" style="text-align: center">거래일시</th>'
							str1 +=		'<th scope="col" style="text-align: center">구분</th>'
							str1 +=		'<th scope="col" style="text-align: center">적요</th>'
							str1 +=		'<th scope="col" style="text-align: center">입금액</th>'
							str1 +=		'<th scope="col" style="text-align: center">출금액</th>'
							str1 +=		'<th scope="col" style="text-align: center">잔액(원)</th>'
							str1 +=	'</tr>'
							
							$('#search_head').append(str1);

							$(data).each(function() {

								let str2 = '';
								str2 += '<tr id="tr-con" style="min-height: 100px;">'
								str2 += '<td style="text-align: center; vertical-align: middle;">' + this.transDate + '</td>'
								str2 += '<td style="text-align: center">' + this.summary + '</td>'
								str2 += '<td style="text-align: center">' + this.memo + '</td>'
								str2 += '<td style="text-align: center">' + numberWithCommas(this.deposit) + '</td>'
								str2 += '<td style="text-align: center">' + numberWithCommas(this.withdraw) + '</td>'
								str2 += '<td style="text-align: center">' + numberWithCommas(this.balance) + '</td>'
								str2 += '</tr>';
								
								$('#search_list').append(str2);
							})
						} else if(searchType == 'withdraw') {
							
							let str1 = '';
							str1 += '<tr class="table-highlight" id="tr-head">'
							str1 +=		'<th scope="col" style="text-align: center">거래일시</th>'
							str1 +=		'<th scope="col" style="text-align: center">구분</th>'
							str1 +=		'<th scope="col" style="text-align: center">적요</th>'
							str1 +=		'<th scope="col" style="text-align: center">출금액</th>'
							str1 +=		'<th scope="col" style="text-align: center">잔액(원)</th>'
							str1 +=	'</tr>'
							
							$('#search_head').append(str1);
							
							$(data).each(function() {

								let str2 = '';
								str2 += '<tr id="tr-con" style="min-height: 100px;">'
								str2 += '<td style="text-align: center; vertical-align: middle;">' + this.transDate + '</td>'
								str2 += '<td style="text-align: center">' + this.summary + '</td>'
								str2 += '<td style="text-align: center">' + this.memo + '</td>'
								str2 += '<td style="text-align: center">' + numberWithCommas(this.withdraw) + '</td>'
								str2 += '<td style="text-align: center">' + numberWithCommas(this.balance) + '</td>'
								str2 += '</tr>';
								
								$('#search_list').append(str2);
							})
						} else if(searchType == 'deposit') {
							
							let str1 = '';
							str1 += '<tr class="table-highlight" id="tr-head">'
							str1 +=		'<th scope="col" style="text-align: center">거래일시</th>'
							str1 +=		'<th scope="col" style="text-align: center">구분</th>'
							str1 +=		'<th scope="col" style="text-align: center">적요</th>'
							str1 +=		'<th scope="col" style="text-align: center">입금액</th>'
							str1 +=		'<th scope="col" style="text-align: center">잔액(원)</th>'
							str1 +=	'</tr>'
							
							$('#search_head').append(str1);
							
							$(data).each(function() {
								let str2 = '';
								str2 += '<tr id="tr-con" style="min-height: 100px;">'
								str2 += '<td style="text-align: center; vertical-align: middle;">' + this.transDate + '</td>'
								str2 += '<td style="text-align: center">' + this.summary + '</td>'
								str2 += '<td style="text-align: center">' + this.memo + '</td>'
								str2 += '<td style="text-align: center">' + numberWithCommas(this.deposit) + '</td>'
								str2 += '<td style="text-align: center">' + numberWithCommas(this.balance) + '</td>'
								str2 += '</tr>';
								
								$('#search_list').append(str2);
							})
						}
					}
				},
				error : function() {
					alert("실패");
				}
			})
		})
	}); 
</script>
<link href="/resources/css/table.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/inquiry">거래내역조회</a></li>
					<li class="breadcrumb-item active"><a
						href="${pageContext.request.contextPath }/inquiry">조회</a></li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/inquirySidebar.jsp" />
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
									<h5 class="textarea-head">거래내역조회</h5>
									<hr class="textarea-head-hr">
									<br>
									<form
										action="${ pageContext.request.contextPath }/banking/transaction"
										method="post" id="serchForm" name="serchForm">
										<table class="table table-bordered" id="content-table">
											<tbody>
												<tr>
													<th scope="row" class="table-highlight"
														style="text-align: center; vertical-align: middle;">계좌번호</th>
													<td colspan="3">
														<div class="display_table">
															<div class="input-group mb-3">
																<select id="accNo" name="accNo" class="custom-select"
																	aria-label="Example select with button addon">
																	<option value="$(this)" selected disabled>출금계좌
																		선택</option>
																	<c:forEach items="${ transAccList }" var="accList"
																		varStatus="loop">
																		<option class="accNo" value=${ accList.accNo }>
																			${ accList.accNo }</option>
																		<!-- example -->
																	</c:forEach>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" class="table-highlight"
														style="text-align: center; vertical-align: middle;">조회기간</th>
													<td>
														<div class="input-group mb-3">
															<input type="date" id="startDate" class="form-control"
																name="startDate">
														</div>
													</td>
													<td><p
															style="vertical-align: middle; font-size: 20px; font-weight: 700;">~</p>
													</td>
													<td>
														<div class="input-group mb-3">
															<input type="date" id="endDate" class="form-control"
																name="endDate">
														</div>
													</td>
												</tr>

												<tr>
													<th scope="row" class="table-highlight"
														style="text-align: center; vertical-align: middle;">조회내용</th>
													<td colspan="3">
														<div class="radio icheck-primary">
															<span class="radio"> <label><input
																	type="radio" name="searchType" value="listAll"
																	checked="checked" />전체(입금 + 출금)</label>
															</span> <span class="radio"> <label> <input
																	type="radio" name="searchType" value="withdraw" />출금내역
															</label>
															</span> <span class="radio"> <label><input
																	type="radio" name="searchType" value="deposit" /> 입금내역</label>
															</span>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" class="table-highlight"
														style="text-align: center; vertical-align: middle;">정렬방식</th>
													<td colspan="3">
														<div class="display_table">
															<div class="input-group mb-3">
																<span class="radio"><label> <input
																		type="radio" name="searchCnt" value="15" /> 15건
																</label> </span> <span class="radio"><label> <input
																		type="radio" name="searchCnt" value="30"
																		checked="checked" /> 30건
																</label> </span> <span class="radio"> <label><input
																		type="radio" name="searchCnt" value="50" />50건</label>
																</span> <span class="radio-order"> <label><input
																		type="radio" name="searchSort" checked="checked"
																		value="desc" />최근거래 먼저</label>
																</span> <span class="radio-order"> <label><input
																		type="radio" name="searchSort" value="asc" /> 과거거래 먼저</label>
																</span>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</form>
									<%-- button 영역 : 버튼 --%>
									<div class="btn-area">
										<div class="btn-wrap">
											<button type="submit" id="transListBtn"
												class="btn btn-outline-info">조회</button>
										</div>
									</div>
								</div>
								<br>

								<%-- textarea 영역 : ajax --%>
								<div class="textarea_wrap">
									<h5 class="textarea-head">거래내역</h5>
									<hr class="textarea-head-hr">
									<br>
									<form method="post" name="form">
										<table class="table table-bordered" id="content-table">
											<thead id="search_head">
											</thead>
											<tbody id="search_list">
											</tbody>
										</table>
									</form>
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
