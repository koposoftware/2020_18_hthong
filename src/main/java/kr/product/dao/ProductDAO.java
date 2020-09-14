package kr.ac.kopo.product.dao;


import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.AnalysisVO;
import kr.ac.kopo.product.vo.BudgetVO;
import kr.ac.kopo.product.vo.OnepickVO;
import kr.ac.kopo.product.vo.ProductVO;

public interface ProductDAO {
	// 원픽통장 현황 조회
	public ProductVO onepickInfo(MemberVO member);
	
	// 원픽 대시보드_예산
	public AnalysisVO dashboardInfo(ProductVO productVO);
	
	// 원픽 대시보드_지출
	public AnalysisVO dashSpending(ProductVO productVO);
	
	// 원픽 대시보드_비교분석_나이대
	public AnalysisVO analyAge(ProductVO productVO);
	
	// 원픽 대시보드_비교분석_예산규모
	public AnalysisVO analySeg(ProductVO productVO);
	
	
	/////////////////////////////////////////////////////////////////////
	// 통장전환
	public void convertAcc(AccountVO accountVO);
	
	// 이동(출금)
	public int sendMoney(OnepickVO onepickVO);
	
	// 이동(입금)
	public int receiveMoney(OnepickVO onepickVO);
	
	// 원픽 거래내역 입력
	public int sendTrans(OnepickVO onepickVO);
	
	// 원픽 예산목록 조회
	public List<BudgetVO> budgetList(ProductVO productVO);
	
	// 원픽 총예산 수정
	public void updateTotalBudget(ProductVO productVO);
	
	// 원픽 자동 금액이동 조회
	public ProductVO autoInfo(ProductVO productVO);
	
	// 원픽 자동 금액이동 입력
	public void insertAutoSend(ProductVO productVO);
	
	// 원픽 자동 금액이동 입력
	public void updateAutoSend(ProductVO productVO);
	
	// 원픽 예산 수정
	public void insertBudget(BudgetVO budgetVO);
	
	// 원픽 예산 삭제
	public void deleteBudget(BudgetVO budgetVO);
	
	
	
	
	
	
}
