package kr.ac.kopo.paying.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.paying.dao.PayingDAO;
import kr.ac.kopo.paying.vo.PayingVO;

@Service
public class PayingServiceImpl implements PayingService {
	
	@Autowired
	private PayingDAO payingDAO;
	
	
	/**
	 * 체크카드 연결계좌 확인
	 */
	@Override
	public AccountVO linkedAcc(MemberVO loginVO) {
		AccountVO linkedAcc = new AccountVO();
		
		System.out.println("체크카드 연결계좌 ser1 : " + loginVO.toString());
		
		linkedAcc = payingDAO.linkedAcc(loginVO);
		
		System.out.println("체크카드 연결계좌 ser2 : " + linkedAcc.toString());

		return linkedAcc;
	}

	/**
	 * 체크카드 잔액확인
	 */
	@Override
	public PayingVO chkBalance(PayingVO payingVO) {
		PayingVO resultVO = new PayingVO();
		
		System.out.println("체크카드 ser1 : " + payingVO.toString());
		
		resultVO = payingDAO.chkBalance(payingVO);
		
		System.out.println("체크카드 ser2 : " + resultVO.toString());

		return resultVO;
	}

	/**
	 * 체크카드 결제 / 거래내역
	 */
	@Override
	public int paying(PayingVO payingVO) {
		
		int payResult = 0;
		int payRecord = 0;
		
		System.out.println("체크카드 결제 ser1 : " + payingVO.toString());
		
		// 체크카드 출금
		payResult = payingDAO.paying(payingVO);
		
		System.out.println("체크카드 결제 ser2 : " + payResult);

		// 체크카드 출금로그
		payRecord = payingDAO.payingTransaction(payingVO);
		
		System.out.println("체크카드 결제 ser2 : " + payRecord);
		
		
		return 0;
	}

	

}
