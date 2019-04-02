package kr.co.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HttpSession session=request.getSession(true);
		Object login=session.getAttribute("login");
		
		System.out.println("Interceptor가는지 테스트입니다 preHandle");
		if (login!=null) {
			System.out.println("::::::::::::::::::::::::::::::::::");
			session.removeAttribute("login");
			System.out.println("login을 해제하는지 알고싶어서 작성함");
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session=request.getSession();
		ModelMap map=modelAndView.getModelMap();
		Object memberDTO=map.get("memberDTO");
		System.out.println("Interceptor가는지 테스트입니다 postHandle");
		
		if (memberDTO!=null) {
			session.setAttribute("login", memberDTO);
			Object dest=session.getAttribute("dest");
			System.out.println(session.getAttribute("login")+"intercepter Login세션 가져오는지 테스트하기위한 것입니다.");
			if (dest!=null) {
				response.sendRedirect(dest.toString());
			}else {
				response.sendRedirect("/");
			}
			
		}
		
	}
	
}
