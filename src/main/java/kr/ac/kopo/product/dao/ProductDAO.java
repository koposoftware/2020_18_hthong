package kr.ac.kopo.product.dao;


import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.ProductVO;

public interface ProductDAO {
	// 원픽통장 현황 조회
	public ProductVO onepickInfo(MemberVO member);
	
	// 통장전환
	public void convertAcc(AccountVO accountVO);
}
