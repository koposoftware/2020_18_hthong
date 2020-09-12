package kr.ac.kopo.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;

@SessionAttributes({ "loginVO" })
@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;

	// 계좌조회, 계좌관리(별칭만), 계좌가입, 계좌전환

	/**
	 * 계좌조회
	 * 
	 * @return
	 */
	@GetMapping("/inquiry")
	public ModelAndView inquiryForm(HttpServletRequest request) throws Exception{

		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		
		System.out.println(loginVO.toString());

		// 계좌조회 메소드 호출
		List<AccountVO> accountList = accountService.inquiryAcc(loginVO);
		ModelAndView mav = new ModelAndView("/account/inquiryAcc");
		
		mav.addObject("accountList", accountList);
		System.out.println(mav.toString());
		
		return mav;
	}

}
