package kr.ac.kopo.product.service;

import java.util.List;

import kr.ac.kopo.product.vo.ProductVO;

public interface ProductService {

	// 원픽통장 현황
	public List<ProductVO> onepickInfo(ProductVO productVO);
	
}