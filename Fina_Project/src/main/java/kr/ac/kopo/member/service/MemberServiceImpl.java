package kr.ac.kopo.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	/*
	 * �α���
	 */
	@Override
	public MemberVO login(MemberVO member) {	//����� �Է°�
		
		return memberDAO.login(member);
	}

	/*
	 * ȸ������ ��ȸ
	 */
	@Override
	public MemberVO mypage(MemberVO member) {
		
		return memberDAO.mypage(member);
	}

	/*
	 * ȸ������ ����
	 */
	@Override
	public void editUserInfo(MemberVO member) {
		memberDAO.editUserInfo(member);
	}

	/*
	 * ȸ������
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
