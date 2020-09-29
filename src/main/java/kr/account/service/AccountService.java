package kr.ac.kopo.account.service;


import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;

public interface AccountService {

	// 전체 계좌 조회
	List<AccountVO> inquiryAcc(MemberVO loginVO) throws Exception;
	
	// 통장전환용 계좌조회
	List<AccountVO> inquiryChkAcc(MemberVO loginVO) throws Exception;
	
	// 통장전환 비밀번호 확인
	int checkPwd(AccountVO accountVO, String id) throws Exception;
}
