package kr.ac.kopo.banking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.autodebit.vo.AutoDebitVO;
import kr.ac.kopo.banking.service.BankingService;
import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;
import kr.ac.kopo.member.vo.MemberVO;

@SessionAttributes({ "loginVO" })
@Controller
public class BankingController {

	@Autowired
	private BankingService bankingService;

	@Autowired
	private AccountService accountService;

	// 계좌리스트 값이 필요한 banking 업무 처리
	@GetMapping("/banking/{path}")
	public ModelAndView banking(@PathVariable("path") String path, HttpServletRequest request) throws Exception {

		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		// 계좌리스트 조회
		ModelAndView mav = new ModelAndView();
		List<AccountVO> accountList = accountService.inquiryAcc(loginVO);

		// 거래내역 view
		if (path.equals("transaction")) {
			mav = new ModelAndView("/banking/transaction");
			mav.addObject("transAccList", accountList);
		}

		// 계좌이체 view
		else if (path.equals("transfer")) {
			mav = new ModelAndView("/banking/transfer");
			mav.addObject("accountList", accountList);
		}

		// 예외발생 view
		else {
			mav = new ModelAndView("redirect:/");
		}
		return mav;
	}

	/**
	 * 계좌이체
	 * 
	 * @param bankingVO
	 * @return
	 */
	@PostMapping("/banking/transfer")
	public String transfer(BankingVO bankingVO) {

		bankingService.transfer(bankingVO); // 이체 메소드

		return "redirect:/";
	}

	/**
	 * 거래내역 조회
	 * 
	 * @param transactionVO
	 * @return
	 */

	@PostMapping("/banking/transaction")
	public ModelAndView transaction(TransactionVO transactionVO) {

		System.out.println("trans check : " + transactionVO.toString());

		ModelAndView mav = new ModelAndView();
		List<TransactionVO> transaction = bankingService.transaction(transactionVO); // 거래내역 조회 메소드

		System.out.println("lastCheck in con : " + transaction);

		mav = new ModelAndView("/banking/transactionResult");
		mav.addObject("transaction", transaction);

		return mav;
	}

	/**
	 * ajax 적용 전 거래내역조회
	 * 
	 * @return
	 */
	@GetMapping("/banking/transactionResult")
	public String transactionResult() {
		return "/banking/transactionResult";
	}


}
