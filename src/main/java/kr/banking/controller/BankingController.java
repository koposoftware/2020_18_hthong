package kr.ac.kopo.banking.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
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
	 * 계좌이체 - validation
	 * 
	 * @param bankingVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/banking/transfer/check")
	public String chkTransfer(BankingVO bankingVO) throws Exception{
		
		System.out.println("accNo val " + bankingVO.getAccNo() );
		
		String chkCode = bankingService.chkTransfer(bankingVO); // 계좌체크 
		return chkCode;
	}
	
	/**
	 * 계좌이체
	 * 
	 * @param bankingVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/banking/transfer")
	public ModelAndView transfer(BankingVO bankingVO) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String chkCode = bankingService.transfer(bankingVO); // 이체 메소드
		System.out.println("이체 결과 : " + bankingVO.toString());
		
		
		mav.addObject("transferResult", chkCode);
		
		mav = new ModelAndView("/banking/transferResult");
		
		System.out.println("con : " + chkCode);
		
		return mav;
	}

	/**
	 * 거래내역 조회
	 * 
	 * @param transactionVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/banking/transaction")
	public List<TransactionVO> transaction(TransactionVO transactionVO) {

		List<TransactionVO> transaction = new ArrayList<>();
		transaction = bankingService.transaction(transactionVO); // 거래내역 조회 메소드

		return transaction;
	}


}
