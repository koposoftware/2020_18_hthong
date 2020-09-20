package kr.ac.kopo.banking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.banking.dao.BankingDAO;
import kr.ac.kopo.banking.vo.BankingVO;
import kr.ac.kopo.banking.vo.TransactionVO;

@Service
public class BankingServiceImpl implements BankingService {

	@Autowired
	private BankingDAO bankingDAO;

	
	/**
	 * 계좌 이체 - validation
	 */	
	@Override
	public String chkTransfer(BankingVO bankingVO) throws Exception {
		/**
		 * 오류코드
		 * 1000 정상
		 * 1001 비밀번호 오류
		 * 1002 잔액부족
		 * 1003 입금계좌 오류 
		 */
		System.out.println("체크 ser");
		
		String chkCode = "1000";
		
		// 1) 계좌비밀번호 확인
		int result1 = bankingDAO.checkAccNo(bankingVO);
		System.out.println("r1 " + result1);
		
		if(result1 == 0) {
			chkCode = "1001";
			return chkCode;
		}
		
		// 2) 출금 가능여부 체크
		int chkBal = bankingDAO.chkBalance(bankingVO);
		System.out.println("chkBal " + chkBal);
		
		if(chkBal < 0) {
			chkCode = "1002";
			return chkCode;
		}
		
		
		// 3) 상대방 계좌 체크
		int chkOpp = bankingDAO.chkOppAccNo(bankingVO);
		System.out.println("chkOpp " + chkOpp);
		
		if(chkOpp < 0) {
			chkCode = "1003";
			return chkCode;
		}
		
		return chkCode;
	}

	/**
	 * 계좌 이체
	 */
	@Transactional
	@Override
	public String transfer(BankingVO bankingVO) throws Exception{

		System.out.println("체크 ser" + bankingVO.toString());
		
		String chkCode = "1000";
		
		
		if(bankingVO.getMemo() == "") {
			bankingVO.setMemo("계좌이체");
		}
		
		// 4) 이체(계좌출금)
		int result2 = bankingDAO.withdraw(bankingVO);
		
		if(result2 == 0) {
			chkCode = "1002";
			return chkCode;
		}
		System.out.println("r3 " + chkCode);
		
		
		// 5) 이체(계좌입금)
		int result3 = bankingDAO.deposit(bankingVO);
		
		if(result3 == 0) {
			chkCode = "1003"; 
			return chkCode;
		}
		System.out.println("r3 " + chkCode);
		
		
		// 6) 거래내역 입력(출금내역)
		int result4 = bankingDAO.sendTransaction(bankingVO);
		System.out.println("r4 " + result4);
		
		// 7) 거래내역 입력(입금내역)
		int result5 = bankingDAO.receiveTransaction(bankingVO);
		System.out.println("r5 " + result5);
		
		return chkCode;
	}

	/**
	 * 거래내역 조회
	 */
	@Override
	public List<TransactionVO> transaction(TransactionVO transactionVO) {
		List<TransactionVO> transactionList = bankingDAO.transHistory(transactionVO);
		
		return transactionList;
	}
	

	
}
