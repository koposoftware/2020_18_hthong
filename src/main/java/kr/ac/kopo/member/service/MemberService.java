package kr.ac.kopo.member.service;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {

	//로그인
	public MemberVO login(MemberVO member);
	
	//정보조회
	public MemberVO mypage(MemberVO member);
	
	//정보수정
	public void editUserInfo(MemberVO member);
	
	//회원가입
	public void signUp(MemberVO member);
	
	//회원탈퇴
	public void signOut(MemberVO member);
}
