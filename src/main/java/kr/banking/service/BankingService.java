package kr.ac.kopo.banking.service;

import java.util.List;

import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;

public interface BankingService {
	// 계좌 이체
	public int transfer(BankingVO bankingVO) throws Exception;

	// 거래내역 조회
	public List<TransactionVO> transaction(TransactionVO transactionVO);


}
