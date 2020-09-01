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
	
	@Override
	public void autoDebitSend(AutoDebitVO autoDebitVO) {
		
		try {
			System.out.println("check in dao1 : " +autoDebitVO.toString() );
			sqlSession.update("autodebit.dao.AutoDebitDAO.autoDebitSend", autoDebitVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void autoDebitReceive(AutoDebitVO autoDebitVO) {
		try {
			System.out.println("check in dao2 : " + autoDebitVO.toString() );
			sqlSession.update("autodebit.dao.AutoDebitDAO.autoDebitReceive", autoDebitVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

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
