package kr.ac.kopo.product.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.service.ProductService;
import kr.ac.kopo.product.vo.BudgetVO;
import kr.ac.kopo.product.vo.OnepickVO;
import kr.ac.kopo.product.vo.ProductVO;

@SessionAttributes({ "loginVO" })
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private AccountService accountService;
	
	DecimalFormat fomatter = new DecimalFormat("###,###");
	MemberVO loginVO = null;
	
	@GetMapping("/product/onepick/{path}")
	public ModelAndView product(@PathVariable("path") String path, HttpServletRequest request) throws Exception{

		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		loginVO = (MemberVO) session.getAttribute("loginVO");
		ProductVO productVO = new ProductVO();
		
		String userId = loginVO.getId();
		productVO.setUserId(userId);
		
		// 통장전환 가능 계좌조회
		ModelAndView mav = new ModelAndView();
		List<AccountVO> accountList = accountService.inquiryChkAcc(loginVO);

		// 통장전환 view
		if (path.equals("change")) {
			mav = new ModelAndView("/product/changeAcc");
			mav.addObject("accountList", accountList);
		}
		// 원픽통장 메뉴 view
		else {
			ProductVO onepickInfo = productService.onepickInfo(loginVO); // 로그인 정보 가지고 원픽통장만 조회
			ProductVO autoInfo = productService.autoInfo(onepickInfo);
			
			// 원픽통장 없을 경우 메인으로
			if (onepickInfo == null) {
				mav.setViewName("redirect:/");
			}

			// 원픽통장 조회 view
			else if (path.equals("info")) {
				mav = new ModelAndView("/product/info");
				mav.addObject("onepickInfo", onepickInfo);
				
			}

			// 원픽통장 예산 view
			else if (path.equals("budget")) {
				mav = new ModelAndView("/product/budget");
				
				List<BudgetVO> budgetList = productService.budgetList(onepickInfo); 
				
				System.out.println("원픽통장 조회 : " + onepickInfo.toString());
				
				mav.addObject("onepickInfo", onepickInfo);
				mav.addObject("budgetList", budgetList);
				mav.addObject("autoInfo", autoInfo);
				
				System.out.println("===========================");
				System.out.println(mav.toString());
			}

			// 원픽통장 대시보드 view
			else if (path.equals("dashboard")) {
				mav = new ModelAndView("/product/dashboard");
				
				String balance = fomatter.format(Integer.parseInt(onepickInfo.getBalance()));
				onepickInfo.setBalance(balance);
				
				System.out.println("원픽통장 조회 :  " + onepickInfo.toString());
				
				mav.addObject("onepickInfo", onepickInfo);
			}

			// 예외발생 view
			else {
				mav = new ModelAndView("redirect:/");
			}
		}
		return mav;
	}

	/**
	 * 통장전환 입력폼
	 * 
	 * @param accountVO
	 * @return
	 */
	@PostMapping("/product/onepick/change")
	public ModelAndView changeAccForm(AccountVO accountVO) {
		ModelAndView mav = new ModelAndView();
		
		// 전환지정일자
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
		Date date = new Date();
		String systemDate = format.format(date); // 오늘 일자
		accountVO.setRegDate(systemDate);

		mav = new ModelAndView("/product/changeAccForm");
		mav.addObject("accountInfo", accountVO);

		return mav;
	}

	/**
	 * 통장전환 비밀번호 입력폼
	 * 
	 * @param accountVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/product/checkPwd")
	public int checkPwd(AccountVO accountVO) throws Exception{
		int checkResult = accountService.checkPwd(accountVO);

		return checkResult;
	}

	/**
	 * 통장전환 프로세스(data 수정/저장)
	 * 
	 * @param accountVO
	 * @return
	 */
	@PostMapping("/product/onepick/changeResult")
	public ModelAndView convertAcc(AccountVO accountVO) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		AccountVO convertAccResult = productService.convertAcc(accountVO);
		
		mav = new ModelAndView("/product/changeAccResult");
		mav.addObject("convertAccResult", convertAccResult);

		return mav;
	}
	
	/**
	 * 원픽통장 금액이동
	 * @param onepickVO
	 * @return
	 */
	@PostMapping("/product/onepick/transfer")
	public String onepickTransfer(OnepickVO onepickVO) throws Exception{
		int result = productService.onepickTransfer(onepickVO);
		
		return "redirect:/product/onepick/info";
	}
	
	
	/**
	 * 원픽 총예산 수정	- 완료
	 * @param productVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping("/product/onepick/budget/totalBudget")
	public void setBudget(ProductVO productVO) throws Exception{
		
		productService.updateTotalBudget(productVO);
		ProductVO onepickInfo = productService.onepickInfo(loginVO); // 로그인 정보 가지고 원픽통장만 조회
	}
	
	/**
	 * 원픽 금액 자동이동 수정
	 * @param productVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping("/product/onepick/budget/autoSend")
	public void autoSend(ProductVO productVO) throws Exception{
		
		ProductVO autoInfo = productService.autoInfo(productVO);
		
		if(autoInfo.getAutodebitCode() == null) {
			productService.insertAutoSend(productVO);
			
		} else if(productVO.getFlag().equals("living")){
			productVO.setMoneyToExtra(autoInfo.getMoneyToExtra());
			productVO.setDateToExtra(autoInfo.getDateToExtra());
			productService.updateAutoSend(productVO);
			
		} else if(productVO.getFlag().equals("extra")){
			productVO.setMoneyToLiving(autoInfo.getMoneyToLiving());
			productVO.setDateToLiving(autoInfo.getDateToLiving());
			productService.updateAutoSend(productVO);
		}
		
		autoInfo = productService.autoInfo(productVO);
		
	}
	
	
	/**
	 * 원픽 예산 입력
	 * @param productVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping("/product/onepick/budget/makeBudget")
	public String makeBudget(BudgetVO budgetVO) throws Exception{
		System.out.println("파라미터 체크 : " + budgetVO.toString() );
		
		productService.insertBudget(budgetVO);
		
		return "redirect:/product/onepick/budget";
	}
	
}
