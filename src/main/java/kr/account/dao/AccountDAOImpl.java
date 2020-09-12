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

	
	/**
	 * 계좌목록 조회
	 */
	@Override
	public List<AccountVO> inquiryAcc(MemberVO member) throws Exception {
		List<AccountVO> accountList = sqlSession.selectList("account.dao.AccountDAO.inquiryAcc", member);
		return accountList;
	}
	
	
	/**
	 * 통장전환용 계좌조회
	 */
	@Override
	public List<AccountVO> inquiryChkAcc(MemberVO member) throws Exception {
		List<AccountVO> accountList = sqlSession.selectList("account.dao.AccountDAO.inquiryChkAcc", member);
		return accountList;
	}



	/**
	 * 계좌조회(계좌번호로)
	 */
	@Override
	public AccountVO inquiryOneAcc(AccountVO accountVO) throws Exception {
		AccountVO accountInfo = sqlSession.selectOne("account.dao.AccountDAO.inquiryOneAcc", accountVO);
		return accountInfo;
	}


	/**
	 * 계좌 수정
	 */
	@Override
	public void changeAccInfo(AccountVO accountVO) throws Exception {

		System.out.println("accountDOA 계좌수정 메소드 : " + accountVO.toString());
		sqlSession.update("account.dao.AccountDAO.changeAccInfo", accountVO);
		System.out.println("accountDOA 계좌수정 메소드 : 실행후");
	}

	
	/**
	 * 계좌 비밀번호 체크
	 */
	@Override
	public int checkPwd(AccountVO accountVO) throws Exception {
		
		int checkResult = sqlSession.selectOne("account.dao.AccountDAO.checkPwd", accountVO);
		
		return checkResult;
	}

}
