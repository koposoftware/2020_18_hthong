package kr.ac.kopo.product.dao;


import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.BudgetVO;
import kr.ac.kopo.product.vo.OnepickVO;
import kr.ac.kopo.product.vo.ProductVO;

public interface ProductDAO {
	// 원픽통장 현황 조회
	public ProductVO onepickInfo(MemberVO member);
	
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
	
	
	
	
	
	
	
}
