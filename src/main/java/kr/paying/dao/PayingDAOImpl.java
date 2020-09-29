package kr.ac.kopo.paying.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.paying.vo.PayingVO;

@Repository
public class PayingDAOImpl implements PayingDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	/**
	 * 체크카드 연결계좌 확인
	 */
	@Override
	public AccountVO linkedAcc(MemberVO loginVO) {
		AccountVO linkedAcc = new AccountVO();
		
		System.out.println("체크카드 연결계좌1 : " + linkedAcc.toString());
		
		linkedAcc = sqlSession.selectOne("paying.dao.PayingDAO.linkedAcc", loginVO);
		
		System.out.println("체크카드 연결계좌2 : " + linkedAcc.toString());
		
		return linkedAcc;
	}


	/**
	 * 체크카드 연결계좌 잔액확인
	 */
	@Override
	public PayingVO chkBalance(PayingVO payingVO) {
		PayingVO resultVO = new PayingVO();
		
		System.out.println("체크카드 잔액확인1 : " + payingVO.toString());
		
		resultVO = sqlSession.selectOne("paying.dao.PayingDAO.chkBalance", payingVO);
		
		System.out.println("체크카드 잔액확인2 : " + resultVO.toString());
		
		return resultVO;
	}
	
	
	/**
	 * 체크카드 결제
	 */
	@Override
	public int paying(PayingVO payingVO) {
		int payResult = 0;
		System.out.println("체크카드 결제결과1 : " + payingVO.toString());
		
		payResult = sqlSession.update("paying.dao.PayingDAO.paying", payingVO);
		
		System.out.println("체크카드 결제결과2 : " + payResult);
		
		return payResult;
	}
	
	
	/**
	 * 결제 거래내역 기록
	 */
	@Override
	public int payingTransaction(PayingVO payingVO) {
		int payRecord = 0;
		System.out.println("체크카드 거래내역1 : " + payingVO.toString());
		
		payRecord = sqlSession.update("paying.dao.PayingDAO.payingTransaction", payingVO);
		
		System.out.println("체크카드 거래내역2 : " + payRecord);
		
		return payRecord;
	}
	
}
