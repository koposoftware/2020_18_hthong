package kr.ac.kopo.reportMon.service;

import java.io.IOException;

import kr.ac.kopo.product.vo.ProductVO;

public interface ReportMonService {
	
	// 월간 금융리포트 생성
	public void makeReportExecute(ProductVO onepickInfo) throws IOException;
	
	// 월간 금융리포트 발송
	public void monthlyReportExecute(ProductVO onepickInfo);
	
	
	
}
