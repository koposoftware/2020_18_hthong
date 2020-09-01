package kr.ac.kopo.product.dao;

import java.util.List;

import kr.ac.kopo.product.vo.ProductVO;

public interface ProdcutDAO {
	
	// 원픽통장 현황 조회
	public List<ProductVO> onepickInfo(ProductVO producVo);

}
