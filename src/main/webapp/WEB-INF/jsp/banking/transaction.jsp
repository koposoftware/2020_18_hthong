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
<link href="/resources/css/table.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <script>
	$(document).ready(function() {
		$('#transListBtn').click(function() {
			let accNo = document.serchForm.accNo.value;
			let startDate = document.serchForm.startDate.value;
			let endDate = document.serchForm.endDate.value;
			let searchType = document.serchForm.searchType.value;
			let searchCnt = document.serchForm.searchCnt.value;
			let searchSort = document.serchForm.searchSort.value;

			$.ajax({
				url : '${ pageContext.request.contextPath }/transaction',
				type : 'post',
				data : {
					accNo : accNo, //자바에 작성한 이름과 매핑
					startDate : startDate,
					endDate : endDate,
					searchType : searchType,
					searchCnt : searchCnt,
					searchSort : searchSort
					
				},
				success : function() {
					getReplyList(); //댓글 작성 성공 시에 추가후 댓글 리스트 불러온다
				},
				error : function() {
					alert('실패')
				},
				complete : function() { //complete 무조건 실행(finally와 동일)
					document.rform.content.value = '';
					document.rform.writer.value = '';
				}
			})
		})
	})
</script> -->
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">거래내역조회</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">조회</a></li>
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
									<form action="${ pageCotext.request.contextPath }"
										method="post" name="serchForm">
										<table class="table table-bordered" id="content-table">
											<tbody>
												<tr>
													<th scope="row" class="table-highlight"
														style="text-align: center; vertical-align: middle;">계좌번호</th>
													<td colspan="3">
														<div class="display_table">
															<div class="input-group mb-3">
																<select id="accNO" name="accNo" class="custom-select"
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
															<input type="date" class="form-control" name="startDate">
														</div>
													</td>
													<td><p
															style="vertical-align: middle; font-size: 20px; font-weight: 700;">~</p>
													</td>
													<td>
														<div class="input-group mb-3">
															<input type="date" class="form-control" name="endDate">
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
																	type="radio" name="searchType" value="withdrawal" />출금내역
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
																		type="radio" name="searchCnt" value="cntType1" /> 15건
																</label> </span> <span class="radio"><label> <input
																		type="radio" name="searchCnt" value="cntType2"
																		checked="checked" /> 30건
																</label> </span> <span class="radio"> <label><input
																		type="radio" name="searchCnt" value="cntType3" />50건</label>
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
										<br>

										<%-- button 영역 : 버튼 --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" id="transListBtn" value="조회"
													class="btn btn-outline-info">
											</div>
										</div>
									</form>
								</div>


								<%-- textarea 영역 : ajax --%>
								<div class="textarea_wrap">
									<h5 class="textarea-head">거래내역</h5>
									<hr class="textarea-head-hr">
									<br>
									<form method="post" name="form">
										<p class="textarea-sub">자유입출금</p>
										<table class="table table-bordered" id="content-table">
											<thead>
												<tr class="table-highlight" id="tr-head">
													<th scope="col" style="text-align: center">거래일시</th>
													<th scope="col" style="text-align: center">구분</th>
													<th scope="col" style="text-align: center">적요</th>
													<th scope="col" style="text-align: center">출금액</th>
													<th scope="col" style="text-align: center">입금액</th>
													<th scope="col" style="text-align: center">잔액(원)</th>
												</tr>
											</thead>
											<tbody>
												<tr id="tr-con" style="min-height: 100px;">
													<td rowspan="2"
														style="text-align: center; vertical-align: middle;"></td>
													<td style="text-align: center"></td>
													<td style="text-align: center"></td>
													<td style="text-align: center"></td>
													<td style="text-align: center"></td>
													<td style="text-align: center"></td>
												</tr>

											</tbody>
											<tr class="table-highlight">
												<td colspan="3" style="text-align: center;" id="sum-title">
													합계</td>
												<td id="sum-money" style="text-align: right; color: red;"></td>
												<td id="sum-money" style="text-align: right; color: blue;"></td>
												<td colspan="2"></td>
											</tr>
										</table>

										<%-- button 영역 : 버튼 --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<p>페이징 처리</p>
											</div>
										</div>
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
