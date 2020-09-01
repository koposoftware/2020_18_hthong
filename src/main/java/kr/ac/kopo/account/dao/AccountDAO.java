package kr.ac.kopo.account.dao;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;

public interface AccountDAO {

	//계좌조회
	public List<AccountVO> inquiryAcc(MemberVO member);
	
}
