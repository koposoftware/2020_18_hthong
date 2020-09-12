package kr.ac.kopo.banking.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;
import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;

@Repository
public class BankingDAOImpl implements BankingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int checkAccNo(BankingVO bankingVO) {
		int result = 0;
		result = sqlSession.selectOne("banking.dao.BankingDAO.checkAccNo", bankingVO);
		return result;
	}

	@Override
	public int withdraw(BankingVO bankingVO) {
		int result = 0;
		result = sqlSession.update("banking.dao.BankingDAO.withdraw", bankingVO);
		return result;
	}

	@Override
	public int deposit(BankingVO bankingVO) {
		int result = 0;
		result = sqlSession.update("banking.dao.BankingDAO.deposit", bankingVO);
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
