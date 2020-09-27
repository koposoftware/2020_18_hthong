package kr.ac.kopo.report.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.vo.ProductVO;
import kr.ac.kopo.report.vo.MailVO;
import kr.ac.kopo.report.vo.ReportTransVO;
import kr.ac.kopo.report.vo.ReportVO;

@Repository
public class ReportDAOImple implements ReportDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * tts 리스트 조회
	 */
	@Override
	public ReportVO ttsPathByAcc(ProductVO onepickInfo) {
		System.out.println(onepickInfo.toString());
		ReportVO ttsPathList = sqlSession.selectOne("report.dao.ReportDAO.ttsPathByAcc", onepickInfo);
		System.out.println("결과값 :" + ttsPathList.toString());
		return ttsPathList;
	}


	/**
	 * tts 정보조회
	 */
	@Override
	public List<ReportVO> ttsPathList() {
		List<ReportVO> ttsPathList = sqlSession.selectList("report.dao.ReportDAO.ttsPathList");
		return ttsPathList;
	}

	
	/**
	 * 월간 금융리포트 리스트
	 */
	@Override
	public List<ReportVO> mailsendList(ProductVO onepickInfo) {
		List<ReportVO> mailsendList = sqlSession.selectList("report.dao.ReportDAO.mailsendList", onepickInfo);
		return mailsendList;
	}

	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 1. 이메일 요약부분 - 예산구성
	 */
	@Override
	public MailVO reportSummary(MailVO mailVO) {
		MailVO reportSummary = sqlSession.selectOne("report.dao.ReportDAO.reportSummary", mailVO);
		
		System.out.println(reportSummary.toString());
		return reportSummary;
	}

	/**
	 * 2-1. 이메일 요약부분 - 예산리뷰 - 1) 당월 소비지출 TOP3 날짜 + 합계
	 */
	@Override
	public List<MailVO> rankSum(MailVO mailVO) {
		
		System.out.println("이메일 요약부분 - 예산리뷰 : " + mailVO.getAccNo());
		
		List<MailVO> rankSum = sqlSession.selectList("report.dao.ReportDAO.rankSum", mailVO);
		return rankSum;
	}

	/**
	 * 2-2. 이메일 요약부분 - 예산리뷰 - 2) 당월 소비지출 TOP3 TRANSACTION
	 */
	@Override
	public List<ReportTransVO> rankTrans(MailVO mailVO) {
		
		System.out.println("체크 dao rankTrans1 : " + mailVO.toString());
		List<ReportTransVO> rankTrans = sqlSession.selectList("report.dao.ReportDAO.rankTrans", mailVO);
		
		System.out.println("체크 dao rankTrans2: " + rankTrans.toString());
		
		return rankTrans;
	}

	/**
	 * 3. 주차별 지출현황
	 */
	@Override
	public MailVO weeklySpend(MailVO mailVO) {
		
		mailVO.setAccNo("1081-5111354-59574");
		
		MailVO weeklySpend = sqlSession.selectOne("report.dao.ReportDAO.weeklySpend", mailVO);
		return weeklySpend;
	}

	/**
	 * 4. 요일별 지출현황
	 */
	@Override
	public MailVO daySpend(MailVO mailVO) {
		mailVO.setAccNo("1081-5111354-59574");
		
		MailVO daySpend = sqlSession.selectOne("report.dao.ReportDAO.daySpend", mailVO);
		return daySpend;
	}
	
	
	

}
