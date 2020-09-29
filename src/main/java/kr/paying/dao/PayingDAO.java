package kr.ac.kopo.paying.dao;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.paying.vo.PayingVO;

public interface PayingDAO {
	
	// 체크카드 연결계좌 확인
	public AccountVO linkedAcc(MemberVO loginVO);
	
	// 계좌잔액 확인
	public PayingVO chkBalance(PayingVO payingVO);

	// 계좌이체(내 계좌 출금)
	int paying(PayingVO payingVO);

	// 거래내역 로그(보낸 계좌)
	int payingTransaction(PayingVO payingVO);
}
