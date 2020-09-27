package kr.ac.kopo.report.service;


import kr.ac.kopo.product.vo.ProductVO;
import kr.ac.kopo.report.vo.ReportVO;

public interface ReportService {
	
	// tts 파일경로 조회
	public ReportVO ttsPathByAcc(ProductVO onepickInfo);
	
	// 데일리 리포트 실행(파일업로드, 문자발송)
	public void dailyReportExecute();
	
	// 문자전송 메소드1
	void sendMessage();
}
