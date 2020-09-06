package kr.ac.kopo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.member.vo.MemberVO;

//pre, post, after 에 따라 코드주입이 달라진다.
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 로그인 여부 체크
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		if (loginVO == null) {

			// 요청보낸 uri 가져오기 
			String uri = request.getRequestURI(); 
			System.out.println("uri1" + uri);
			uri = uri.substring(request.getContextPath().length());
			System.out.println("uri2" + uri);

			String query = request.getQueryString();
			System.out.println(query);

			// uri 뒤에 날아온 parameter도 가져오가 (no=24 형태로 날아옴)

			if (query != null && query.length() != 0)
				uri = uri + "?" + query;
			session.setAttribute("dest", uri);

			response.sendRedirect(request.getContextPath() + "/login");

			return false;
		}

		return true;
	}
}
