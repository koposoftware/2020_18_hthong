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
<link href="/Final-Project/resources/css/table.css" rel="stylesheet">

<style>
.btn-area {
	margin-top: 10px;
	margin-bottom: 10px;
}

.btn.btn-outline-info:first-child {
	float: left;
	margin-right: 20px;
}
</style>
<title>통장전환</title>
<script>
	function doCheck() {
		
		// 전환통장 선택
		if($("input:checkbox[name=transformCheck]:checked").length < 1) {
			alert("전환하려는 통장을 선택하세요");
			$("input:checkbox[name=transformCheck]").focus();
			return false
		}
		
		// 약관 모두 동의여부
		if($("input:checkbox[name=checkTerms]:checked").length < 4) {
			alert("약관동의에 동의해주세요");
			$("input:checkbox[name=checkTerms]").focus();
			return false
		}
		
		if($("input:checkbox[name=lastCheck]:checked").length < 1) {
			alert("상품 이해여부 확인을 체크해주세요");
			$("input:checkbox[name=lastCheck]").focus();
			return false
		}
		
		return true;
	}
	
	function allChk() {
		if($("#allCheck").prop("checked")){
			$("#content-table2 input[type=checkbox]").prop("checked", true);
		}
		else {
			$("#content-table2 input[type=checkbox]").prop("checked", false); 
		} 
	}
	
	function openManual() {

		window.name = "parentForm";
		window.open("pManual.jsp", "chkForm",
				"width=1000, height=700, resizable = yes, scrollbars = no, ");
	}


</script>
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
					<li class="breadcrumb-item"><a href="#">예금</a></li>
					<li class="breadcrumb-item active">통장전환</li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/depositSidebar.jsp" />

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
									<h5 class="textarea-head">통장전환</h5>
									<hr class="textarea-head-hr">
									<br>

									<%-- 통장전환 form --%>
									<form
										action="<%=request.getContextPath()%>/account/changeAccForm.jsp"
										method="POST" name="checkForm" onsubmit="return doCheck()">
										<table class="table table-bordered" id="content-table1">
											<tr class="table-highlight" id="tr-head">
												<th class=""
													style="width: 10%; text-align: center; vertical-align: middle;">전환<br>여부
												</th>
												<th class=""
													style="width: 40%; text-align: center; vertical-align: middle;">예금종류</th>
												<th class=""
													style="width: 30%; text-align: center; vertical-align: middle;">계좌번호</th>
												<th class=""
													style="width: 20%; text-align: center; vertical-align: middle;">예금잔액(원)</th>
											</tr>
											<tr>
												<td style="text-align: center; vertical-align: middle;"><input
													type="checkbox" name="transformCheck"></td>
												<td style="text-align: center; vertical-align: middle;">수시입출금
													통장만가능(조건문)</td>
												<td style="text-align: center; vertical-align: middle;">15458510</td>
												<td style="text-align: center; vertical-align: middle;">520,001</td>
											</tr>
										</table>


										<%-- 약관 동의 --%>
										<br>
										<h5 class="textarea-head-mid">약관동의 및 금리확인</h5>
										<p class="textarea-head-ex">상품가입 등 금융거래를 위하여 관련 법률과 규정에 따라
											동의 및 확인이 필요합니다.</p>
										<table class="table table-bordered" id="content-table2">
											<tr class="table-highlight" id="tr-head">
												<th colspan="2" style="text-align: center">통장약관</th>
											</tr>
											<tr style="text-align: center; vertical-align: middle;">
												<td>통장전환 약관 전체 동의</td>
												<td><label><input type="checkbox"
														name="allCheck" onclick="allChk()" id="allCheck">
														전체동의</label></td>
											</tr>
											<tr style="text-align: center; vertical-align: middle;">
												<td>예금거래기본 약관</td>
												<td><label><input type="checkbox"
														name="checkTerms"> 약관동의</label></td>
											</tr>
											<tr style="text-align: center; vertical-align: middle;">
												<td>입출금이 자유로운 예금 약관</td>
												<td><label><input type="checkbox"
														name="checkTerms"> 약관동의</label></td>
											</tr>
											<tr style="text-align: center; vertical-align: middle;">
												<td>비과세종합저축 특약</td>
												<td><input type="checkbox" name="checkTerms"> <label>약관동의</label></td>
											</tr>
											<tr style="text-align: center; vertical-align: middle;">
												<td>하나 원픽 통장 특약</td>
												<td><label><input type="checkbox"
														name="checkTerms"> 약관동의</label></td>
											</tr>
										</table>

										<%-- button --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<jsp:include page="/WEB-INF/include/pManual.jsp" />
												<jsp:include page="/WEB-INF/include/noticeRate.jsp" />
											</div>
										</div>

										<%-- message --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<label><input type="checkbox" name="lastCheck">
													본인은 위 안내에 대해 확인하고 이해합니다.</label>
											</div>
										</div>

										<%-- button --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" class="btn btn-outline-info" value="확인">
												<input type="button" class="btn btn-outline-info" value="취소"
													onclick="javascript:history.go(-1)">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- /#page-content-wrapper -->
	<!-- Footer -->
	<footer>
		<jsp:include page="/WEB-INF/include/footer.jsp" />
	</footer>
	<!-- Bootstrap core JavaScript -->
	<script src="/Final-Project/resources/css/vendor/jquery/jquery.min.js"></script>
	<script
		src="/Final-Project/resources/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
