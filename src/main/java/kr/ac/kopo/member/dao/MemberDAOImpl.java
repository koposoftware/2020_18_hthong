package kr.ac.kopo.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberVO login(MemberVO member) {
		MemberVO loginVO = sqlSession.selectOne("member.dao.MemberDAO.login", member);
		return loginVO;
	}

	@Override
	public MemberVO mypage(MemberVO member) {
		MemberVO memberVO = sqlSession.selectOne("member.dao.MemberDAO.mypage", member);
		return memberVO;
	}

	@Override
	public void editUserInfo(MemberVO member) {
		sqlSession.update("member.dao.MemberDAO.editUserInfo", member);
	}

	@Override
	public void signUp(MemberVO member) {
		sqlSession.insert("member.dao.MemberDAO.signUp", member);
	}

	@Override
	public void signOut(MemberVO member) {
		sqlSession.delete("member.dao.MemberDAO.signOut", member);
	}

	
}
