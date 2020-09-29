package kr.ac.kopo.banking.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;

@Transactional
public interface BankingService {
	
	// 계좌 이체 - validation
	public String chkTransfer(BankingVO bankingVO) throws Exception;
	
	// 계좌 이체
	public String transfer(BankingVO bankingVO) throws Exception;

	// 거래내역 조회
	public List<TransactionVO> transaction(TransactionVO transactionVO);
	
}