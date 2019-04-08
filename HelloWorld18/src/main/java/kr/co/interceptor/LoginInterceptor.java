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
		System.out.println("LoginInterceptor preHandle: "+login);

		if (login!=null) {
			
			session.removeAttribute("login");
			
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session=request.getSession();
		ModelMap map=modelAndView.getModelMap();
		Object memberDTO=map.get("memberDTO");
		
		
		if (memberDTO!=null) {
			session.setAttribute("login", memberDTO);
			Object dest=session.getAttribute("dest");
			
			if (dest!=null) {
				response.sendRedirect(dest.toString());
			}else {
				response.sendRedirect("/");
			}
			
		}
		
	}
	
}
