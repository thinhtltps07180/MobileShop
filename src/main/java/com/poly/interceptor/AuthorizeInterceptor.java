package com.poly.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.poly.entity.User;

@Component
public class AuthorizeInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	HttpSession session;

	@SuppressWarnings({ "null", "unused" })
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = (User) session.getAttribute("user");
		if (user == null) {
//		session.setAttribute("back-url", request.getRequestURI());
		session.setAttribute("alert", "Vui long dang nhap");
		response.sendRedirect("/user/login");
			return false;
		} else {
			String url = request.getRequestURI();
			if (url.startsWith("/admin")) {
				if (user.getRole().getName().equals("admin")) {
					return true;
				} else {
					response.sendRedirect("/error");
					return false;
				}
			}

		}
		return true;
	}
}
