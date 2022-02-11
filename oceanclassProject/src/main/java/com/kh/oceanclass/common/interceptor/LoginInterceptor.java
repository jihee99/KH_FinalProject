package com.kh.oceanclass.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//true 리턴시 -> 기존의 요청 흐름대로 해당 controller 제대로 실행 
		//false 리턴시 -> controller 실행되지 않음
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
			return true;
		} else {
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
	}

}
