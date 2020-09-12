package kr.ac.kopo.product.service;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.BudgetVO;
import kr.ac.kopo.product.vo.OnepickVO;
import kr.ac.kopo.product.vo.ProductVO;

public interface ProductService {

	// 원픽통장 현황
	public ProductVO onepickInfo(MemberVO loginVO) throws Exception;

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
