package kr.ac.kopo.member.service;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {

	//�α���
	public MemberVO login(MemberVO member);
	
	//������ȸ
	public MemberVO mypage(MemberVO member);
	
	//��������
	public void editUserInfo(MemberVO member);
	
	//ȸ������
	public void signUp(MemberVO member);
	
	//ȸ��Ż��
	public void signOut(MemberVO member);
}
