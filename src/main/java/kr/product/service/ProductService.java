package kr.ac.kopo.product.service;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.AnalysisVO;
import kr.ac.kopo.product.vo.BudgetVO;
import kr.ac.kopo.product.vo.OnepickVO;
import kr.ac.kopo.product.vo.ProductVO;

public interface ProductService {

	// 원픽통장 현황
	public ProductVO onepickInfo(MemberVO loginVO) throws Exception;
	
	// 원픽 대시보드 조회_예산
	public AnalysisVO dashboardInfo(ProductVO onepickVO) throws Exception;
	
	// 원픽 대시보드 조회_지출
	public AnalysisVO dashSpending(ProductVO onepickVO) throws Exception;

	// 원픽 대시보드_비교분석_나이대
	public AnalysisVO analyAge(ProductVO productVO) throws Exception;
	
	// 원픽 대시보드_비교분석_예산규모
	public AnalysisVO analySeg(ProductVO productVO) throws Exception;
	
	
	

	// 통장전환
	public AccountVO convertAcc(AccountVO accountVO) throws Exception;

	// 원픽통장 금액이동
	public int onepickTransfer(OnepickVO onepickVO) throws Exception;

	// 원픽 예산목록 조회
	public List<BudgetVO> budgetList(ProductVO productVO) throws Exception;
	
	// 원픽 총예산 수정
	public void updateTotalBudget(ProductVO productVO) throws Exception;
	
	// 원픽 자동금액 이동 조회
	public ProductVO autoInfo(ProductVO productVO) throws Exception;
	
	// 원픽 자동 금액이동 입력
	public void insertAutoSend(ProductVO productVO) throws Exception;
		
	// 원픽 자동 금액이동 입력
	public void updateAutoSend(ProductVO productVO) throws Exception;
	
	// 원픽 예산 등록
	public void insertBudget(BudgetVO budgetVO) throws Exception;
	
	// 원픽 예산 삭제
	public void deleteBudget(BudgetVO budgetVO) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
}
