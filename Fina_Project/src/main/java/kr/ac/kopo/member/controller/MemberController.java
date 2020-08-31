package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

@SessionAttributes({ "loginVO", "memberVO" })
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	

	////////////////////////////////////////////////////////////////////////////////////////
	// �α���
	////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * �α��� �� �̵�
	 * 
	 * @return /login.jsp
	 */
	@GetMapping("/login")
	public String loginForm() {
		
		return "/login/login";
	}

	/**
	 * �α��� ��
	 * 
	 * @param member(id, pwd)
	 * @param session
	 * @return / or /login.jsp
	 */
	@PostMapping("/login")
	public ModelAndView login(MemberVO member, HttpSession session) {
		MemberVO loginVO = memberService.login(member); // �α����� �Ϸ�Ǹ� ���������� loginVO�� ��´�.
		ModelAndView mav = new ModelAndView();

		// �α��� ����
		if (loginVO == null) {
			mav.setViewName("redirect:/login");
			// �α��� ����
		} else {
			// preHandle ��� ���ƴ��� ���� Ȯ��
			String dest = (String) session.getAttribute("dest");

			if (dest == null) {
				// ���� ������
				mav.setViewName("redirect:/");
			} else {
				mav.setViewName("redirect:" + dest);
				session.removeAttribute(dest);
			}
			mav.addObject("loginVO", loginVO);
		}
		return mav;
	}

	/**
	 * �α׾ƿ�
	 * 
	 * @param status
	 * @return /
	 */
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {

		status.setComplete();

		return "redirect:/";
	}

	////////////////////////////////////////////////////////////////////////////////////////
	// ȸ��
	////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * ȸ������ ��ȸ
	 * 
	 * @param request
	 * @return /member/mypage
	 */
	@GetMapping("/mypage")
	public String mypageForm(HttpServletRequest request) {

		// ���� �α��� ���� ��
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		// ���������� ��ȸ �޼ҵ� ȣ��
		MemberVO memberVO = memberService.mypage(loginVO);

		// �޾ƿ� ȸ������ ���� ���
		session.setAttribute("memberInfoVO", memberVO);

		return "/member/mypage";
	}

	/**
	 * ȸ������ ������
	 * 
	 * @param member
	 * @return
	 */
	@GetMapping("/editInfo")
	public String editUserInfoForm() {

		return "/member/editUserInfo";
	}

	/**
	 * ȸ������ ����
	 * 
	 * @param member
	 * @return
	 */
	@PostMapping("/editInfo")
	public String editUserInfo(MemberVO member, HttpServletRequest request) {

		memberService.editUserInfo(member); // ȸ������ ���� �޼ҵ� ȣ��

		return "/member/mypage";
	}

	/**
	 * ȸ������ ��
	 * 
	 * @return
	 */
	@GetMapping("/signUp")
	public String signUpForm() {
		return "/member/signUp";
	}

	/**
	 * ȸ������
	 * 
	 * @param member
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/signUp")
	public String signUp(MemberVO member, HttpServletRequest request) {
		memberService.signUp(member);
		return "redirect:/";
	}

	/**
	 * ȸ��Ż��
	 * 
	 * @return
	 */
	
	@GetMapping("/signOut")
	public String signOutForm() {
		return "/member/signOut";
	}
	
	@PostMapping("/signOut")
	public String signOut(MemberVO member) {
		
		System.out.println("Ż�� : " + member.toString());
		
		memberService.signOut(member); 
		return "redirect:/";
	}
}
