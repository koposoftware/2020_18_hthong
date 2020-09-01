package kr.ac.kopo.banking.dao;

import java.util.List;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;
import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;

public interface BankingDAO {
	// 계좌번호 확인
	void checkAccNo(BankingVO bankingVO);

	// 계좌이체(내 계좌 출금)
	void withdraw(BankingVO bankingVO);

	// 계좌이체(상대 계좌 입금)
	void deposit(BankingVO bankingVO);
	
	// 거래내역 조회
	public List<TransactionVO> transHistory(TransactionVO transactionVO);
	
	// 자동이체 조회
	public List<AutoDebitVO> autodebitList(AutoDebitVO autoDebitVO);
	
	// 자동이체 등록
	public int autoDebitReg(AutoDebitVO autoDebitVO);
	
}
