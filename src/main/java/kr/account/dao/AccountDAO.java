package kr.ac.kopo.account.dao;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;

public interface AccountDAO {

	//전체계좌 조회
	public List<AccountVO> inquiryAcc(MemberVO member) throws Exception;
	
	//통장전환용 계좌조회
	public List<AccountVO> inquiryChkAcc(MemberVO member) throws Exception;
	
	//계좌조회(계좌번호로)
	public AccountVO inquiryOneAcc(AccountVO accountVO) throws Exception;
	
	//계좌수정
	public void changeAccInfo(AccountVO accountVO) throws Exception;
	
	//계좌 비밀번호 확인
	public int checkPwd(AccountVO accountVO, String id) throws Exception;
}
