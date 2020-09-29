package kr.ac.kopo.paying.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.paying.service.PayingService;
import kr.ac.kopo.paying.vo.PayingVO;

@SessionAttributes({ "loginVO" })
@Controller
public class PayingController {

	@Autowired
	private PayingService payingService;


	@GetMapping("/paying/{path}")
	public ModelAndView paying(@PathVariable("path") String path, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		// 카드결제 view
		if (path.equals("card")) {
			mav = new ModelAndView("/banking/checkCard");
		}
		
		return mav;
	}

	
	@PostMapping("/paying/card")
	public ModelAndView paying(PayingVO payingVO, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		AccountVO linkedAcc = payingService.linkedAcc(loginVO);
		
		System.out.println("계좌리스트 : " + linkedAcc.toString());
		
		payingVO.setAccNo(linkedAcc.getAccNo());
		payingVO.setSummary("체크하나");
		payingVO.setMemo("철산cu");
		
		// 체크카드 잔액확인
		PayingVO chkCode = payingService.chkBalance(payingVO); 

		if(chkCode.getChkBalance() < 0) {
			mav = new ModelAndView("/banking/checkCard");
			return mav;
		}
		
		// 체크카드 결제메소드
		int payResult = payingService.paying(payingVO); 
		System.out.println("완료 : " + chkCode + " : " + payResult);
		mav = new ModelAndView("redirect:/");

		return mav;
	}
}
