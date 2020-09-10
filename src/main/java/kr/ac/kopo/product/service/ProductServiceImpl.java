package kr.ac.kopo.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.dao.ProductDAO;
import kr.ac.kopo.product.vo.BudgetVO;
import kr.ac.kopo.product.vo.OnepickVO;
import kr.ac.kopo.product.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private AccountDAO accountDAO;

	
	/**
	 * 원픽통장 현황
	 */
	@Override
	public ProductVO onepickInfo(MemberVO member) throws Exception{
		ProductVO onepickInfo = productDAO.onepickInfo(member);
		return onepickInfo;
	}
	

	/**
	 * 통장전환
	 */
	@Override
	public AccountVO convertAcc(AccountVO accountVO) throws Exception{
		///
		System.out.println("check in pro_serv : " + accountVO.toString() );
		
		//account 테이블에서 통장전환 계좌 update(acc_name)
		accountVO.setAccName("하나원픽통장");
		accountDAO.changeAccInfo(accountVO);
		
		//onepick_account 테이블에서 원픽통장 신규등록 insert
		productDAO.convertAcc(accountVO);
		
		//원픽통장 정보 반환
		accountVO = accountDAO.inquiryOneAcc(accountVO);
		
		return accountVO;
	}

	/**
	 * 원픽통장 금액이동
	 */
	@Override
	public int onepickTransfer(OnepickVO onepickVO) throws Exception {
		int result = 0;
		
		// 이동(출금)
		int result1 = productDAO.sendMoney(onepickVO);
		
		// 이동(입금)
		int result2 = productDAO.receiveMoney(onepickVO);
		
		// 원픽 거래내역 입력
		int result3 = productDAO.sendTrans(onepickVO);
		
		return result;
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


	@Override
	public void insertBudget(BudgetVO budgetVO) throws Exception {
		productDAO.insertBudget(budgetVO);
	}
	
	
	
	
	
}
