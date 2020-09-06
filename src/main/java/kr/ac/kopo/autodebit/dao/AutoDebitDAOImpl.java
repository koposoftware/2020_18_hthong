package kr.ac.kopo.autodebit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;

@Repository
public class AutoDebitDAOImpl implements AutoDebitDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 자동이체 리스트 조회
	 */
	@Override
	public List<AutoDebitVO> autodebitList(AutoDebitVO autoDebitVO) {
		List<AutoDebitVO> autodebitList = sqlSession.selectList("autodebit.dao.AutoDebitDAO.autodebitList",
				autoDebitVO);
		return autodebitList;
	}

	/**
	 * 자동이체 리스트 조건조회
	 */
	@Override
	public List<AutoDebitVO> selectByCategry(AutoDebitVO autoDebitVO) {
		List<AutoDebitVO> autodebitList = sqlSession.selectList("autodebit.dao.AutoDebitDAO.selectByCategry",
				autoDebitVO);
		return autodebitList;
	}

	/**
	 * 자동이체 등록
	 */
	@Override
	public int autoDebitReg(AutoDebitVO autoDebitVO) {
		int chkResult = 0;

		try {
			chkResult = sqlSession.insert("autodebit.dao.AutoDebitDAO.autodebitReg", autoDebitVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chkResult;
	}

	/**
	 * 자동이체 삭제
	 */
	@Override
	public int autoDebitDelete(AutoDebitVO autoDebitVO) {
		int result = 0;

		try {
			result = sqlSession.delete("autodebit.dao.AutoDebitDAO.autodebitDelete", autoDebitVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 자동이체 변경
	 */
	@Override
	public int autoDebitModify(AutoDebitVO autoDebitVO) {
		int result = 0;

		try {
			System.out.println("dao체크");
			result = sqlSession.update("autodebit.dao.AutoDebitDAO.autoDebitModify", autoDebitVO);
			System.out.println("dao체크2");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//////////////////////////////////////////////////////////////////////////////
	//////// 자동이체 실행 로직
	//////////////////////////////////////////////////////////////////////////////

	/**
	 * 오늘 날짜 = 지정일인 자동이체 정보조회
	 */
	@Override
	public List<AutoDebitVO> selectByDate() {
		List<AutoDebitVO> selectByDate = null;
		// 자동이체 조건 검색 쿼리
		try {
			selectByDate = sqlSession.selectList("autodebit.dao.AutoDebitDAO.selectByDate");
			System.out.println(selectByDate.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectByDate;
	}

	/**
	 * 자동이체 출금
	 */
	@Override
	public void autoDebitSend(AutoDebitVO autoDebitVO) {
		try {
			System.out.println("check in dao1 : " + autoDebitVO.toString());
			sqlSession.update("autodebit.dao.AutoDebitDAO.autoDebitSend", autoDebitVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 자동이체 입금
	 */
	@Override
	public void autoDebitReceive(AutoDebitVO autoDebitVO) {
		try {
			System.out.println("check in dao2 : " + autoDebitVO.toString());
			sqlSession.update("autodebit.dao.AutoDebitDAO.autoDebitReceive", autoDebitVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 자동이체 마지막 실행일 수정
	 */
	@Override
	public void lastRunDate(AutoDebitVO autoDebitVO) {
		try {
			System.out.println(autoDebitVO.getAutodebitCode());
			sqlSession.update("autodebit.dao.AutoDebitDAO.lastRunDate", autoDebitVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
