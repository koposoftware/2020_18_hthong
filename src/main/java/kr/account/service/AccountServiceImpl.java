package kr.ac.kopo.account.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountDAO accountDAO;
	
	/**
	 * 전체계좌 조회
	 */
	@Override
	public List<AccountVO> inquiryAcc(MemberVO loginVO) throws Exception{
		List<AccountVO> accountList = accountDAO.inquiryAcc(loginVO);
		return accountList;
	}
	
	/**
	 * 통장전환용 계좌조회
	 */
	@Override
	public List<AccountVO> inquiryChkAcc(MemberVO loginVO) throws Exception {
		List<AccountVO> accountList = accountDAO.inquiryChkAcc(loginVO);
		return accountList;
	}


	/**
	 * 비밀번호 확인
	 */
	@Override
	public int checkPwd(AccountVO accountVO, String id) throws Exception{
		
		int checkResult = accountDAO.checkPwd(accountVO, id);
		return checkResult;
	}

	
}
