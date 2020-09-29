package kr.ac.kopo.product.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.dao.ProductDAO;
import kr.ac.kopo.product.vo.AnalysisVO;
import kr.ac.kopo.product.vo.BudgetVO;
import kr.ac.kopo.product.vo.OnepickVO;
import kr.ac.kopo.product.vo.ProductVO;

@Service("scheduleExecute")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private AccountDAO accountDAO;

	/**
	 * 원픽통장 현황
	 */
	@Override
	public ProductVO onepickInfo(MemberVO member) throws Exception {
		ProductVO onepickInfo = productDAO.onepickInfo(member);
		return onepickInfo;
	}

	/**
	 * 원픽 대시보드 조회_예산
	 */
	@Override
	public AnalysisVO dashboardInfo(ProductVO onepickVO) throws Exception {
		System.out.println("pro ser 체크1 : " + onepickVO.getAccNo());

		AnalysisVO dashboardInfo = productDAO.dashboardInfo(onepickVO);

		return dashboardInfo;
	}

	/**
	 * 원픽 대시보드 조회_지출
	 */
	@Override
	public AnalysisVO dashSpending(ProductVO onepickVO) throws Exception {
		System.out.println("pro ser 체크3 : " + onepickVO.getAccNo());
		AnalysisVO dashSpending = productDAO.dashSpending(onepickVO);
		System.out.println("pro ser 체크4 : " + dashSpending.toString());

		return dashSpending;
	}

	//////////////////////////////////////////////////////////////////////// \
	//////////////////////////////////////////////////////////////////////// \

	/**
	 * 원픽 대시보드_비교분석_나이대
	 */
	@Override
	public AnalysisVO analyAge(ProductVO productVO) throws Exception {
		System.out.println("pro ser 체크1 analyAge : " + productVO.getAccNo());
		AnalysisVO analyAge = productDAO.analyAge(productVO);
		System.out.println("pro ser 체크2 analyAge : " + analyAge.toString());

		return analyAge;
	}

	/**
	 * 원픽 대시보드_비교분석_예산규모
	 */
	@Override
	public AnalysisVO analySeg(ProductVO productVO) throws Exception {
		System.out.println("pro ser 체크3 analySeg : " + productVO.getAccNo());
		AnalysisVO analySeg = productDAO.analySeg(productVO);
		System.out.println("pro ser 체크4 analySeg : " + analySeg.toString());

		return analySeg;
	}

	//////////////////////////////////////////////////////////////////////// \
	//////////////////////////////////////////////////////////////////////// \

	/**
	 * 통장전환
	 */
	@Override
	public AccountVO convertAcc(AccountVO accountVO) throws Exception {
		///
		System.out.println("check in pro_serv : " + accountVO.toString());

		// account 테이블에서 통장전환 계좌 update(acc_name)
		accountVO.setAccName("하나원픽통장");
		accountDAO.changeAccInfo(accountVO);

		// onepick_account 테이블에서 원픽통장 신규등록 insert
		productDAO.convertAcc(accountVO);

		// 원픽통장 정보 반환
		accountVO = accountDAO.inquiryOneAcc(accountVO);

		return accountVO;
	}

	/**
	 * 원픽통장 금액이동
	 */
	@Override
	public int onepickTransfer(OnepickVO onepickVO) throws Exception {
		int result = 0;
		
		// 보내는 통장
		String sender = onepickVO.getSender();
		String receiver = onepickVO.getReceiver();
		
		// 이동(출금)
		onepickVO.setColumnParam(sender);
		int result1 = productDAO.sendMoney(onepickVO);

		// 이동(입금)
		onepickVO.setColumnParam(receiver);
		int result2 = productDAO.receiveMoney(onepickVO);

		// 원픽 거래내역 입력
		int result3 = productDAO.sendTrans(onepickVO);

		return result;
	}

	/**
	 * 원픽 총예산 수정
	 */
	@Override
	public void updateTotalBudget(ProductVO productVO) throws Exception {
		productDAO.updateTotalBudget(productVO);
	}

	/**
	 * 원픽 자동 금액이동 조회
	 */
	@Override
	public ProductVO autoInfo(ProductVO productVO) throws Exception {
		ProductVO autoInfo = productDAO.autoInfo(productVO);
		return autoInfo;
	}

	/**
	 * 원픽 자동 금액이동 입력
	 */
	@Override
	public void insertAutoSend(ProductVO productVO) throws Exception {
		productDAO.insertAutoSend(productVO);
	}

	/**
	 * 원픽 자동 금액이동 수정
	 */
	@Override
	public void updateAutoSend(ProductVO productVO) throws Exception {
		productDAO.updateAutoSend(productVO);
	}

	/**
	 * 원픽 예산목록 조회
	 */
	@Override
	public List<BudgetVO> budgetList(ProductVO productVO) throws Exception {
		List<BudgetVO> budgetList = productDAO.budgetList(productVO);
		return budgetList;
	}
	
	
	/**
	 * 원픽 예산합계 조회
	 */
	@Override
	public int budgetSum(ProductVO productVO) throws Exception {
		int budgetSum = productDAO.budgetSum(productVO);
		return budgetSum;
	}

	/**
	 * 원픽 예산 등록
	 */
	@Override
	public List<BudgetVO> insertBudget(BudgetVO budgetVO, ProductVO productVO) throws Exception {
		productDAO.insertBudget(budgetVO);
		List<BudgetVO> budgetList = productDAO.budgetList(productVO);
		return budgetList;
	}

	/**
	 * 원픽 예산 삭제
	 */
	@Override
	public void deleteBudget(BudgetVO budgetVO) throws Exception {
		productDAO.deleteBudget(budgetVO);

	}

	//////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 원픽 스케줄링
	 */
	@Override
	public void scheduleExecute() {
		// 0. 날짜포멧 - 지정일 이체를 위해 오늘 일자만 리턴
		SimpleDateFormat format = new SimpleDateFormat("dd");
		Date date = new Date();

		// 1. 자동이체용 당일 날짜 출력(DD값만)
		String systemDate = format.format(date); // 오늘 일자
		System.out.println("오늘 일자 리턴 : " + systemDate);

		// 2. 자동이체 조건 쿼리
		String accNo = "";
		String columnParam = "";
		String money = "";

		String dateToLiving = "";
		String dateToExtra = "";

		ProductVO productVO = new ProductVO();
		productVO.setSysDate(systemDate);
		
		System.out.println("check: " + productVO.getSysDate());
		List<ProductVO> autoList = productDAO.autoList(productVO); // 당일 자동이체 계좌정보(계좌번호, 이체금액) 객체

		System.out.println("자동이체할 계좌정보 객체 확인 : " + autoList);

		// 3. AutoDebit Execute(자동이체 실행)
		// 당일 자동이체할 계좌가 있는 경우
		if (autoList != null) {
			int i = 0;
			
			// 자동이체할 계좌 수만큼 반복
			while (i < autoList.size()) {
				System.out.println("반복횟수 체크 : " + autoList.size());

				// 여기에서 UPDATE 구문 실행 -> i번째 돌때,
				// 출금계좌 execute 실행(accNo, setMoney 매개변수)
				// 입금계좌 execute 실행(opp_acc_no, setMoney 매개변수)
				// 자동이체 테이블 last_run_date 업데이트 실행(autodebit_code 매개변수)

				try {
					OnepickVO onepickAutoVO = new OnepickVO();

					// 당일 자동이체 계좌번호, 금액, 상대계좌, 자동이체 고유번호
					accNo = autoList.get(i).getAccNo();
					onepickAutoVO.setAccNo(accNo);
					onepickAutoVO.setSender("base_money");

					// 기본금 -> 생활비 이동 실행
					if (autoList.get(i).getMoneyToLiving() != null) {

						// 1) 기본금에서 출금
						columnParam = "base_money";		// 컬럼명 세팅
						money = autoList.get(i).getMoneyToLiving(); // 이체금액 세팅
						onepickAutoVO.setColumnParam(columnParam);
						onepickAutoVO.setMoney(money);
						
						productDAO.sendMoney(onepickAutoVO);	// 출금 메소드 실행

						// 2) 생활비에 입금
						columnParam = "living_cost";	// 컬럼명 세팅
						onepickAutoVO.setColumnParam(columnParam);
						
						productDAO.receiveMoney(onepickAutoVO); // 입금 메소드 실행
					}
					
					// 기본금 -> 예비금 이동 실행
					if (autoList.get(i).getMoneyToExtra() != null) {

						// 1) 기본금에서 출금
						columnParam = "base_money";		// 컬럼명 세팅
						money = autoList.get(i).getMoneyToExtra();	
						onepickAutoVO.setMoney(money);	// 이체금액 세팅

						productDAO.sendMoney(onepickAutoVO); 	// 출금 메소드 실행

						// 2) 생활비에 입금
						columnParam = "extra_money";	// 컬렴명 세팅
						onepickAutoVO.setColumnParam(columnParam);

						productDAO.receiveMoney(onepickAutoVO);	// 입금 메소드 실행
					}

					System.out.println("자동이체 조건 맞는 계좌번호 : " + accNo);
					System.out.println("자동이체 컬럼 : " + columnParam);
					System.out.println("자동이체 금액 : " + money);
					System.out.println(i + "=======================================");

					
					// 분석 필요없어서 거래내역 로그 남길 필요성 없어짐.
					// 4-1. 자동이체 시 거래내역 로그(출금계좌) 
//					onepickAutoVO.setReceiver(("living_cost");
//					productDAO.sendTrans(onepickAutoVO);
					// 4-2. 자동이체 시 거래내역 로그(입금계좌) 
//					productDAO.receiveTrans(onepickAutoVO);
					  
					i++;
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
	}
}
