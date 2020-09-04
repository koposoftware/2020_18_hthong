package kr.ac.kopo.autodebit.dao;

import java.util.List;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;

public interface AutoDebitDAO {

	// 1. 오늘 날짜 = 지정일인 자동이체 정보조회
	List<AutoDebitVO> selectByDate();

	// 3-1. 자동이체 실행(출금계좌)
	void autoDebitSend(AutoDebitVO autoDebitVO);

	// 3-2. 자동이체 실행(입금계좌)
	void autoDebitReceive(AutoDebitVO autoDebitVO);

	// 5. 자동이체 마지막 거래일 저장
	void lastRunDate(AutoDebitVO autoDebitVO);

}