package kr.ac.kopo.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.product.dao.ProdcutDAO;
import kr.ac.kopo.product.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProdcutDAO prodcutDAO;
	
	@Override
	public List<ProductVO> onepickInfo(ProductVO productVO) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
