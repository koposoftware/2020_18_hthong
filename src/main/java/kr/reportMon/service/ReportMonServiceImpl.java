package kr.ac.kopo.reportMon.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ser.AnyGetterWriter;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.ProductVO;
import kr.ac.kopo.report.dao.ReportDAO;
import kr.ac.kopo.report.vo.MailVO;
import kr.ac.kopo.report.vo.ReportTransVO;
import kr.ac.kopo.report.vo.ReportVO;

//@Service("dailyReport")
@Service
public class ReportMonServiceImpl implements ReportMonService {

	@Autowired
	private ReportDAO reportDAO;
	
	@Autowired
	private JavaMailSender mailSender;

	/**
	 * html 첨부파일 생성
	 */
	@Override
	public void makeReportExecute(ProductVO onepickInfo) throws IOException{
		
		List<ReportVO> mailsendList = reportDAO.mailsendList(onepickInfo);

		System.out.println("체크 ser : " + mailsendList.toString());

		// 정보사항 - 날짜
		Date date = new Date();
		SimpleDateFormat dateTitle = new SimpleDateFormat("YYYY년 MM월");
		SimpleDateFormat dateContent = new SimpleDateFormat("MM월");
		String setYear = dateTitle.format(date); // 오늘 연도 월
		String setMonth = dateContent.format(date); // 오늘 월
		
		// 0. 정보사항 - 개인정보
		String id = "";
		String accNo = "";
		String cusName = "";
		String email = "";
		
		// 1-1. 요약 - 예산구성
		String totalBudget = "";
		String baseMoney = "";
		String livingCost = "";
		String extraMoney = "";
		
		// 2-1. 요약 - 예산리뷰 1) top3 개요
		String transDate = "";
		String rankSum = "";

		
		// 2-2. 요약 - 예산리뷰 2) top3 세부사항
		String summary = "";
		String memo = "";
		String withdraw = "";
		String oppAccNo = "";
		
		// 3. 주차별 지출현황
		String w1 = "";
		String w2 = "";
		String w3 = "";
		String w4 = "";
		
		String perW1 = "";
		String perW2 = "";
		String perW3 = "";
		String perW4 = "";
		
		String color1 = "bg-success";
		String color2 = "bg-success";
		String color3 = "bg-success";
		String color4 = "bg-success";
		
		
		// 4. 요일별 지출현황
		String monday	= "";
		String tuesday	= "";
		String wendsday	= "";
		String thursday	= "";
		String friday	= "";
		String saturday	= "";
		String sunday	= "";
		
		
		
		

		if (mailsendList != null) {
			int i = 0;

			while (i < mailsendList.size()) {
				BufferedOutputStream bs = null;
				MailVO mailInfo = new MailVO();
				ReportTransVO transInfo = new ReportTransVO();
				
				try {
					// mailsendlist에서 고객정보 뽑아내기
					id = mailsendList.get(i).getId();				// 고객 계좌번호
					accNo = mailsendList.get(i).getAccNo();			// 고객 계좌번호
					cusName = mailsendList.get(i).getReceiver();	// 고객명
					email = mailsendList.get(i).getEmail();			// 고객 email				
					
					mailInfo.setId(id);
					mailInfo.setAccNo(accNo);
					
					System.out.println("체크1 try문 안: id - " + mailInfo.getId() + " : accNo - "  + mailInfo.getAccNo());

					////////////////////////////////////////////////////////////////////////////////
					////////////////////////////////////////////////////////////////////////////////
					
					// 1. 예산구성
					mailInfo = reportDAO.reportSummary(mailInfo);
					
					System.out.println("체크2 try문 안: " + mailInfo.toString());
					
					totalBudget = mailInfo.getTotalBudget();
					baseMoney 	= mailInfo.getBaseMoney();
					livingCost 	= mailInfo.getLivingCost();
					extraMoney 	= mailInfo.getExtraMoney();
					
					
					
					// 2-1. 예산리뷰
					List<MailVO> rankSumList = reportDAO.rankSum(mailInfo);
					
					System.out.println("체크3 try문 안: " + rankSumList.toString());
					
					
					
					
					// 2-2. 예산리뷰 - 세부사항
					List<ReportTransVO> rankTransList = new ArrayList<ReportTransVO>();
					DecimalFormat formatter = new DecimalFormat("###,###");
					
					String tranStr = "<h3>일자별 지출 TOP3</h3>\r\n"
							+ "			<p class=\"txtNotice\">이번달 지출을 가장 많은 날짜의 지출내역</p>\r\n"
							+ "			<!-- 예산리뷰 시작 -->\r\n"
							+ "				<div class=\"container-fluid\">\r\n"
							+ "					<div class=\"accordion-started accordion-bral row\">\r\n"
							+ "					<div style=\"margin-bottom: 30px;\"></div>\r\n" + "\r\n"
							;
					
					for(int k =0; k < 3; k++) {
						mailInfo.setRownum(k+1);
						rankTransList = reportDAO.rankTrans(mailInfo);
						
						tranStr +="	<!-- accordion item" + (k+1) + "-- start -->\r\n"
								+ " <div class=\"col-sm-12 col-md-12 col-lg-12\" style=\"margin-top: 30px;\"> \r\n"
								+ "	<input class=\"ac-input\" id=\"ac-" + (k+1) + "\" name=\"accordion-" + (k+1) + "\"\r\n"
								+ "		type=\"radio\" checked /> <label class=\"ac-label\" for=\"ac-" + (k+1) + "\">" + (k+1) + ". \r\n"
								+ rankTransList.get(k).getTdate().replace("/", "년 ").replace("-","월 ").replace("=", "일") + "\r\n"
								+ "<i></i>	</label>\r\n"
								+ " <div class=\"article ac-content\">\r\n"
								+ "		<table class=\"table\">\r\n"
								+ " 		<tr> \r\n"
								+ "				<th style=\"width: 20%; text-align: center; \">no</th> \r\n"
								+ "				<th style=\"width: 40%; text-align: center; \">사용처</th> \r\n"
								+ "				<th style=\"width: 40%; text-align: center; \">금액</th></tr> \r\n"	
								;
						
						for(int m = 0; m < rankTransList.size(); m++) {
							
							tranStr +="	<tr>\r\n"
									+ "	        <th scope=\"row\" style=\"width: 20%; text-align: center; \">"+ (m+1) +"</th>\r\n"
									+ "	        <td style=\"width: 40%; text-align: center; \">" + rankTransList.get(m).getMemo() + "</td>\r\n"
									+ "	        <td style=\"width: 40%; text-align: center; \">" + formatter.format(rankTransList.get(m).getWithdraw()) + "원 </td>\r\n"
									+ "	</tr>\r\n"
									;
							
							
							System.out.println("체크4 try문 안 : " + m + " ; " + k + " ; " + rankTransList.get(m).toString());
							System.out.println("체크4 try문 안2 : " + tranStr);
						}
						
						tranStr += " </table>\r\n"
								+ "	</div>\r\n"
								+ "</div>\r\n"
								;
					}
		
					
					// 3. 주차별 지출현황
					mailInfo = reportDAO.weeklySpend(mailInfo);
					
					System.out.println("체크5 try문 안: " + mailInfo.toString());
					
					w1 = mailInfo.getW1();
					w2 = mailInfo.getW2();
					w3 = mailInfo.getW3();
					w4 = mailInfo.getW4();
					
					perW1 = mailInfo.getPerW1();
					perW2 = mailInfo.getPerW2();
					perW3 = mailInfo.getPerW3();
					perW4 = mailInfo.getPerW4();
					
					if(Double.parseDouble(perW1) > 100) {
						color1 = "bg-danger";
					} 
					if(Double.parseDouble(perW2) > 100) {
						color2 = "bg-danger";
					} 
					if(Double.parseDouble(perW3) > 100) {
						color3 = "bg-danger";
					} 
					if(Double.parseDouble(perW4) > 100) {
						color4 = "bg-danger";
					}
					
					
					// 4. 요일별 지출현황
					mailInfo = reportDAO.daySpend(mailInfo);
					
					System.out.println("체크6 try문 안: " + mailInfo.toString());
					
					monday	 = mailInfo.getMonday(); 
					tuesday	 = mailInfo.getTuesday();
					wendsday = mailInfo.getWendsday();
					thursday = mailInfo.getThursday();
					friday	 = mailInfo.getFriday(); 
					saturday = mailInfo.getSaturday();
					sunday	 = mailInfo.getSunday();
					

					bs = new BufferedOutputStream(new FileOutputStream("D:/Dev/TestProject/email-form2.html"));

					String str = "<!DOCTYPE>\r\n" + "<html>\r\n" + "<head>\r\n" + "<title>월간 금융리포트</title>\r\n"
							+ "<meta charset=\"utf-8\">\r\n"
							+ "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
							+ "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n"
							+ "<!-- Custom Stylesheet -->\r\n" + "<link rel=\"stylesheet\"\r\n"
							+ "	href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">\r\n"
							+ "<link rel=\"stylesheet\"\r\n"
							+ "	href=\"http://localhost:9999/resources/css/hana_font.css\">\r\n"
							+ "<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\"\r\n"
							+ "	href=\"http://localhost:9999/resources/images/fav.png\">\r\n"
							+ "<link href=\"http://localhost:9999/resources/css/style.css\"\r\n"
							+ "	rel=\"stylesheet\">\r\n" + "<link rel=\"stylesheet\"\r\n"
							+ "	href=\"http://localhost:9999/resources/css/email.css\">\r\n"
							+ "<link rel=\"stylesheet\" href=\"http://localhost:9999/resources/css/accordion.css\">\r\n"
							+ "<script src=\"https://code.jquery.com/jquery-3.5.1.min.js\"></script>\r\n"
							+ "<script type=\"text/javascript\">\r\n" + "	var oldTab = [ 1, 1 ];\r\n"
							+ "	function tabShowHideFunc(t, n, b) { // t = this, n = x번째 탭, b = 탭아닌 버튼으로 탭 컨트롤시..\r\n"
							+ "		var gStr = t.href.split('.html#')[1];\r\n" + "		if (!gStr) {\r\n"
							+ "			gStr = t.href.split('.htm#')[1];\r\n" + "			if (!gStr) {\r\n"
							+ "				gStr = t.href.split('#')[1];\r\n" + "			}\r\n" + "		}\r\n"
							+ "		gStr1 = gStr.substr(0, gStr.length - 1);\r\n"
							+ "		var gNum = (t.href).substr((t.href).length - 1, (t.href).length);\r\n" + "\r\n"
							+ "		if (arguments[2] != undefined) {\r\n"
							+ "			if (arguments[2] == 'btn') {\r\n"
							+ "				document.getElementById(\"email\").getElementsByTagName(\"li\")[gNum - 1]\r\n"
							+ "						.getElementsByTagName(\"a\")[0].click();\r\n"
							+ "				document.documentElement.scrollTop = 0;\r\n"
							+ "				document.body.scrollTop = 0;\r\n"
							+ "			} else if (arguments[2] == 'slide') {\r\n"
							+ "				document.getElementById(\"email\").getElementsByTagName(\"li\")[3]\r\n"
							+ "						.getElementsByTagName(\"a\")[0].click();\r\n"
							+ "				setTimeout(function() {\r\n"
							+ "					var targetPos = document.getElementById(gStr).offsetTop;\r\n"
							+ "					window.scroll(0, targetPos);\r\n" + "				}, 200);\r\n"
							+ "			} else if (arguments[2] == 'voice') {\r\n"
							+ "				document.getElementById(\"email\").getElementsByTagName(\"li\")[3]\r\n"
							+ "						.getElementsByTagName(\"a\")[0].click();\r\n"
							+ "				setTimeout(function() {\r\n"
							+ "					var targetPos = document.getElementById(gStr).offsetTop;\r\n"
							+ "					window.scroll(0, targetPos);\r\n" + "				}, 200);\r\n"
							+ "			} else if (arguments[2] == 'revolg') {\r\n"
							+ "				document.getElementById(\"email\").getElementsByTagName(\"li\")[3]\r\n"
							+ "						.getElementsByTagName(\"a\")[0].click();\r\n"
							+ "				setTimeout(function() {\r\n"
							+ "					var targetPos = document.getElementById(gStr).offsetTop;\r\n"
							+ "					window.scroll(0, targetPos);\r\n" + "				}, 200);\r\n"
							+ "			} else if (arguments[2] == 'revol') {\r\n"
							+ "				document.getElementById(\"email\").getElementsByTagName(\"li\")[1]\r\n"
							+ "						.getElementsByTagName(\"a\")[0].click();\r\n"
							+ "				setTimeout(function() {\r\n"
							+ "					var targetPos = document.getElementById(gStr).offsetTop;\r\n"
							+ "					window.scroll(0, targetPos);\r\n" + "				}, 200);\r\n"
							+ "			} else if (arguments[2] == 'minus') {\r\n"
							+ "				document.getElementById(\"email\").getElementsByTagName(\"li\")[3]\r\n"
							+ "						.getElementsByTagName(\"a\")[0].click();\r\n"
							+ "				setTimeout(function() {\r\n"
							+ "					var targetPos = document.getElementById(gStr).offsetTop;\r\n"
							+ "					window.scroll(0, targetPos);\r\n" + "				}, 200);\r\n"
							+ "			}\r\n" + "		} else {\r\n"
							+ "			t.parentNode.className = \"on\";\r\n"
							+ "			document.getElementById(gStr1 + gNum).style.display = \"block\";\r\n"
							+ "			if (oldTab[n - 1] != gNum) {\r\n"
							+ "				t.parentNode.parentNode.getElementsByTagName(\"li\")[oldTab[n - 1] - 1].className = \"\";\r\n"
							+ "				document.getElementById(gStr1 + oldTab[n - 1]).style.display = \"none\";\r\n"
							+ "			}\r\n" + "			oldTab[n - 1] = gNum;\r\n" + "		}\r\n" + "	}\r\n"
							+ "	function cardToggleView() {\r\n"
							+ "		var displayOn = document.getElementById('cardUseResults').style.display;\r\n"
							+ "		if (displayOn == 'none') {\r\n"
							+ "			document.getElementById('cardUseResults').style.display = 'block';\r\n"
							+ "		} else {\r\n"
							+ "			document.getElementById('cardUseResults').style.display = 'none';\r\n"
							+ "		}\r\n" + "	}\r\n" + "	function openJoinDetail(joinCd, splrcvd, slpn) {\r\n"
							+ "		w = 720;\r\n" + "		h = 260;\r\n"
							+ "		LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;\r\n"
							+ "		TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;\r\n"
							+ "		url = \"http://www.shinhancard.com/hpp/HPPSTMTN/stmCrdA02Pu.shc?retlno=\"\r\n"
							+ "				+ joinCd + \"&slpn=\" + slpn + \"&slprcvd=\" + splrcvd;\r\n"
							+ "		window.showModalDialog(url, \"\", \"dialogLeft:\" + LeftPosition\r\n"
							+ "				+ \"px; dialogTop:\" + TopPosition\r\n"
							+ "				+ \"px; dialogWidth:720px; dialogHeight:260px; status:no;\");\r\n"
							+ "	}\r\n" + "</script>\r\n" + "<script>\r\n" + "	$(document).ready(function() {\r\n"
							+ "		$(\".ac-label\").click(function(e) {\r\n" + "			e.preventDefault();\r\n"
							+ "			$check = $(this).prev();\r\n" + "			if ($check.prop('checked'))\r\n"
							+ "				$check.prop(\"checked\", false);\r\n" + "			else\r\n"
							+ "				$check.prop(\"checked\", true);\r\n" + "		});\r\n" + "	});\r\n"
							+ "</script>\r\n" + "<style>\r\n" + "body {\r\n" + "	font-family: HanaM;\r\n" + "}\r\n"
							+ "\r\n" + "h3 {\r\n" + "	font-size: 20pt;\r\n" + "	font-family: HanaB;\r\n" + "}\r\n"
							+ "\r\n" + ".txtNotice{\r\n" + "	font-size: 10pt;\r\n" + "}\r\n" + "\r\n"
							+ ".progress {\r\n" + "	height: 20px;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n"
							+ "<body>\r\n" + "	<div id=\"skipNavi\">\r\n"
							+ "		<a href=\"#content\">본문 바로가기</a>\r\n" + "	</div>\r\n"
							+ "	<div class=\"wrap\">\r\n" + "		<!-- header 시작-->\r\n"
							+ "		<div class=\"header\">\r\n" + "			<h1>hana bank</h1>\r\n"
							+ "			<!-- 	<div class=\"topMenu\">\r\n" + "				<a\r\n"
							+ "					href=\"https://www.shinhancard.com/mob/MOBFM151N/MOBFM151C01.shc?crustMenuId=ms337\"\r\n"
							+ "					target=\"_blank\" title=\"새창열림\" class=\"btnCntGray\"><span>E-mail상담</span></a>\r\n"
							+ "				<a\r\n"
							+ "					href=\"https://www.shinhancard.com/mob/MOBFM016N/MOBFM016C01.shc?crustMenuId=ms542\"\r\n"
							+ "					target=\"_blank\" title=\"새창열림\" class=\"btnCntGray\"><span>고객정보변경</span></a>\r\n"
							+ "			</div> -->\r\n" + "\r\n" + "		</div>\r\n" + "		<!-- header 끝-->\r\n"
							+ "		<!-- content 시작 -->\r\n" + "		<div class=\"content\" id=\"content\"\r\n"
							+ "			style=\"padding-left: 20px; padding-right: 20px;\">\r\n"
							+ "			<div class=\"receiveDate\">\r\n" + "				<span class=\"date\"> "
							+ setYear + " </span><span class=\"txt_emailbill\"\r\n"
							+ "					style=\"font-size: 25px; margin-left: 34px;\"> 월간 금융리포트</span>\r\n"
							+ "			</div>\r\n"
							+ "			<ul class=\"mailGuideTab tab3 emailTab\" id=\"email\">\r\n"
							+ "				<li class=\"on\"><a href=\"#email01\"\r\n"
							+ "					onclick=\"tabShowHideFunc(this,1); return false;\">요약</a></li>\r\n"
							+ "				<li><a href=\"#email02\"\r\n"
							+ "					onclick=\"tabShowHideFunc(this,1); return false;\">주차별 지출</a></li>\r\n"
							+ "				<li><a href=\"#email03\"\r\n"
							+ "					onclick=\"tabShowHideFunc(this,1); return false;\">요일별 지출</a></li>\r\n"
							+ "			</ul>\r\n"
							+ "			<!-- 요약------------------------------------------------------------------------------------------------------------------------------------ -->\r\n"
							+ "			<div id=\"email01\" style=\"display: block\">\r\n"
							+ "				<h2 class=\"hide\">요약</h2>\r\n"
							+ "				<!-- <a href=\"javascript:PTM_ShinhanPrint('B_A_email01');\"\r\n"
							+ "					class=\"btnCntGray printBtn\"><span>인쇄하기</span></a> -->\r\n"
							+ "				<p class=\"txtType1\">\r\n" + "					<strong>" + cusName
							+ " 님</strong> 하나은행을 이용해주셔서 감사합니다.<br /> <strong>" + setMonth + "</strong>\r\n"
							+ "					금융리포트입니다.\r\n" + "				</p>\r\n" + "\r\n"
							+ "				<div class=\"cardInfo mgtS\">\r\n"
							+ "					<span class=\"cardInfoli01\"> <strong>상품명 : 하나원픽 통장</strong>\r\n"
							+ "					</span> <span class=\"cardInfoli02\"> <strong>계좌번호 :\r\n"
							+  accNo + "(하나은행)</strong>\r\n"
							+ "					</span>\r\n" + "				</div>\r\n" + "\r\n"
							+ "				<!-- 월간 예산 구성------------------------------------------------------------------------------------------------------------------------------------ -->\r\n"
							+ "				<h3>예산구성</h3>\r\n" + "				<p class=\"txtNotice\">" + setYear + " "
							+  cusName + " 님께서 설정하신 예산구성입니다.</p>\r\n" + "				<!-- 예산구성 시작 -->\r\n"
							+ "				<div class=\"cardLife\">\r\n" + "					<div class=\"row\">\r\n"
							+ "						<div class=\"col\">\r\n"
							+ "							<div class=\"card-body\">\r\n"
							+ "								<canvas id=\"pieChart\" width=\"350\" height=\"300\"></canvas>\r\n"
							+ "							</div>\r\n" + "						</div>\r\n"
							+ "					</div>\r\n" + "					<!-- 예산구성 끝 -->\r\n" + "\r\n" + "\r\n"
							+ "					<!-- 요일별 평균지출액------------------------------------------------------------------------------------------------------------------------------------ -->\r\n"
							;
						str += tranStr;
					
					
						str += "							<!-- accordion item 3 -- end -->\r\n"
							+ "						</div>\r\n" + "					</div>\r\n"
							+ "					<!-- 예산리뷰 끝 -->\r\n" + "				</div>\r\n"
							+ "			</div>\r\n"
							+ "			<!-- 요약 끝------------------------------------------------------------------------------------------------------------------------------------ -->\r\n"
							+ "\r\n" + "\r\n" + "\r\n" + "\r\n"
							+ "			<!-- 주차별 지출현황------------------------------------------------------------------------------------------------------------------------------------ -->\r\n"
							+ "			<div id=\"email02\">\r\n"
							+ "				<h2 class=\"hide\">주차별 지출현황</h2>\r\n" + "\r\n"
							+ "				<h3>주차별 지출현황</h3>\r\n"
							+ "				<p class=\"txtNotice\">이번달 주차별 지출현황을 확인할 수 있습니다.</p>\r\n" + "\r\n"
							+ "				<div class=\"col-md-12\" style=\"margin-top: 50px;\">\r\n"
							+ "					<div class=\"card\">\r\n"
							+ "						<div class=\"card-body\">\r\n"
							+ "							<!-- <h4 class=\"card-title\" style=\"font-size: 14pt; font-weight: 800;\">"
							+ setMonth + " 주차별 지출</h4> -->\r\n" + "							\r\n"
							+ "							<h5 class=\"mt-3\" style=\"font-size: 12pt; font-weight: 800;\">\r\n"
							+ "								1주차 <span class=\"float-right\">" + perW1 + "%</span>\r\n"
							+ "							</h5>\r\n"
							+ "							<div class=\"progress\">\r\n"
							+ "								<div class=\"progress-bar " + color1 + " wow  progress-\"\r\n"
							+ "									style=\"width: "+ perW1 + "%;\" role=\"progressbar\">\r\n"
							+ "									<span class=\"sr-only\">60% Complete</span>\r\n"
							+ "								</div>\r\n" + "							</div>\r\n"
							+ "							\r\n"
							+ "							<h5 class=\"mt-3\" style=\"font-size: 12pt; font-weight: 800;\">\r\n"
							+ "								2주차 <span class=\"float-right\">" + perW2 + "%</span>\r\n"
							+ "							</h5>\r\n"
							+ "							<div class=\"progress\">\r\n"
							+ "								<div class=\"progress-bar " + color2 + " wow  progress-\"\r\n"
							+ "									style=\"width: " + perW2 + "%;\" role=\"progressbar\">\r\n"
							+ "									<span class=\"sr-only\">60% Complete</span>\r\n"
							+ "								</div>\r\n" + "							</div>\r\n"
							+ "							\r\n"
							+ "							<h5 class=\"mt-3\" style=\"font-size: 12pt; font-weight: 800;\">\r\n"
							+ "								3주차 <span class=\"float-right\">" + perW3 + "%</span>\r\n"
							+ "							</h5>\r\n"
							+ "							<div class=\"progress\">\r\n"
							+ "								<div class=\"progress-bar " + color3 + " wow  progress-\"\r\n"
							+ "									style=\"width: " + perW3 + "%;\" role=\"progressbar\">\r\n"
							+ "									<span class=\"sr-only\">60% Complete</span>\r\n"
							+ "								</div>\r\n" + "							</div>\r\n"
							+ "							\r\n"
							+ "							<h5 class=\"mt-3\" style=\"font-size: 12pt; font-weight: 800;\">\r\n"
							+ "								4주차 <span class=\"float-right\">"+ perW4 +"%</span>\r\n"
							+ "							</h5>\r\n"
							+ "							<div class=\"progress\">\r\n"
							+ "								<div class=\"progress-bar " + color4 + " wow  progress-\"\r\n"
							+ "									style=\"width: " + perW4 + "%;\" role=\"progressbar\">\r\n"
							+ "									<span class=\"sr-only\">60% Complete</span>\r\n"
							+ "								</div>\r\n" + "							</div>\r\n"
							+ "						</div>\r\n" + "					</div>\r\n"
							+ "				</div>\r\n" + "			</div>\r\n" + "			<!-- 주차별 지출현황 끝 -->\r\n"
							+ "\r\n" + "\r\n" + "\r\n" + "\r\n"
							+ "			<!-- 요일별 평균지출액------------------------------------------------------------------------------------------------------------------------------------ -->\r\n"
							+ "			<div id=\"email03\">\r\n" + "\r\n" + "				<h3>요일별 평균지출액</h3>\r\n"
							+ "				<p class=\"txtNotice\">이번달 요일별 지출현황을 확인할 수 있습니다.</p>\r\n" + "\r\n"
							+ "				<div class=\"graph tabCon\" id=\"franchrule01\" style=\"display: block; margin-top: 50px; \">\r\n"
							+ "					<div class=\"col-lg-12\">\r\n"
							+ "						<div class=\"card\">\r\n"
							+ "							<div class=\"card-body\">\r\n"
							+ "								<canvas id=\"singelBarChart\" width=\"500\" height=\"250\"></canvas>\r\n"
							+ "							</div>\r\n" + "						</div>\r\n"
							+ "					</div>\r\n" + "				</div>\r\n"
							+ "				<!-- 요일별 평균지출액 끝 -->\r\n" + "			</div>\r\n" + "		</div>\r\n"
							+ "		<div class=\"pageTop\">\r\n" + "			<a href=\"#skipNavi\">위로 가기</a>\r\n"
							+ "		</div>\r\n" + "		<div class=\"footer\" style=\"width: 839px;\"></div>\r\n"
							+ "	</div>\r\n" + "	<br />\r\n" + "</body>\r\n" + "<script>\r\n"
							+ "$(document).ready(function ($) {\r\n" + "    \"use strict\";\r\n" + "\r\n"
							+ "    // single bar chart\r\n"
							+ "    var ctx = document.getElementById(\"singelBarChart\");\r\n"
							+ "    ctx.height = 150;\r\n" + "    var myChart = new Chart(ctx, {\r\n"
							+ "        type: 'bar',\r\n" + "        data: {\r\n"
							+ "            labels: [ \"월\", \"화\", \"수\", \"목\", \"금\", \"토\", \"일\"],\r\n"
							+ "            datasets: [\r\n" + "                {\r\n"
							+ "                    label: \"요일별 평균지출액\",\r\n" + "                    data: [" + monday
							+ "," + tuesday + "," + wendsday + "," + thursday + "," + friday + "," + saturday + "," + sunday + "],\r\n"
							+ "                    borderColor: \"rgba(0, 148, 144, 0.9)\",\r\n"
							+ "                    borderWidth: \"0\",\r\n"
							+ "                    backgroundColor: \"rgba(0, 148, 144, 0.5)\"\r\n"
							+ "                }\r\n" + "            ]\r\n" + "        },\r\n"
							+ "        options: {\r\n" + "            scales: {\r\n" + "                yAxes: [{\r\n"
							+ "                    ticks: {\r\n" + "                        beginAtZero: true\r\n"
							+ "                    }\r\n" + "                }]\r\n" + "            }\r\n"
							+ "        }\r\n" + "    });\r\n" + "\r\n" + "//pie chart\r\n"
							+ "    var ctx = document.getElementById(\"pieChart\");\r\n" + "    ctx.height = 150;\r\n"
							+ "    var myChart = new Chart(ctx, {\r\n" + "        type: 'pie',\r\n"
							+ "        data: {\r\n" + "            datasets: [{\r\n"
							+ "                data: [" + baseMoney + "," + livingCost +"," + extraMoney + "],\r\n" + "                backgroundColor: [\r\n"
							+ "                    \"rgba(0, 148, 144, 0.9)\",\r\n"
							+ "                    \"rgba(0, 148, 144, 0.5)\",\r\n"
							+ "                    \"rgba(0, 148, 144, 0.3)\"\r\n" + "                ],\r\n"
							+ "                hoverBackgroundColor: [\r\n"
							+ "                    \"rgba(0, 148, 144, 0.9)\",\r\n"
							+ "                    \"rgba(0, 148, 144, 0.5)\",\r\n"
							+ "                    \"rgba(0, 148, 144, 0.3)\"\r\n" + "                ]\r\n" + "\r\n"
							+ "            }],\r\n" + "            labels: [\r\n" + "                \"기본금\",\r\n"
							+ "                \"생활비\",\r\n" + "                \"예비금\"\r\n" + "            ]\r\n"
							+ "        },\r\n" + "        options: {\r\n" + "            responsive: true\r\n"
							+ "        }\r\n" + "    });\r\n" + "    \r\n" + "})(jQuery);\r\n" + "\r\n"
							+ "let draw = Chart.controllers.line.prototype.draw;\r\n"
							+ "Chart.controllers.line = Chart.controllers.line.extend({\r\n"
							+ "    draw: function () {\r\n" + "        draw.apply(this, arguments);\r\n"
							+ "        let nk = this.chart.chart.ctx;\r\n" + "        let _stroke = nk.stroke;\r\n"
							+ "        nk.stroke = function () {\r\n" + "            nk.save();\r\n"
							+ "            nk.shadowColor = '#ddd';\r\n" + "            nk.shadowBlur = 10;\r\n"
							+ "            nk.shadowOffsetX = 0;\r\n" + "            nk.shadowOffsetY = 4;\r\n"
							+ "            _stroke.apply(this, arguments)\r\n" + "            nk.restore();\r\n"
							+ "        }\r\n" + "    }\r\n" + "});\r\n" + "\r\n" + "</script>\r\n" + "\r\n" + "\r\n"
							+ "\r\n" + "\r\n" + "<!--**********************************\r\n" + "       Scripts\r\n"
							+ "   ***********************************-->\r\n" + "<script\r\n"
							+ "	src=\"http://localhost:9999/resources/plugins/common/common.min.js\"></script>\r\n"
							+ "<script src=\"http://localhost:9999/resources/js/custom.min.js\"></script>\r\n"
							+ "<script src=\"http://localhost:9999/resources/js/settings.js\"></script>\r\n"
							+ "<script src=\"http://localhost:9999/resources/js/gleek.js\"></script>\r\n"
							+ "<script src=\"http://localhost:9999/resources/js/styleSwitcher.js\"></script>\r\n"
							+ "<script\r\n"
							+ "	src=\"http://localhost:9999/resources/plugins/chart.js/Chart.bundle.min.js\"></script>\r\n"
							+ "<!--**********************************\r\n" + "        Scripts\r\n"
							+ "    ***********************************-->\r\n"
							+ "<script src=\"http://localhost:9999/resources/js/styleSwitcher.js\"></script>\r\n"
							+ "<script src=\"http://localhost:9999/resources/plugins/tables/js/jquery.dataTables.min.js\"></script>\r\n"
							+ "<script\r\n"
							+ "	src=\"http://localhost:9999/resources/plugins/tables/js/datatable/dataTables.bootstrap4.min.js\"></script>\r\n"
							+ "<script\r\n"
							+ "	src=\"http://localhost:9999/resources/plugins/tables/js/datatable-init/datatable-basic.min.js\"></script>\r\n"
							+ "<script src=\"http://localhost:9999/resources/js/gleek.js\"></script>\r\n"
							+ "<script src=\"http://localhost:9999/resources/plugins/chartist/js/chartist.min.js\"></script>\r\n"
							+ "<script\r\n"
							+ "	src=\"http://localhost:9999/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js\"></script>\r\n"
							+ "<script src=\"http://localhost:9999/resources/js/gleek.js\"></script>\r\n"
							+ "<script\r\n"
							+ "	src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n"
							+ "<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\"></script>\r\n"
							+ "<script\r\n"
							+ "	src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\"></script>\r\n"
							+ "<script\r\n"
							+ "	src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"></script>\r\n"
							+ "</html>\r\n" + "";
					bs.write(str.getBytes()); // Byte형으로만 넣을 수 있음
					System.out.println("완료");

				} catch (Exception e) {
					e.printStackTrace();
				} 
				i++;
			}
		}
	}

