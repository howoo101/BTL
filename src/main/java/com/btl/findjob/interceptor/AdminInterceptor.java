package com.btl.findjob.interceptor;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.btl.findjob.model.SessionListener;
import com.btl.findjob.service.UserService;


public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			System.out.println("XMLHttpRequest".equals(request.getHeader("x-requested-with")));
			HttpSession session = request.getSession();
			String grade = (String) session.getAttribute("grade");
			
		RequestDispatcher gradeceptor = request.getRequestDispatcher("/adminceptor");
	
			if(grade == null) {
				gradeceptor.forward(request,response);
				return false; // 컨트롤러 uri로의 요청으로 가지않도록 false
			}
			else if(grade.equals("1")){
			return true; // 요청 true
			}
			else {
				gradeceptor.forward(request,response);
				return false; // 요청 false
			}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
