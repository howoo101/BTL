package com.btl.findjob.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			System.out.println("XMLHttpRequest".equals(request.getHeader("x-requested-with")));
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("user");

			//로그인이 안되어있을경우.. 컨트롤러 요청으로 가지 않도록 false 반환
			if(obj==null) {
				if("XMLHttpRequest".equals(request.getHeader("x-requested-with"))) {
					response.sendError(400);
					return false;
				}
				response.sendRedirect(request.getContextPath()+"/logininterceptor");
				return false; // 컨트롤러 uri로의 요청으로 가지않도록 false
			}

	
			return true; // 컨트롤러 uri로의 요청을 허용
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
