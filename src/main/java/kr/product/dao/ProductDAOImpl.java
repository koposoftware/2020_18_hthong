package kr.ac.kopo.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.BudgetVO;
import kr.ac.kopo.product.vo.OnepickVO;
import kr.ac.kopo.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/**
	 * 원픽통장 조회
	 */
	@Override
	public ProductVO onepickInfo(MemberVO memberVO) {
		ProductVO onepickInfo = sqlSession.selectOne("product.dao.ProductDAO.onepickInfo", memberVO);
		
		return onepickInfo;
	}

	/**
	 * 통장전환 
	 */
	@Override
	public void convertAcc(AccountVO accountVO) {
		System.out.println("체크 pro dao : " + accountVO.toString());
		sqlSession.insert("product.dao.ProductDAO.convertAcc", accountVO);
	}

	
	///////////////////////////
	////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 금액이동(출금)
	 */
	@Override
	public int sendMoney(OnepickVO onepickVO) {
		int result = 0;
		
		// 컬럼 설정(동적쿼리)
		String columnParam = onepickVO.getSender();
		onepickVO.setColumnParam(columnParam);
		
		result = sqlSession.update("product.dao.ProductDAO.sendMoney", onepickVO);
		return result;
	}

	/**
	 * 금액이동(입금)
	 */
	@Override
	public int receiveMoney(OnepickVO onepickVO) {
		int result = 0;
		
		// 컬럼 설정(동적쿼리)
		String columnParam = onepickVO.getReceiver();
		onepickVO.setColumnParam(columnParam);
		
		result = sqlSession.update("product.dao.ProductDAO.receiveMoney", onepickVO);
		return result;
	}

	/**
	 * 원픽 거래내역
	 */
	@Override
	public int sendTrans(OnepickVO onepickVO) {
		int result = 0;
		
		System.out.println("체크 거래내역 출금 : " + onepickVO.toString());
		
		result = sqlSession.update("product.dao.ProductDAO.sendTrans", onepickVO);
		return result;
	}

	
	/**
	 * 원픽 예산목록 조회
	 */
	@Override
	public List<BudgetVO> budgetList(ProductVO productVO) {
		
		List<BudgetVO> budgetList = sqlSession.selectList("product.dao.ProductDAO.budgetList", productVO);
		return budgetList;
	}

	
	/**
	 * 원픽 총예산 수정 - 완료
	 */
	@Override
	public void updateTotalBudget(ProductVO productVO) {
		sqlSession.update("product.dao.ProductDAO.updateTotalBudget", productVO);
	}

	
	/**
	 * 원픽 자동 금액이동 조회
	 */
	@Override
	public ProductVO autoInfo(ProductVO productVO) {
		
		ProductVO autoInfo = sqlSession.selectOne("product.dao.ProductDAO.autoInfo", productVO);
		return autoInfo;
	}

	
	/**
	 * 원픽 자동 금액이동 입력
	 */
	@Override
	public void insertAutoSend(ProductVO productVO) {
		sqlSession.insert("product.dao.ProductDAO.insertAutoSend", productVO);
		
	}

	/**
	 * 원픽 자동 금액이동 수정
	 */
	@Override
	public void updateAutoSend(ProductVO productVO) {
		System.out.println("dao 체크1");
		sqlSession.update("product.dao.ProductDAO.updateAutoSend", productVO);
		System.out.println("dao 체크2");
	}

	
	/**
	 * 원픽 예산 등록
	 */
	@Override
	public void insertBudget(BudgetVO budgetVO) {
		sqlSession.insert("product.dao.ProductDAO.insertBudget", budgetVO);
		
	}

	
	/**
	 * 원픽 예산 삭제
	 */
	@Override
	public void deleteBudget(BudgetVO budgetVO) {
		sqlSession.delete("product.dao.ProductDAO.deleteBudget", budgetVO);
		
	}
	
	
	
	
	
	
	

}
