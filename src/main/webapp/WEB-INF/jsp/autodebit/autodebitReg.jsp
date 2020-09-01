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
<title>자동이체 등록</title>
<link href="/resources/css/table.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/WEB-INF/include/navbar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-sm-8"></div>
			<div class="col-sm-4">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="transfer.do">자동이체</a></li>
					<li class="breadcrumb-item active">자동이체 등록</li>
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
									<h5 class="textarea-head">자동이체 등록</h5>
									<hr class="textarea-head-hr">
									<br>
									<form
										action="${ pageContext.request.contextPath }/autodebit/registration"
										method="POST" name="form">
										<table class="table table-bordered" id="content-table">
											<thead class="thead-light">
												<tr>
													<th scope="col" colspan="2">출금정보</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th>자동이체 구분</th>
													<td>
														<div class="radio icheck-primary">
															<label> <input type="radio" name="category"
																value="계좌이체" checked> 계좌이체
															</label> <label> <input type="radio" name="category"
																value="펀드"> 펀드
															</label> <label> <input type="radio" name="category"
																value="적금/청약"> 적금/청약
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">출금계좌번호</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<select id="accNO" name="accNo"
																	class="custom-select"
																	aria-label="Example select with button addon">
																	<option value="$(this)" selected disabled>출금계좌
																		선택</option>
																	<c:forEach items="${ accountList }" var="accList"
																		varStatus="loop">
																		<option class="accNo" value=${ accList.accNo }>${ accList.accNo }</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">계좌 비밀번호</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<input type="password" name="password"
																	class="form-control" placeholder="비밀번호 4자리 입력"
																	aria-label="Recipient's username"
																	aria-describedby="button-addon2">
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<br>
										<hr>

										<!-- 입금정보 -->

										<table class="table table-bordered" id="content-table">
											<thead class="thead-light">
												<tr>
													<th scope="col" colspan="2">입금정보</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th>입금은행</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<select name="bankCode" class="custom-select"
																	id="inputGroupSelect04"
																	aria-label="Example select with button addon">
																	<option selected>은행명</option>
																	<option value="081" selected>하나은행</option>
																	<option value="004">국민은행</option>
																	<option value="088">신한은행</option>
																	<option value="020">우리은행</option>
																	<option value="003">기업은행</option>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">입금계좌번호</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<input type="text" class="form-control" name="oppAccNo"
																	placeholder=" '-' 없이 입력 ">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">이체금액</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<input type="text" name="setMoney" class="form-control"
																	placeholder="이체금액">
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>

										<!-- 자동이체정보 -->
										<table class="table table-bordered" id="content-table">
											<thead class="thead-light">
												<tr>
													<th scope="col" colspan="2">자동이체정보</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th>이체지정일</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<select name="cycle" class="custom-select"
																	aria-label="Example select with button addon">
																	<option selected>이체주기</option>
																	<option class="" value="1m">1개월</option>
																	<option class="" value="2m">2개월</option>
																	<option class="" value="3m">3개월</option>
																	<option class="" value="6m">6개월</option>
																	<option class="" value="1y">1년</option>
																	<option class="" value="1w">매주</option>
																	<option class="" value="1d">매일</option>
																</select> <select name="setDate" class="custom-select"
																	aria-label="Example select with button addon">
																	<option value="" selected>이체지정일</option>
																	<option class="" value="1">1</option>
																	<option class="" value="2">2</option>
																	<option class="" value="3">3</option>
																	<option class="" value="4">4</option>
																	<option class="" value="5">5</option>
																	<option class="" value="6">6</option>
																	<option class="" value="7">7</option>
																	<option class="" value="8">8</option>
																	<option class="" value="9">9</option>
																	<option class="" value="10">10</option>
																	<option class="" value="11">11</option>
																	<option class="" value="12">12</option>
																	<option class="" value="13">13</option>
																	<option class="" value="14">14</option>
																	<option class="" value="15">15</option>
																	<option class="" value="16">16</option>
																	<option class="" value="17">17</option>
																	<option class="" value="18">18</option>
																	<option class="" value="19">19</option>
																	<option class="" value="20">20</option>
																	<option class="" value="21">21</option>
																	<option class="" value="22">22</option>
																	<option class="" value="23">23</option>
																	<option class="" value="24">24</option>
																	<option class="" value="25">25</option>
																	<option class="" value="26">26</option>
																	<option class="" value="27">27</option>
																	<option class="" value="28">28</option>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">이체시작일</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<input type="date" class="form-control" name="startDate">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">이체종료일</th>
													<td>
														<div class="input-group mb-3">
															<input type="date" class="form-control" name="endDate">
														</div>
														<div class="display_table">
															<div class="input-group mb-3">
																<p>
																	<input type="checkbox" name="indefinite"
																		style="margin-left: 5px; margin-top: 15px;"> <label
																		style="margin-left: 5px;"> 지정하지 않음 (약정 해지 할
																		때까지 계속 자동이체)</label>
																</p>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>

										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" value="자동이체 등록진행"
													class="btn btn-outline-info">
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