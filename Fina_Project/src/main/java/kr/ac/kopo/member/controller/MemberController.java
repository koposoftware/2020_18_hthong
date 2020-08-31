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
	// 로그인
	////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 로그인 폼 이동
	 * 
	 * @return /login.jsp
	 */
	@GetMapping("/login")
	public String loginForm() {
		
		return "/login/login";
	}

	/**
	 * 로그인 폼
	 * 
	 * @param member(id, pwd)
	 * @param session
	 * @return / or /login.jsp
	 */
	@PostMapping("/login")
	public ModelAndView login(MemberVO member, HttpSession session) {
		MemberVO loginVO = memberService.login(member); // 로그인이 완료되면 계정정보를 loginVO에 담는다.
		ModelAndView mav = new ModelAndView();

		// 로그인 실패
		if (loginVO == null) {
			mav.setViewName("redirect:/login");
			// 로그인 성공
		} else {
			// preHandle 어디 거쳤는지 여부 확인
			String dest = (String) session.getAttribute("dest");

			if (dest == null) {
				// 메인 페이지
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
	 * 로그아웃
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
	// 회원
	////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 회원정보 조회
	 * 
	 * @param request
	 * @return /member/mypage
	 */
	@GetMapping("/mypage")
	public String mypageForm(HttpServletRequest request) {

		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		// 마이페이지 조회 메소드 호출
		MemberVO memberVO = memberService.mypage(loginVO);

		// 받아온 회원정보 세션 등록
		session.setAttribute("memberInfoVO", memberVO);

		return "/member/mypage";
	}

	/**
	 * 회원정보 수정폼
	 * 
	 * @param member
	 * @return
	 */
	@GetMapping("/editInfo")
	public String editUserInfoForm() {

		return "/member/editUserInfo";
	}

	/**
	 * 회원정보 수정
	 * 
	 * @param member
	 * @return
	 */
	@PostMapping("/editInfo")
	public String editUserInfo(MemberVO member, HttpServletRequest request) {

		memberService.editUserInfo(member); // 회원정보 수정 메소드 호출

		return "/member/mypage";
	}

	/**
	 * 회원가입 폼
	 * 
	 * @return
	 */
	@GetMapping("/signUp")
	public String signUpForm() {
		return "/member/signUp";
	}

	/**
	 * 회원가입
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
	 * 회원탈퇴
	 * 
	 * @return
	 */
	
	@GetMapping("/signOut")
	public String signOutForm() {
		return "/member/signOut";
	}
	
	@PostMapping("/signOut")
	public String signOut(MemberVO member) {
		
		System.out.println("탈퇴 : " + member.toString());
		
		memberService.signOut(member); 
		return "redirect:/";
	}
}
