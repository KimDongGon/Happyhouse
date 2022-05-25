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
		.addPathPatterns("/notice/regist")
		.addPathPatterns("/notice/modify/**")
		.addPathPatterns("/notice/delete/**")
		.addPathPatterns("/qna/regist")
		.addPathPatterns("/qna/modify")
		.addPathPatterns("/qna/delete")
		.addPathPatterns("/qna/reply/regist")
		.addPathPatterns("/qna/reply/modify")
		.addPathPatterns("/qna/reply/delete")
		;
	}
}
