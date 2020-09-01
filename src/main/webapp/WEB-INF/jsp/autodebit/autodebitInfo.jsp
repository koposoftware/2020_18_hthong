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
<title>자동이체 조회</title>
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
					<li class="breadcrumb-item active">자동이체 조회</li>
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
										action="${ pageContext.request.contextPath }/autodebit/info"
										method="POST" name="form">
										<table class="table table-bordered" id="content-table">
											<thead class="thead-light">
												<tr>
												</tr>
											</thead>
											<tbody>
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
																		<option class="accNo" value=${ accList.accNo }>
																			${ accList.accNo }</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th>자동이체종류</th>
													<td>
														<div class="display_table">
															<div class="input-group mb-3">
																<select name="" class="custom-select"
																	aria-label="Example select with button addon">
																	<option value="" selected>전체</option>
																	<option class="" value="">계좌이체</option>
																	<option class="" value="">펀드</option>
																	<option class="" value="">적금/청약</option>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th>처리상태</th>
													<td>
														<div class="radio icheck-primary">
															<label> <input type="radio" name="radioBtn"
																value="" checked> 정상
															</label> <label> <input type="radio" name="radioBtn"
																value=""> 해지
															</label> <label> <input type="radio" name="radioBtn"
																value=""> 전체
															</label>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" value="조회" class="btn btn-outline-info">
											</div>
										</div>
									</form>

									<h2>ajax로 결과 보여주기</h2>

									<div>
										<table class="table table-bordered" id="content-table">
											<thead class="thead-light">
												<tr>
													<th>번호</th>
													<th>구분</th>
													<th>예금주</th>
													<th>이체금액</th>
													<th>이체주기/일자</th>
													<th>이체신청일</th>
													<th>이체종료일</th>
													<th>이체시작일</th>
													<th>해지일</th>
													<th>상태</th>
													<th>해지선택</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>출금이체</td>
													<td>홍길동</td>
													<td>100,000</td>
													<td>30일 / 매월 1일</td>
													<td>2020-02-02</td>
													<td>2030-02-02</td>
													<td>2020-02-10</td>
													<td></td>
													<td>정상</td>
													<td><input type="checkbox" name="" value=""></td>
												</tr>
											</tbody>

										</table>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" value="해지신청"
													class="btn btn-outline-info">
											</div>
										</div>
										<div>
											<strong>페이징 처리</strong>
										</div>
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
