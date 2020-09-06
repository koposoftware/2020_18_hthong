package kr.ac.kopo.product.service;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.ProductVO;

public interface ProductService {
	
	// 원픽통장 현황
	public ProductVO onepickInfo(MemberVO loginVO) throws Exception;
	
	// 통장전환 
	public AccountVO convertAcc(AccountVO accountVO) throws Exception;
}
