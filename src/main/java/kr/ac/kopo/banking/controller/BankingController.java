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
	public ModelAndView banking(@PathVariable("path") String path, HttpServletRequest request) {

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

		System.out.println("accList: " + mav.toString());

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

	// 계좌리스트 값이 필요한 banking 업무 처리
	@GetMapping("/autodebit/{path}")
	public ModelAndView autodebit(@PathVariable("path") String path, HttpServletRequest request) {

		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		// 계좌리스트 조회
		ModelAndView mav = new ModelAndView();
		List<AccountVO> accountList = accountService.inquiryAcc(loginVO);

		// 자동이체 조회 view
		if (path.equals("info")) {
			mav = new ModelAndView("/autodebit/autodebitInfo");
			mav.addObject("accountList", accountList);
		}

		// 자동이체 등록 view
		else if (path.equals("registration")) {
			mav = new ModelAndView("/autodebit/autodebitReg");
			mav.addObject("accountList", accountList);
		}

		// 자동이체 수정 view
		else if (path.equals("manage")) {
			mav = new ModelAndView("/autodebit/autodebitManage");
			mav.addObject("accountList", accountList);
		}

		// 예외발생 view
		else {
			mav = new ModelAndView("redirect:/");
		}

		System.out.println("accList: " + mav.toString());

		return mav;
	}

	/**
	 * 자동이체 조회 
	 * @param autoDebitVO
	 * @return
	 */
	@PostMapping("/autodebit/info")
	public ModelAndView autodebitInfo(AutoDebitVO autoDebitVO) {

		System.out.println("autodebitInfo check : " + autoDebitVO.toString());

		ModelAndView mav = new ModelAndView();
		List<AutoDebitVO> autoDebitList = bankingService.autoDebitList(autoDebitVO); // 자동이체 리스트

		System.out.println("lastCheck in autodebitInfo : " + autoDebitList.toString());

		mav = new ModelAndView("#");
		mav.addObject("autoDebitList", autoDebitList);

		return mav;
	}

	/**
	 * 자동이체 등록
	 * @param autoDebitVO
	 * @return
	 */
	@PostMapping("/autodebit/registration")
	public ModelAndView registration(AutoDebitVO autoDebitVO) {
		
		System.out.println("autodebit registration check : " + autoDebitVO.toString());

		ModelAndView mav = new ModelAndView();
		
		int chkResult = bankingService.autoDebitReg(autoDebitVO); // 자동이체 등록 메소드
		
		if(chkResult == 0 ) {
			mav = new ModelAndView("/autodebit/autodebitRegFail");
			
		} else if(chkResult > 0 ) {
			mav = new ModelAndView("/autodebit/autodebitRegResult");
		}

		
		return mav;
	}

}
