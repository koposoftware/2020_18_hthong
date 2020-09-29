package kr.ac.kopo.autodebit.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.autodebit.service.AutoDebitService;
import kr.ac.kopo.autodebit.vo.AutoDebitVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class AutoDebitController {

	@Autowired
	private AutoDebitService autoDebitService;

	@Autowired
	private AccountService accountService;
	
	// 계좌리스트 값이 필요한 banking 업무 처리
	@GetMapping("/autodebit/{path}")
	public ModelAndView autodebit(@PathVariable("path") String path, HttpServletRequest request) throws Exception {

		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		// 계좌리스트 조회
		ModelAndView mav = new ModelAndView();
		List<AccountVO> accountList = accountService.inquiryAcc(loginVO);

		// 자동이체 조회 view
		if (path.equals("info")) {
			mav = new ModelAndView("/autodebit/info");
		}

		// 자동이체 등록 view
		else if (path.equals("registration")) {
			mav = new ModelAndView("/autodebit/registration");
		}

		// 자동이체 수정 view
		else if (path.equals("manage")) {
			mav = new ModelAndView("/autodebit/info");
		}

		// 예외발생 view
		else {
			mav = new ModelAndView("redirect:/");
		}
		mav.addObject("accountList", accountList);
		return mav;
	}

	/**
	 * 자동이체 조회
	 * 
	 * @param autoDebitVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/autodebit/info")
	public List<AutoDebitVO> autodebitInfo(AutoDebitVO autoDebitVO) {

		List<AutoDebitVO> autoDebitList = new ArrayList<>();
		String category = autoDebitVO.getCategory();
		
		if(category.equals("전체")){
			// 자동이체 전체조회
			autoDebitList = autoDebitService.autoDebitList(autoDebitVO); 
		} else {
			// 자동이체 조건조회
			autoDebitList = autoDebitService.selectByCategry(autoDebitVO); 
		}
		
		System.out.println(autoDebitList);
		return autoDebitList;
	}

	/**
	 * 자동이체 등록
	 * 
	 * @param autoDebitVO
	 * @return
	 */
	@PostMapping("/autodebit/registration")
	public ModelAndView registration(AutoDebitVO autoDebitVO) {
		ModelAndView mav = new ModelAndView();
		
		// 자동이체 등록 메소드
		int chkResult = autoDebitService.autoDebitReg(autoDebitVO); 

		if (chkResult == 0) {
			mav = new ModelAndView("/autodebit/regFail");

		} else if (chkResult > 0) {
			mav = new ModelAndView("/autodebit/regResult");
		}
		return mav;
	}
	
	
	/**
	 * 자동이체 삭제
	 * @param autoDebitVO
	 * @return
	 */
	@PostMapping("/autodebit/manage/delete")
	public ModelAndView autoDebitDelete(AutoDebitVO autoDebitVO) throws Exception{
		ModelAndView mav = new ModelAndView();
		// 자동이체 삭제 메소드
		int result = autoDebitService.autoDebitDelete(autoDebitVO); 
			
		if( result == 0 ) {
			mav = new ModelAndView("/autodebit/info");
		} else {
			mav = new ModelAndView("/autodebit/deleteResult");
		}
		return mav;
	}
	
	
	/**
	 * 자동이체 수정폼
	 * @param autoDebitVO
	 * @return
	 */
	@PostMapping("/autodebit/manage/modifyForm")
	public ModelAndView autoDebitModifyForm(AutoDebitVO autoDebitVO) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		mav = new ModelAndView("/autodebit/modifyForm");
		mav.addObject("autoDebitInfo", autoDebitVO);
		
		return mav;
	}
	
	/**
	 * 자동이체 수정
	 * @param autoDebitVO
	 * @return
	 */
	@PostMapping("/autodebit/manage/modify")
	public ModelAndView autoDebitModify(AutoDebitVO autoDebitVO) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		System.out.println("con 체크222" + autoDebitVO.toString());
		// 자동이체 수정 메소드
		int result = autoDebitService.autoDebitModify(autoDebitVO);
		
		if( result == 0 ) {
			mav = new ModelAndView("/autodebit/info");
		} else {
			mav = new ModelAndView("/autodebit/modifyResult");
		}
		return mav;
	}
	
	
	
	
	////////////////////////////////////////////////////////////////////////////
	// 자동이체 Execute
	public void AutoDebitTest() {
		autoDebitService.autoDebitExecute();
	}
	////////////////////////////////////////////////////////////////////////////
	

}
