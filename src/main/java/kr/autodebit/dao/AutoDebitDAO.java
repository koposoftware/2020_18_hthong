package kr.ac.kopo.autodebit.dao;

import java.util.List;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;

public interface AutoDebitDAO {

	// 자동이체 조회
	public List<AutoDebitVO> autodebitList(AutoDebitVO autoDebitVO);

	// 자동이체 조건조회
	public List<AutoDebitVO> selectByCategry(AutoDebitVO autoDebitVO);
	
	
	
	// 자동이체 등록
	public int autoDebitReg(AutoDebitVO autoDebitVO);
	
	
	// 자동이체 삭제
	public int autoDebitDelete(AutoDebitVO autoDebitVO);
	
	
	// 자동이체 변경
	public int autoDebitModify(AutoDebitVO autoDebitVO);
	

	////////////////////////////////////////////////////////////////////////////
	//// 자동이체 실행 로직
	////////////////////////////////////////////////////////////////////////////
	
	// 1. 오늘 날짜 = 지정일인 자동이체 정보조회
	List<AutoDebitVO> selectByDate();

	// 3-1. 자동이체 실행(출금계좌)
	void autoDebitSend(AutoDebitVO autoDebitVO);

	// 3-2. 자동이체 실행(입금계좌)
	void autoDebitReceive(AutoDebitVO autoDebitVO);
	
	// 4-1. 자동이체 거래내역(출금)
	public int sendAutoTrans(AutoDebitVO autoDebitVO);
	
	// 4-2. 자동이체 거래내역(입금)
	public int receiveAutoTrans(AutoDebitVO autoDebitVO);

	// 5. 자동이체 마지막 거래일 저장
	void lastRunDate(AutoDebitVO autoDebitVO);

}
