package kr.ac.kopo.product.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.service.ProductService;
import kr.ac.kopo.product.vo.AnalysisVO;
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
	
	DecimalFormat formatter = new DecimalFormat("###,###");
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
			AnalysisVO dashboardInfo = productService.dashboardInfo(onepickInfo);
			AnalysisVO dashSpending = productService.dashSpending(onepickInfo);
			
			System.out.println("pro con 체크1 : " + dashboardInfo.toString());
			System.out.println("pro con 체크2 : " + dashSpending.toString());
		
			
			// 원픽통장 없을 경우 메인으로
			if (onepickInfo == null) {
				mav.setViewName("redirect:/");
			} else {
				
				ProductVO autoInfo = productService.autoInfo(onepickInfo);
				
				System.out.println("원픽통장 소유여부 확인 :" + onepickInfo);

				// 원픽통장 조회 view
				if (path.equals("info")) {
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
					
					
					// balance 포맷 변경
					String balance = formatter.format(Integer.parseInt(onepickInfo.getBalance()) );	// 잔액 ',' 표시
					onepickInfo.setBalance(balance);
					
					// spendingRatio 계산, 포맷 변경
					DecimalFormat form = new DecimalFormat("#.#");
					double spending = Double.parseDouble(dashSpending.getMonthSpending()) / Double.parseDouble(dashboardInfo.getMoneyToLiving()) * 100;
					String spendingRatio = form.format(spending);
					dashSpending.setSpendingRatio(spendingRatio);
					
					// dailyBudget 포맷 변경
					String dailyBudget = formatter.format(Integer.parseInt(dashboardInfo.getDailyBudget())); // 일평균 생활비
					dashboardInfo.setDailyBudget(dailyBudget);
					 
					// moneyToLiving 포맷 변경
					String moneyToLiving = formatter.format(Integer.parseInt(dashboardInfo.getMoneyToLiving())); // 일평균 생활비
					dashboardInfo.setMoneyToLiving(moneyToLiving);
					
					// remainingBudget 포맷 변경
					String remainingBudget = formatter.format(Integer.parseInt(dashSpending.getRemainingBudget())); // 일평균 생활비
					dashSpending.setRemainingBudget(remainingBudget);
					
					// monthSpending 포맷 변경
					String monthSpending = formatter.format(Integer.parseInt(dashSpending.getMonthSpending())); // 일평균 생활비
					dashSpending.setMonthSpending(monthSpending);
					
					// recDailyBudget 포맷 변경
					String recDailyBudget = formatter.format(Integer.parseInt(dashSpending.getRecDailyBudget())); // 예상 지출 총액
					dashSpending.setRecDailyBudget(recDailyBudget);
					
					// estimSum 포맷 변경
					String estimSum = formatter.format(Integer.parseInt(dashSpending.getEstimSum())); // 예상 지출 총액
					dashSpending.setEstimSum(estimSum);
					
					mav.addObject("onepickInfo", onepickInfo);
					mav.addObject("dashboardInfo", dashboardInfo);
					mav.addObject("dashSpending", dashSpending);
				}
				
				// 원픽통장 대시보드 분석 view
				else if (path.equals("analysis")) {
					mav = new ModelAndView("/product/analysis");

					System.out.println("로그인 vo 체크 : " + loginVO.toString());
					System.out.println("원픽통장 조회 :  " + onepickInfo.toString());
					
					// 1. ssn1에서 나이를 추출해서 00대 표시
					// 1-1. 출생/올해 연도 추출
					int birth = Integer.parseInt(loginVO.getSsn1().substring(0,2));
					birth = birth + 1900;
					Calendar cal = Calendar.getInstance();
					int year = cal.get(Calendar.YEAR);
						
					// 1-2. 나이대 추출
					String age = Integer.toString(year - birth);
					age = age.substring(0,1) + "0";
					onepickInfo.setAge(age);	// 나이대를 세팅 
					
					// 2. 비교분석 메소드 실행 
					AnalysisVO analyAge = productService.analyAge(onepickInfo);
					AnalysisVO analySeg = productService.analySeg(onepickInfo);
					System.out.println("pro con 체크3 : " + analyAge.toString());
					System.out.println("pro con 체크4 : " + analySeg.toString());
					
					
					// 3. 나 vs 또래 비율 계산
					DecimalFormat form = new DecimalFormat("#.#");
					double myExtraMoney = Double.parseDouble(onepickInfo.getExtraMoney());	// 내 예비금
					double comExtraMoney = Double.parseDouble(analyAge.getExtraMoneyAge());	// 동 나이대 예비금 평균
//					int myLivingCost = Integer.parseInt(onepickInfo.getLivingCost());	// 내 생활비
//					int comLivingCost = Integer.parseInt(analyAge.getLivingCostAge());	// 동 나이대 생활비 평균
//					int myFixedMoney = Integer.parseInt(onepickInfo.getBaseMoney());	// 내 고정비 
//					int comFixedMoney = Integer.parseInt(analyAge.getFixedCostAge());	// 동 나이대 고정비 평균
					
					String flag ="";
					
					// 1) 예비금 높을 때, 
					
					if(myExtraMoney > comExtraMoney ) {
						String extraRatio = form.format(myExtraMoney / comExtraMoney * 100); // 초과 비율 계산
						flag = "case1";
						
						mav.addObject("flag", flag);
						mav.addObject("extraRatio", extraRatio);	// 초과비율 등록(view단에서 flag로 사용)
						
						// 2) 예비금 낮을 때,
					} else if(myExtraMoney <= comExtraMoney ) {
						String extraRatio = form.format(myExtraMoney / comExtraMoney * 100); // 초과 비율 계산
						flag = "case2";

						mav.addObject("flag", flag); // 초과비율 등록(view단에서 flag로 사용)
						mav.addObject("extraRatio", extraRatio); // 초과비율 등록(view단에서 flag로 사용)
					} 
					
					/*
					 * // 3) 생활비 높을 때, if (myLivingCost > comLivingCost) { int livingRatio =
					 * myLivingCost / comLivingCost * 100; // 초과 비율 계산 String flag = "case3";
					 * 
					 * mav.addObject("flag", flag); // 초과비율 등록(view단에서 flag로 사용)
					 * mav.addObject("livingRatio", livingRatio); // 초과비율 등록(view단에서 flag로 사용)
					 * 
					 * // 4) 생활비 낮을 때, } else if (myLivingCost <= comLivingCost) { int livingRatio =
					 * myLivingCost / comLivingCost * 100; // 초과 비율 계산 String flag = "case4";
					 * 
					 * mav.addObject("flag", flag); // 초과비율 등록(view단에서 flag로 사용)
					 * mav.addObject("livingRatio", livingRatio); // 초과비율 등록(view단에서 flag로 사용) }
					 */
					
					System.out.println(flag);
					// 3. 비교분석  결과 저장
					mav.addObject("autoInfo", autoInfo);
					mav.addObject("onepickInfo", onepickInfo);
					mav.addObject("analyAge", analyAge);
					mav.addObject("analySeg", analySeg);
				}
	
				// 예외발생 view
				else {
					mav = new ModelAndView("redirect:/");
				}
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
	
	
	/**
	 * 원픽 예산 삭제
	 * @param productVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping("/product/onepick/budget/deleteBudget")
	public String deleteBudget(BudgetVO budgetVO) throws Exception{
		System.out.println("파라미터 체크 : " + budgetVO.toString() );
		
		productService.deleteBudget(budgetVO);
		
		return "";
	}
	
	
	
	
	
	
	
}