	/**
	 * mailSending 코드
	 */
	@Override
	public void monthlyReportExecute(ProductVO onepickInfo) {
		List<ReportVO> mailsendList = reportDAO.mailsendList(onepickInfo);

		System.out.println("체크 ser : " + mailsendList.toString());

		SimpleDateFormat format = new SimpleDateFormat("MM");
		Date date = new Date();
		String month = format.format(date);

		if (mailsendList != null) {
			int i = 0;

			while (i < mailsendList.size()) {

				String setfrom = "mischief05@naver.com";
				String filename = "D:/Dev/Hana-onepick/src/main/webapp/email_form.html"; // 파일이름

				String tomail = mailsendList.get(i).getEmail();
				String name = mailsendList.get(i).getReceiver();

				// db에서 받는 사람 이름
				// 설정==============================================================
				String title = "[하나은행] " + name + " 님의 " + month + "월 하나원픽 금융리포트입니다."; // 제목

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

					messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
					messageHelper.setTo(tomail); // 받는사람 이메일
					messageHelper.setSubject(title); // 메일제목은 생략이 가능하다

					// 파일첨부
					FileSystemResource fsr = new FileSystemResource(filename);
					messageHelper.addAttachment("email_form.html", fsr);

					messageHelper.setText("<!DOCTYPE HTML>\r\n" + "<html lang=\"ko\">\r\n" + "<head>\r\n"
							+ "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
							+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n"
							+ "<title>메일</title>\r\n" + "</head>\r\n" + "<body class=\"ko_KR \">\r\n"
							+ "	<div class=\"viewWrap\" id=\"previewContent\">\r\n"
							+ "		<div class=\"coverWrap\">\r\n" + "			<div id=\"readFrame\">\r\n"
							+ "				<div\r\n"
							+ "					style=\"max-width: 710px; min-width: 320px; margin: 0 auto; background-color: #fff; text-align: left;\">\r\n"
							+ "					<!-- header-->\r\n"
							+ "					<div style=\"height: 47px; padding: 0 0 20px 0; margin: 0;\">\r\n"
							+ "						<h1\r\n"
							+ "							style=\"float: left; margin: 0; padding: 25px 0 0 0; font-size: 0; line-height: 0;\">\r\n"
							+ "							<a href=\"http://localhost:9999/\" target=\"_blank\"\r\n"
							+ "								title=\"새창 열림\" rel=\"noreferrer noopener\"><img\r\n"
							+ "								src=\"http://localhost:9999/resources/images/email/email-logo2.jpg\"\r\n"
							+ "								alt=\"hanabank\" style=\"border: 0px;\" loading=\"lazy\"></a>\r\n"
							+ "						</h1>\r\n" + "					</div>\r\n"
							+ "					<!-- //header-->\r\n" + "					<!-- content -->\r\n"
							+ "					<!-- 내용 -->\r\n" + "					<!-- content -->\r\n"
							+ "					<div\r\n"
							+ "						style=\"line-height: 1.5; color: #555555; font-size: 14px; font-family: AppleSDGothicNeo-light, 'malgun gothic', 'dotum', '돋움', sans-serif;\">\r\n"
							+ "						<!-- 비주얼영역 -->\r\n" + "						<div>\r\n"
							+ "							<img\r\n"
							+ "								src=\"http://localhost:9999/resources/images/email/email_content_header.png\"\r\n"
							+ "								alt=\"신한카드 이용대금 명세서\" border=\"0\" width=\"100%\" loading=\"lazy\">\r\n"
							+ "						</div>\r\n"
							+ "						<div style=\"padding: 6% 6% 7%;\">\r\n"
							+ "							<div\r\n"
							+ "								style=\"color: #0050a9; font-size: 16px; font-weight: bold; padding-bottom: 3%; border-bottom: 1px solid #dbdbdb; margin-bottom: 3%;\">2020년\r\n"
							+ "								09월 금융리포트</div>\r\n"
							+ "							<div style=\"font-size: 16px; color: #000; font-weight: bold;\">이메일\r\n"
							+ "								금융리포트 확인방법</div>\r\n"
							+ "							<div\r\n"
							+ "								style=\"padding: 4% 5%; background: #f6f6f6; margin-top: 1.5em;  margin-bottom: 30px;\">\r\n"
							+ "								<div\r\n"
							+ "									style=\"font-size: 14px; font-weight: bold; margin-bottom: 2%;\">첨부파일을\r\n"
							+ "									클릭하세요.</div>\r\n"
							+ "								<div style=\"font-size: 14px;\">이메일 금융리포트 첨부파일 확인방법 : 첨부파일을\r\n"
							+ "									클릭하신 후 금융리포트를 확인하시면 됩니다.</div>\r\n"
							+ "							</div>\r\n" + "							\r\n"
							+ "							<div style=\"font-weight: bold; color: #000; font-size: 16px;\">금융리포트를 더욱 스마트하게 사용하기</div>\r\n"
							+ "							<div\r\n"
							+ "								style=\"border: 1px solid #e1e1e1; padding: 5% 2%; margin-top: 1em; text-align: center; line-height: 1.4;\">\r\n"
							+ "								<table\r\n"
							+ "									style=\"width: 100%; table-layout: fixed; font-size: 12px; text-align: center; line-height: 1.4;\">\r\n"
							+ "									<tbody>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"height: 65px;\"><img\r\n"
							+ "												src=\"http://localhost:9999/resources/images/email/monitor.png\"\r\n"
							+ "												alt=\"나의 예산\" loading=\"lazy\"></td>\r\n"
							+ "											<td><img\r\n"
							+ "												src=\"http://localhost:9999/resources/images/email/billing.png\"\r\n"
							+ "												alt=\"지출 관리\" style=\"margin-left: 14px;\"\r\n"
							+ "												loading=\"lazy\"></td>\r\n"
							+ "											<td><img\r\n"
							+ "												src=\"http://localhost:9999/resources/images/email/balance.png\"\r\n"
							+ "												alt=\"또래 비교\" loading=\"lazy\"></td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding: 15px 3px 5px; vertical-align: top;\"><div\r\n"
							+ "													style=\"font-weight: bold;\">나의 예산</div></td>\r\n"
							+ "											<td style=\"padding: 15px 3px 5px; vertical-align: top;\"><div\r\n"
							+ "													style=\"font-weight: bold;\">지출 관리</div></td>\r\n"
							+ "											<td style=\"padding: 15px 3px 5px; vertical-align: top;\"><div\r\n"
							+ "													style=\"font-weight: bold;\">또래 비교</div></td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding: 0px 3px 15px; vertical-align: top;\"><div\r\n"
							+ "													style=\"max-width: 150px; margin: 0 auto;\">한 달 예산을 작성하고 관리하며 자산형성</div></td>\r\n"
							+ "											<td style=\"padding: 0px 3px 15px; vertical-align: top;\"><div\r\n"
							+ "													style=\"max-width: 170px; margin: 0 auto;\">매일 예산과 지출을 관리하며 지출목표 달성</div></td>\r\n"
							+ "											<td style=\"padding: 0px 3px 15px; vertical-align: top;\"><div\r\n"
							+ "													style=\"max-width: 130px; margin: 0 auto;\"> 나이, 자산규모에 따른 최적의 예산비율을 추천</div></td>\r\n"
							+ "										</tr>\r\n"
							+ "										<tr>\r\n"
							+ "											<td style=\"padding: 0px 5px;\"><a\r\n"
							+ "												href=\"http://localhost:9999/product/onepick/budget\"\r\n"
							+ "												target=\"_blank\"\r\n"
							+ "												style=\"display: block; margin: 0 auto; padding: 10px 0px; font-weight: bold; border: 1px solid #ccc; background: #fff; text-align: center; text-decoration: none; color: #555; max-: 110px;\"\r\n"
							+ "												rel=\"noreferrer noopener\">바로가기 〉</a></td>\r\n"
							+ "											<td style=\"padding: 0px 5px;\"><a\r\n"
							+ "												href=\"http://localhost:9999/product/onepick/dashboard\"\r\n"
							+ "												target=\"_blank\"\r\n"
							+ "												style=\"display: block; margin: 0 auto; padding: 10px 0px; font-weight: bold; border: 1px solid #ccc; background: #fff; text-align: center; text-decoration: none; color: #555; max-: 110px;\"\r\n"
							+ "												rel=\"noreferrer noopener\">바로가기 〉</a></td>\r\n"
							+ "											<td style=\"padding: 0px 5px;\"><a\r\n"
							+ "												href=\"http://localhost:9999/product/onepick/analysis\"\r\n"
							+ "												target=\"_blank\"\r\n"
							+ "												style=\"display: block; margin: 0 auto; padding: 10px 0px; font-weight: bold; border: 1px solid #ccc; background: #fff; text-align: center; text-decoration: none; color: #555; max-: 110px;\"\r\n"
							+ "												rel=\"noreferrer noopener\">바로가기 〉</a></td>\r\n"
							+ "										</tr>\r\n"
							+ "									</tbody>\r\n"
							+ "								</table>\r\n" + "							</div>\r\n"
							+ "						</div>\r\n" + "					</div>\r\n"
							+ "					<!-- //content -->\r\n" + "					<!-- //내용 -->\r\n"
							+ "					<!-- //content -->\r\n" + "					<!-- 공지 only -->\r\n"
							+ "					<div\r\n"
							+ "						style=\"text-align: center; color: #666; font-size: 12px; line-height: 1.5;\">\r\n"
							+ "						<div style=\"padding: 5.3% 5% 4.7%; background: #f6f6f6;\">\r\n"
							+ "							본 메일은 하나은행에서 발송한 메일이며 발신전용 메일입니다.<br> 관련 문의사항은 하나은행 <a\r\n"
							+ "								href=\"http://localhost:9999\"\r\n"
							+ "								target=\"_blank\" title=\"새창 열림\"\r\n"
							+ "								style=\"color: #666666; text-decoration: underline;\"\r\n"
							+ "								rel=\"noreferrer noopener\">홈페이지</a>에서 가능합니다.\r\n"
							+ "						</div>\r\n" + "						<div\r\n"
							+ "							style=\"max-width: 488px; margin: 0 auto; margin-top: 27px; padding: 0px 20px; line-height: 1.5;\">\r\n"
							+ "							<div>\r\n"
							+ "								<span>전자금융상담 전용 1588-3555</span><br>\r\n"
							+ "								<span>은행업무 1588-1111 / 1599-1111</span>\r\n"
							+ "							</div>\r\n" + "							<div\r\n"
							+ "								style=\"margin-top: 18px; padding-top: 14px; border-top: 1px solid #efefef;\">\r\n"
							+ "								<span\r\n"
							+ "									style=\"display: inline-block; margin-right: 6px; vertical-align: middle; margin-top: 5px;\">\r\n"
							+ "									서울특별시 중구 을지로 35(을지로1가, 하나은행) 주식회사 하나은행</span> \r\n"
							+ "									<span\r\n"
							+ "									style=\"display: inline-block; vertical-align: middle; margin-top: 5px;\">\r\n"
							+ "									대표이사:지성규 사업자등록번호:202-81-14695</span>\r\n"
							+ "							</div>\r\n"
							+ "							<div style=\"margin-top: -2px;\">\r\n"
							+ "								<span\r\n"
							+ "									style=\"display: inline-block; margin-top: 5px; vertical-align: middle;\">\r\n"
							+ "									COPYRIGHT ⓒ 2020 Hana Bank CO.LTD.ALL RIGHTS RESERVED.</span>\r\n"
							+ "							</div>\r\n"
							+ "							<div style=\"margin-top: 20px; padding-bottom: 60px;\">\r\n"
							+ "								<img\r\n"
							+ "									src=\"http://localhost:9999/resources/images/email/email-logo2.jpg\"\r\n"
							+ "									alt=\"하나은행\" loading=\"lazy\" style=\"width: 40%; height: 40%;\">\r\n"
							+ "							</div>\r\n" + "						</div>\r\n"
							+ "					</div>\r\n" + "					<!--//footer-->\r\n"
							+ "				</div>\r\n" + "				<br>\r\n" + "			</div>\r\n"
							+ "		</div>\r\n" + "	</div>\r\n" + "</body>\r\n" + "</html>\r\n" + "", true); // 메일 내용

					mailSender.send(message);


				} catch (Exception e) {
					System.out.println(e);
				}
				
				i++;
			}
		}
	}

}
