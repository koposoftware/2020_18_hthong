package kr.ac.kopo.banking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;
import kr.ac.kopo.banking.dao.BankingDAO;
import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;

@Service
public class BankingServiceImpl implements BankingService {

	@Autowired
	private BankingDAO bankingDAO;

	/**
	 * 계좌 이체
	 */
	@Transactional
	@Override
	public void transfer(BankingVO bankingVO) {

		bankingDAO.checkAccNo(bankingVO);
		bankingDAO.withdraw(bankingVO);
		bankingDAO.deposit(bankingVO);
	}

	/**
	 * 거래내역 조회
	 */
	@Override
	public List<TransactionVO> transaction(TransactionVO transactionVO) {
		List<TransactionVO> transactionList = bankingDAO.transHistory(transactionVO);

		return transactionList;
	}

	/**
	 * 자동이체 조회
	 */
	@Override
	public List<AutoDebitVO> autoDebitList(AutoDebitVO autoDebitVO) {
		List<AutoDebitVO> autodebitList = bankingDAO.autodebitList(autoDebitVO);

		return autodebitList;
	}

	
	/**
	 * 자동이체 등록
	 */
	@Override
	public int autoDebitReg(AutoDebitVO autoDebitVO) {
		int chkResult = bankingDAO.autoDebitReg(autoDebitVO);
		
		return chkResult;
	}

	
	
}
