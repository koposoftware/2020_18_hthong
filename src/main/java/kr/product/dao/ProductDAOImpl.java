package kr.ac.kopo.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.AnalysisVO;
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
	 * 원픽 대시보드_예산
	 */
	@Override
	public AnalysisVO dashboardInfo(ProductVO productVO) {
		System.out.println("pro dao 체크1 : " + productVO.getAccNo());
		AnalysisVO dashboardInfo = sqlSession.selectOne("product.dao.ProductDAO.dashboardInfo", productVO);
		
		return dashboardInfo;
	}


	/**
	 * 원픽 대시보드_지출
	 */
	@Override
	public AnalysisVO dashSpending(ProductVO productVO) {
		AnalysisVO dashSpending = sqlSession.selectOne("product.dao.ProductDAO.dashSpending", productVO);
		return dashSpending;
	}
	
	
	/**
	 * 원픽통장 대시보드 비교분석_나이대
	 */
	@Override
	public AnalysisVO analyAge(ProductVO productVO) {
		AnalysisVO analyAge = sqlSession.selectOne("product.dao.ProductDAO.analyAge", productVO);
		return analyAge;
	}


	/**
	 * 원픽통장 대시보드 비교분석_소득
	 */
	@Override
	public AnalysisVO analySeg(ProductVO productVO) {
		int budgetFlag = Integer.parseInt(productVO.getTotalBudget());
		if( budgetFlag <= 2640000) {
			productVO.setTotalBudget("1890000");
		} else if(budgetFlag > 2640000 && budgetFlag <= 3860000) {
			productVO.setTotalBudget("3190000");
		} else if(budgetFlag > 3860001 && budgetFlag <= 5100000) {
			productVO.setTotalBudget("4530000");
		} else if(budgetFlag > 5100001 && budgetFlag <= 7840000) {
			productVO.setTotalBudget("5660000");
		} else if(budgetFlag > 7840001) {
			productVO.setTotalBudget("9020000");
		}

		AnalysisVO analySeg = sqlSession.selectOne("product.dao.ProductDAO.analySeg", productVO);
		return analySeg;
	}
	
	
	///////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////

	/**
	 * 통장전환 
	 */
	@Override
	public void convertAcc(AccountVO accountVO) {
		sqlSession.insert("product.dao.ProductDAO.convertAcc", accountVO);
	}


	/**
	 * 금액이동(출금)
	 */
	@Override
	public int sendMoney(OnepickVO onepickVO) {
		int result = 0;
		
		// 컬럼 설정(동적쿼리)
		System.out.println("dao 체크 : " + onepickVO.toString());
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
		System.out.println("dao 체크 : " + onepickVO.toString());
		result = sqlSession.update("product.dao.ProductDAO.receiveMoney", onepickVO);
		return result;
	}

	/**
	 * 원픽 거래내역
	 */
	@Override
	public int sendTrans(OnepickVO onepickVO) {
		int result = 0;
		
		result = sqlSession.update("product.dao.ProductDAO.sendTrans", onepickVO);
		return result;
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
	 * 원픽 예산목록 조회
	 */
	@Override
	public List<BudgetVO> budgetList(ProductVO productVO) {
		List<BudgetVO> budgetList = sqlSession.selectList("product.dao.ProductDAO.budgetList", productVO);
		return budgetList;
	}
	
	
	/**
	 * 원픽 총예산 조회
	 */
	@Override
	public int budgetSum(ProductVO productVO) throws Exception {
		int budgetSum = sqlSession.selectOne("product.dao.ProductDAO.budgetSum", productVO);
		return budgetSum;
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


	///////////////////////////////////////////////////////////////////////
	/**
	 * 원픽 스케줄링
	 */
	@Override
	public List<ProductVO> autoList(ProductVO productVO) {
		List<ProductVO> autoInfo = sqlSession.selectList("product.dao.ProductDAO.selectByDate", productVO);
		return autoInfo;
	}
	
	
	
	
	 
	
	

}
