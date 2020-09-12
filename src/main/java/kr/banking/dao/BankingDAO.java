package kr.ac.kopo.banking.dao;

import java.util.List;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;
import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;

public interface BankingDAO {
	// 계좌번호 확인
	int checkAccNo(BankingVO bankingVO);

	// 계좌이체(내 계좌 출금)
	int withdraw(BankingVO bankingVO);

	// 계좌이체(상대 계좌 입금)
	int deposit(BankingVO bankingVO);

	// 거래내역 조회
	public List<TransactionVO> transHistory(TransactionVO transactionVO);

	// 거래내역 로그(보낸 계좌)
	int sendTransaction(BankingVO bankingVO) throws Exception;

	// 거래내역 로그(보낸 계좌)
	int receiveTransaction(BankingVO bankingVO) throws Exception;

}
