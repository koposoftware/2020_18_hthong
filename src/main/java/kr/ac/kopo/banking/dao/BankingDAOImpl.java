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
	public void withdraw(BankingVO bankingVO) {
		sqlSession.update("banking.dao.BankingDAO.withdraw", bankingVO);
	}

	@Override
	public void deposit(BankingVO bankingVO) {
		sqlSession.update("banking.dao.BankingDAO.deposit", bankingVO);
	}

	@Override
	public void checkAccNo(BankingVO bankingVO) {
		sqlSession.selectOne("banking.dao.BankingDAO.checkAccNo", bankingVO);
	}

	@Override
	public List<TransactionVO> transHistory(TransactionVO transactionVO) {
		List<TransactionVO> transHistory = sqlSession.selectList("banking.dao.BankingDAO.transHistory", transactionVO);
		List<TransactionVO> transSum = sqlSession.selectList("banking.dao.BankingDAO.transSum", transactionVO);
		transHistory.addAll(transSum);
		return transHistory;
	}


}
