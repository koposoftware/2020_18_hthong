package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class MyBatisTest {

	@Autowired
	private DataSource ds;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Test
	public void DB테스트() throws Exception {
		assertNotNull(ds);
	}
	
	@Test
	public void sqlSession테스트() throws Exception {
		assertNotNull(session);
	}
	
}





