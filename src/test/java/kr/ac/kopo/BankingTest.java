package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.autodebit.vo.AutoDebitVO;
import kr.ac.kopo.banking.dao.BankingDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/*.xml" })
public class BankingTest {

	@Autowired
	private BankingDAO bankingDAO;
	
	@Test
	public void 자동이체TEST() throws Exception {
		
		AutoDebitVO autoDebitVO = new AutoDebitVO();
		
		autoDebitVO.setAccNo("1023-123-123123");
		autoDebitVO.setSetMoney("100000");
		autoDebitVO.setStartDate("2020-09-20");
		autoDebitVO.setOppAccNo("1023-12223-123123");
		autoDebitVO.setCycle("20");
		autoDebitVO.setSetDate("4");
		
		bankingDAO.autoDebitReg(autoDebitVO);
		
		
	}
	
}