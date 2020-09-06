package kr.ac.kopo.autodebit.service;

import java.util.List;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;

public interface AutoDebitService {
	
	// 자동이체 조회
	public List<AutoDebitVO> autoDebitList(AutoDebitVO autoDebitVO);

	// 자동이체 조건조회
	public List<AutoDebitVO> selectByCategry(AutoDebitVO autoDebitVO);
	
	// 자동이체 등록
	public int autoDebitReg(AutoDebitVO autoDebitVO);
	
	// 자동이체 삭제
	public int autoDebitDelete(AutoDebitVO autoDebitVO);
	
	// 자동이체 변경
	public int autoDebitModify(AutoDebitVO autoDebitVO);
	
	
	
	
	// 자동이체 실행 메소드
	void autoDebitExecute(); 
}
