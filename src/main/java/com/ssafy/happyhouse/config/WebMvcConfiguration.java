package com.ssafy.happyhouse.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ssafy.happyhouse.interceptor.JwtTokenInterceptor;

@Configuration
@MapperScan(basePackages = "com.ssafy.**.mapper")
public class WebMvcConfiguration implements WebMvcConfigurer {

	@Autowired
	private JwtTokenInterceptor jwtTokenInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry
		.addInterceptor(jwtTokenInterceptor)
		.addPathPatterns("/admin/**")
//		.addPathPatterns("/**")
//		.excludePathPatterns("/code/sido")
//		.excludePathPatterns("/code/gugun")
//		.excludePathPatterns("/code/dong")
//		.excludePathPatterns("/user/login")
//		.excludePathPatterns("/user/idcheck")
//		.excludePathPatterns("/user/register")
//		.excludePathPatterns("/user/issue")		
//		.excludePathPatterns("/notice/list/**")
//		.excludePathPatterns("/notice/detail")
//		.excludePathPatterns("/qna/**")
//		.excludePathPatterns("/qna/reply/**")
		;
	}
}
