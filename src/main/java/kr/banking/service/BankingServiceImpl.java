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
	 * 계좌 이체
	 */
	@Override
	@Transactional
	public int transfer(BankingVO bankingVO) throws Exception{
		int check = 0;
		
		if(bankingVO.getMemo() == "") {
			bankingVO.setMemo("계좌이체");
		}
		
		// 계좌비밀번호 확인
		int result1 = bankingDAO.checkAccNo(bankingVO);
		System.out.println(result1);
		
		// 이체(계좌출금)
		int result2 = bankingDAO.withdraw(bankingVO);
		System.out.println(result2);
		
		// 이체(계좌입금)
		int result3 = bankingDAO.deposit(bankingVO);
		System.out.println(result3);
		
		// 거래내역 입력(출금내역)
		int result4 = bankingDAO.sendTransaction(bankingVO);
		System.out.println(result4);
		
		// 거래내역 입력(입금내역)
		int result5 = bankingDAO.receiveTransaction(bankingVO);
		System.out.println(result5);
		
		
		
		return check;
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
