<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.page-footer.font-small.indigo {
	min-height: 200px;
	background-color: grey;
}
</style>
<!-- Footer -->
<footer id="footer">
	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 col-md-6 footer-info">
					<h3>하나은행</h3>
				</div>

				<div class="col-lg-2 col-md-6 footer-links">
					<h4>조회</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.request.contextPath }/inquiry">전체계좌조회</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.request.contextPath }/banking/transaction">거래내역조회</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 footer-links">
					<h4>이체</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.request.contextPath }/banking/transfer">계좌이체</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.request.contextPath }/banking/transaction">이체 결과조회</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.request.contextPath }/autodebit/info">자동이체</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 footer-links">
					<h4>원픽통장</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.request.contextPath }/product/onepick/info">통장조회</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.request.contextPath }/product/onepick/change">통장전환</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 footer-links">
					<h4>테스트</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="${ pageContext.request.contextPath }/email_form.jsp">이메일 폼</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="copyright">
			© Copyright <strong><span>Mamba</span></strong>. All Rights Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mamba-one-page-bootstrap-template-free/ -->
			Designed by <a href="https://bootstrapmade.com/">hyuntaek-hong</a>
		</div>
	</div>

</footer>
<!-- Footer -->
