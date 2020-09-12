package kr.ac.kopo.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	/*
	 * 로그인
	 */
	@Override
	public MemberVO login(MemberVO member) { // 사용자 입력값
		return memberDAO.login(member);
	}

	/*
	 * 회원정보 조회
	 */
	@Override
	public MemberVO mypage(MemberVO member) {
		return memberDAO.mypage(member);
	}

	/*
	 * 회원정보 수정
	 */
	@Override
	public void editUserInfo(MemberVO member) {
		memberDAO.editUserInfo(member);
	}

	/*
	 * 회원가입
	 */
	@Override
	public void signUp(MemberVO member) {
		memberDAO.signUp(member);
	}

	@Override
	public void signOut(MemberVO member) {
		memberDAO.signOut(member);
	}

}
