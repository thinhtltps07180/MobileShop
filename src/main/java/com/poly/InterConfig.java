package com.poly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptor.AuthorizeInterceptor;

@Configuration
public class InterConfig implements WebMvcConfigurer {
	@Autowired
	AuthorizeInterceptor auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(auth).addPathPatterns("/admin/**", "/user/cart");
//
//		registry.addInterceptor(auth).addPathPatterns("/admin/**")
//		.excludePathPatterns("/admin/master/login");
	}
}
