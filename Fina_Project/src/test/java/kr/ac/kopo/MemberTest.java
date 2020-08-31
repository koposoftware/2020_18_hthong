package kr.ac.kopo;

import static org.junit.Assert.assertNotNull;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/*.xml" })
public class MemberTest {

	@Autowired
	private MemberDAO memberDAO;
	
	@Ignore
	@Test
	public void 로그인테스트() throws Exception {
		
		MemberVO member = new MemberVO();
		member.setId("user1");
		member.setPassword("1234");
		
		MemberVO loginVO = memberDAO.login(member);
		
		assertNotNull(loginVO);		//잘못된 id, password 넣으면 failure가 뜬다.
	}
	
}