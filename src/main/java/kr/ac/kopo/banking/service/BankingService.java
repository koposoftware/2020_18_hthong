package kr.ac.kopo.banking.service;

import java.util.List;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;
import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;

public interface BankingService {
	// 계좌 이체
	public void transfer(BankingVO bankingVO);

	// 거래내역 조회
	public List<TransactionVO> transaction(TransactionVO transactionVO);

	// 자동이체 조회
	public List<AutoDebitVO> autoDebitList(AutoDebitVO autoDebitVO);
	
	// 자동이체 등록
	public int autoDebitReg(AutoDebitVO autoDebitVO);
}
