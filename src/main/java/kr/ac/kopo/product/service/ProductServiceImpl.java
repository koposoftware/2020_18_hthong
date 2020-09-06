package kr.ac.kopo.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.dao.ProductDAO;
import kr.ac.kopo.product.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private AccountDAO accountDAO;

	
	/**
	 * 원픽통장 현황
	 */
	@Override
	public ProductVO onepickInfo(MemberVO member) throws Exception{
		ProductVO onepickInfo = productDAO.onepickInfo(member);
		return onepickInfo;
	}
	

	/**
	 * 통장전환
	 */
	@Override
	public AccountVO convertAcc(AccountVO accountVO) throws Exception{
		///
		System.out.println("check in pro_serv : " + accountVO.toString() );
		
		//account 테이블에서 통장전환 계좌 update(acc_name)
		accountVO.setAccName("하나원픽통장");
		accountDAO.changeAccInfo(accountVO);
		
		//onepick_account 테이블에서 원픽통장 신규등록 insert
		productDAO.convertAcc(accountVO);
		
		//원픽통장 정보 반환
		accountVO = accountDAO.inquiryOneAcc(accountVO);
		
		return accountVO;
	}
	
}
