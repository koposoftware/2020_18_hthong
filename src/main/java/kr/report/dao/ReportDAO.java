package kr.ac.kopo.report.dao;

import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.ProductVO;
import kr.ac.kopo.report.vo.MailVO;
import kr.ac.kopo.report.vo.ReportTransVO;
import kr.ac.kopo.report.vo.ReportVO;

public interface ReportDAO {
	// tts 리스트 조회
	public ReportVO ttsPathByAcc(ProductVO onepickInfo);
	
	// tts 정보조회
	public List<ReportVO> ttsPathList();
	
	// 월간 금융리포트 리스트
	public List<ReportVO> mailsendList(ProductVO onepickInfo);

	
	
	//////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////
	
	
	// 1. 이메일 요약부분 - 예산구성
	public MailVO reportSummary(MailVO mailVO);
	
	
	// 2-1. 이메일 요약부분 - 예산리뷰 - 1) 당월 소비지출 TOP3 날짜 + 합계
	public List<MailVO> rankSum(MailVO mailVO);
	
	
	// 2-2. 이메일 요약부분 - 예산리뷰 - 2) 당월 소비지출 TOP3 TRANSACTION
	public List<ReportTransVO> rankTrans(MailVO mailVO);
	
	// 3. 주차별 지출현황
	public MailVO weeklySpend(MailVO mailVO);
	
	// 4. 요일별 지출현황
	public MailVO daySpend(MailVO mailVO);
	
	
	
	
	
	
}
