package kr.ac.kopo.banking.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;

@Repository
public class BankingDAOImpl implements BankingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/**
	 * 계좌이체 - 비밀번호 확인
	 */
	@Override
	public int checkAccNo(BankingVO bankingVO) {

		System.out.println("체크 dao accNo " + bankingVO.toString());
		int result = 0;
		result = sqlSession.selectOne("banking.dao.BankingDAO.checkAccNo", bankingVO);
		
		return result;
	}
	
	
	/**
	 * 계좌이체 - 잔액확인
	 */
	@Override
	public int chkBalance(BankingVO bankingVO) {
		System.out.println("체크 dao bal" + bankingVO.toString());
		int result = 0;
		result = sqlSession.selectOne("banking.dao.BankingDAO.chkBalance", bankingVO);
		
		return result;
	}


	/**
	 * 계좌이체 - 상대방계좌 확인
	 */
	@Override
	public int chkOppAccNo(BankingVO bankingVO) {
		System.out.println("체크 dao oppacc " + bankingVO.toString());
		int result = 0;
		result = sqlSession.selectOne("banking.dao.BankingDAO.chkOppAccNo", bankingVO);
		
		return result;
	}



	@Override
	public int withdraw(BankingVO bankingVO) {
		int result = 0;
		result = sqlSession.update("banking.dao.BankingDAO.withdraw", bankingVO);
		
		System.out.println("체크 dao :" + result);
		
		return result;
	}

	@Override
	public int deposit(BankingVO bankingVO) {
		int result = 0;
		result = sqlSession.update("banking.dao.BankingDAO.deposit", bankingVO);
		
		try{
			if(result == 0) {
				bankingVO.setMoney("11111111111111111111");
				sqlSession.update("banking.dao.BankingDAO.withdraw", bankingVO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return result;
	}

	/**
	 * 거래내역 조회
	 */
	@Override
	public List<TransactionVO> transHistory(TransactionVO transactionVO) {
		
		List<TransactionVO> transHistory = sqlSession.selectList("banking.dao.BankingDAO.transHistory", transactionVO);
		List<TransactionVO> transSum = sqlSession.selectList("banking.dao.BankingDAO.transSum", transactionVO);
		transHistory.addAll(transSum);
		
		return transHistory;
	}
	
	
	/**
	 * 거래내역 등록
	 */
	@Override
	public int sendTransaction(BankingVO bankingVO) throws Exception {
		int result = sqlSession.update("banking.dao.BankingDAO.sendTransaction", bankingVO);
		return result;
	}

	@Override
	public int receiveTransaction(BankingVO bankingVO) throws Exception {
		
		System.out.println("체크 - vo : " + bankingVO.toString());
		
		int result = sqlSession.update("banking.dao.BankingDAO.receiveTransaction", bankingVO);
		return result;
	}


}
