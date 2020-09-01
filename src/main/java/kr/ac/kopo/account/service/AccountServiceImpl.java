package kr.ac.kopo.account.service;

import java.util.List;

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
	public List<AccountVO> inquiryAcc(MemberVO loginVO) {
		
		List<AccountVO> accountList = accountDAO.inquiryAcc(loginVO);
		
		return accountList;
	}

	

}
