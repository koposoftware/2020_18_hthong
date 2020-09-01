package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {
	
	// 로그인
	MemberVO login(MemberVO member);
	
	// 회원정보 조회
	MemberVO mypage(MemberVO member);
	
	// 회원정보 수정
	void editUserInfo(MemberVO member);
	
	// 회원가입
	void signUp(MemberVO member);

	// 회원탈퇴
	void signOut(MemberVO member);
}
