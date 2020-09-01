package kr.ac.kopo.account.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AccountVO> inquiryAcc(MemberVO member) {
		List<AccountVO> accountList = sqlSession.selectList("account.dao.AccountDAO.inquiryAcc", member);
		return accountList;
	}
}
