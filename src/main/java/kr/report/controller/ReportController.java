package kr.ac.kopo.report.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.service.ProductService;
import kr.ac.kopo.product.vo.ProductVO;
import kr.ac.kopo.report.service.ReportService;
import kr.ac.kopo.report.vo.MailVO;
import kr.ac.kopo.report.vo.ReportVO;
import kr.ac.kopo.reportMon.service.ReportMonService;


@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private ReportMonService reportMonService;
	
	@Autowired
	private ProductService productService;


	MemberVO loginVO = null;

	@GetMapping("/product/report/{path}")
	public ModelAndView product(@PathVariable("path") String path, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		loginVO = (MemberVO) session.getAttribute("loginVO");
		ProductVO productVO = new ProductVO();

		String userId = loginVO.getId();
		productVO.setUserId(userId);

		ProductVO onepickInfo = productService.onepickInfo(loginVO);
		
		
		// 원픽통장 금융브리핑 view
		if (path.equals("briefing")) {
			
			System.out.println("check briefing");
			
			// 파일경로 조회 -> 사용자에 따라 view 단 달리해줌
			ReportVO ttsPathList = reportService.ttsPathByAcc(onepickInfo);
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
			Date date = new Date();
			String systemDate = format.format(date); // 오늘 일자
			
			ttsPathList.setPath("http://localhost:9999/resources/audio/10012020kopo1.mp3");
			
			mav = new ModelAndView("/report/briefing");
			mav.addObject("ttsPathList", ttsPathList);
			mav.addObject("systemDate", systemDate);
			
		// 이름, 날짜, path 넘겨주기
		} else if(path.equals("mailtest")) {
		  
			  System.out.println("메일 발송 전 체크");
			  
			  reportMonService.monthlyReportExecute(onepickInfo);
			  mav = new ModelAndView("/report/briefing");
			  System.out.println("메일 발송 후 체크"); 
		}
		
		else if(path.equals("formTEST")) {
			System.out.println("폼 체크 전 체크" + loginVO.toString());
			
			MailVO mailVO = new MailVO();
			
			reportMonService.makeReportExecute(onepickInfo);
			System.out.println("폼 체크 후 체크" + mailVO.toString());
		}
		 
		
		
		
		
		return mav;
	}
}