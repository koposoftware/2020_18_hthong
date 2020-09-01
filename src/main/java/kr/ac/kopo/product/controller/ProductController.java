package kr.ac.kopo.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.product.service.ProductService;

@SessionAttributes({ "loginVO" })
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;


	@GetMapping("/product/onepick/{path}")
	public ModelAndView product(@PathVariable("path") String path, HttpServletRequest request) {

		// 세션 로그인 정보 값
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		// 원픽통장 조회
		ModelAndView mav = new ModelAndView();
//		List<ProductVO> onepickInfo = productService.onepickInfo(loginVO);	//로그인 정보 가지고 원픽통장만 조회

		// 원픽통장 조회 view
		if (path.equals("info")) {
			mav = new ModelAndView("/product/info");
//			mav.addObject("onepickInfo", onepickInfo);
		}

		// 원픽통장 관리 view
		else if (path.equals("manage")) {
			mav = new ModelAndView("/product/manage");
//			mav.addObject("onepickInfo", onepickInfo);
		}
		
		// 원픽통장 대시보드 view
		else if (path.equals("dashboard")) {
			mav = new ModelAndView("/product/dashboard");
//			mav.addObject("onepickInfos", onepickInfo);
		}

		// 예외발생 view
		else {
			mav = new ModelAndView("redirect:/");
		}

		return mav;
	}
}
