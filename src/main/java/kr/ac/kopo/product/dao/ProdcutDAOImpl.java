package kr.ac.kopo.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.product.vo.ProductVO;

@Repository
public class ProdcutDAOImpl implements ProdcutDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ProductVO> onepickInfo(ProductVO producVo) {
		List<ProductVO> onepickInfo = sqlSession.selectList("product.dao.ProductDAO.onepickInfo", producVo);

		System.out.println("check in dao : " + producVo.toString());

		return onepickInfo;
	}

}
