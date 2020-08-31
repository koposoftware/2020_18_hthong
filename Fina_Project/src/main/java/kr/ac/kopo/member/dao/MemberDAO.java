package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {
	
	// �α���
	MemberVO login(MemberVO member);
	
	// ȸ������ ��ȸ
	MemberVO mypage(MemberVO member);
	
	// ȸ������ ����
	void editUserInfo(MemberVO member);
	
	// ȸ������
	void signUp(MemberVO member);

	// ȸ��Ż��
	void signOut(MemberVO member);
}
