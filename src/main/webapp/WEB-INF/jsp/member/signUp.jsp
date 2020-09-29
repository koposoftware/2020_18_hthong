<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${ pageContext.request.contextPath }/resources/css/table.css"
	rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/images/fav.png">
<title>회원가입</title>
<style>
.input-group2 {
	float: left;
}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function doWrite() {
		let path = document.signUpForm;
		
		// validation
		let regMobile = /^\d{3}-\d{3,4}-\d{4}$/;	//휴대전화 번호 정규식
		let emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	//이메일 정규식
		
		if (path.id.value.length < 4) {
			alert("ID를 4자리 이상 입력하세요.");
			path.id.focus();
			return false;
		}

		if (path.password.value.length < 6) {
			alert("비밀번호를 6자리 이상 입력하세요.");
			path.password.focus();
			return false;
		}

		if (path.chkPassword.value != path.password.value) {
			alert("비밀번호를 동일하게 입력하세요");
			path.chkPassword.focus();
			return false;
		}

		if (path.name.value == '') {
			alert("이름을 입력해주세요");
			path.name.focus();
			return false;
		}
		
		if (path.ssn1.value.length < 6 ) {
			alert("주민번호 앞자리 6개를 입력해주세요");
			path.ssn1.focus();
			return false;
		}
		
		if (path.ssn2.value.length < 7 ) {
			alert("주민번호 뒷자리 7개를 입력해주세요");
			path.ssn2.focus();
			return false;
		}
		
		if (path.email.value == '') {
			alert("이메일을 입력해주세요");
			path.email.focus();
			return false;
		}
		
		if (path.mobile.value == '') {
			alert("휴대전환 번호를 입력해주세요");
			path.mobile.focus();
			return false;
		}
	
		if(!emailRule.test($("input[id='email']").val())) {            
			alert("이메일 형식이 잘못되었습니다");
			return false;
		}
		
		if (!regMobile.test($("input[id='mobile']").val())) {
			alert("휴대전화 형식이 잘못되었습니다");
			path.mobile.focus();
			return false;
		}
		return true;
	}
	// 아이디 중복체크 화면open
	function openIdChk() {

		window.name = "parentForm";
		window.open("${ pageContext.request.contextPath }/checkId", "chkForm",
				"width=500, height=300, resizable = no, scrollbars = no");
	}

	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.
	function inputIdChk() {
		document.signUpForm.idDuplication.value = "idUncheck";
	}

	// input 창에 선택한 도메인을 넣어주는 코드
	// controller에 넘겨줄 때는 selectEmail 값이 날아간다
	function checkEmail() {
		$("#selectEmail option:selected").each(function() {

			if ($(this).val() == 'direct') {
				$("#email_domain").val('')
				$("#email_domain").attr("disabled", false);
			} else {
				$("#email_domain").val($(this).text());
				$("#email_domain").attr("disabled", true);
			}
		})
	}

	/*
	// 우편번호 검색기능
	function sample6_execDaumPostcode() {
	   new daum.Postcode({
	       oncomplete: function(data) {
	           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	           var addr = ''; // 주소 변수
	           var extraAddr = ''; // 참고항목 변수

	           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	               addr = data.roadAddress;
	           } else { // 사용자가 지번 주소를 선택했을 경우(J)
	               addr = data.jibunAddress;
	           }

	           // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	           if(data.userSelectedType === 'R'){
	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraAddr !== ''){
	                   extraAddr = ' (' + extraAddr + ')';
	               }
	               // 조합된 참고항목을 해당 필드에 넣는다.
	               document.getElementById("sample6_extraAddress").value = extraAddr;
	           
	           } else {
	               document.getElementById("sample6_extraAddress").value = '';
	           }
	           // 우편번호와 주소 정보를 해당 필드에 넣는다.
	           document.getElementById('sample6_postcode').value = data.zonecode;
	           document.getElementById("sample6_address").value = addr;
	           // 커서를 상세주소 필드로 이동한다.
	           document.getElementById("sample6_detailAddress").focus();
	       }
	   }).open();
	}
	 */
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
					<li class="breadcrumb-item"><a href="#">회원</a></li>
					<li class="breadcrumb-item active">회원가입</li>
				</ol>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/include/memberSidebar.jsp" />

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
									<h5 class="textarea-head">회원가입</h5>
									<hr class="textarea-head-hr">
									<br>

									<%-- 계좌가입 form --%>
									<form action="${ pageContext.request.contextPath }/signUp"
										method="POST" name="signUpForm" onsubmit="return doWrite()"
										accept-charset="utf-8">
										<table class="table table-bordered" id="content-table">
											<tr>
												<th class="id">아이디</th>
												<td>
													<div class="row">
														<div class="col-xs-6 col-md-6" style="">
															<input type="text" class="form-control" id="id" name="id"
																placeholder="아이디" onkeydown=inputIdChk()>
														</div>
														<div class="col-xs-6 col-md-6">
															<input type="button" class="btn btn-secondary btn-sm"
																value="중복확인" onclick="openIdChk()" style="height: 100%;">
															<input type="hidden" name="idDuplication"
																value="idUncheck">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th class="password">비밀번호</th>
												<td>
													<div class="row">
														<div class="col-xs-6 col-md-6">
															<input type="password" class="form-control" id="password"
																name="password" placeholder="비밀번호">
															<div style="height: 20px;"></div>
															<input type="password" class="form-control"
																id="chkPassword" name="checkpassword"
																placeholder="비밀번호 확인">
														</div>
														<div class="col-xs-6 col-md-6">
															<small>비밀번호는 6자리 이상을 입력하세요</small>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th class="name">이름</th>
												<td><input type="text" class="form-control" id="name"
													name="name" placeholder="이름"></td>
											</tr>
											<tr>
												<th class="ssn">주민번호</th>
												<td><input class="form-control-col" type="text"
													name="ssn1" id="ssn1" maxlength="6"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													&macr; <input class="form-control-col" type="password"
													name="ssn2" id="ssn2" maxlength="7"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
											</tr>

											<tr>
												<th class="email">이메일</th>
												<td>
													<div class="row">
														<div class="col-xs-6 col-md-6">
															<input class="form-control" type="text" name="email"
																id="email" placeholder="example@hana.com">
														</div>
													</div>
											</tr>
											<tr>
												<th class="accNickname">휴대전화</th>
												<td><input class="form-control" type="text" id="mobile"
													name="mobile" placeholder="010-0000-0000">
													</td>

											</tr>
											<!-- <tr>
												<th class="address">주소</th>
												<td><input type="text" id="sample6_postcode"
													placeholder="우편번호"> <input type="button"
													class="btn btn-outline-success"
													onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
													<input type="text" id="sample6_address" placeholder="주소"><br>
													<input type="text" id="sample6_detailAddress"
													placeholder="상세주소"> <input type="text"
													id="sample6_extraAddress" placeholder="참고항목"></td>
											</tr> -->
										</table>

										<%-- button 영역 : 버튼 --%>
										<div class="btn-area">
											<div class="btn-wrap">
												<input type="submit" class="btn btn-outline-info" id="c-btn"
													value="회원가입"> <input type="button"
													class="btn btn-outline-info" value="취소"
													onclick="javascript:history.go(-1)">
											</div>
										</div>
									</form>
									<%-- ./계좌가입 form--%>
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
</body>

</html>
