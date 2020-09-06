package kr.ac.kopo.product.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ProductVO onepickInfo(MemberVO memberVO) {
		
		System.out.println("check in dao122 : " + memberVO.toString());
		
		ProductVO onepickInfo = sqlSession.selectOne("product.dao.ProductDAO.onepickInfo", memberVO);
		
		return onepickInfo;
	}

	@Override
	public void convertAcc(AccountVO accountVO) {
		
		sqlSession.insert("product.dao.ProductDAO.convertAcc", accountVO);
		
	}
	
	

}
