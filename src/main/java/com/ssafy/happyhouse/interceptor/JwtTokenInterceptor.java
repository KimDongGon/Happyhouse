package com.ssafy.happyhouse.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.ssafy.happyhouse.jwt.JwtTokenProvider;

@Component
public class JwtTokenInterceptor implements HandlerInterceptor {
	
	private static final Logger logger = LoggerFactory.getLogger(JwtTokenInterceptor.class);
	
	@Autowired
	private JwtTokenProvider jwtTokenProvider;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if (request.getMethod().equals("OPTIONS")) {
			return true;
		}
		
		String accessToken = jwtTokenProvider.resolveAccessToken(request);
		String refreshToken = jwtTokenProvider.resolveRefreshToken(request);
		
		logger.debug("accessToken: " + accessToken);
		logger.debug("refreshToken: " + refreshToken);
		logger.debug("isVaild: " + jwtTokenProvider.isValidAccessToken(accessToken));
		logger.debug("isExpired: " + jwtTokenProvider.isExpiredToken(accessToken));
		
		if (accessToken != null && jwtTokenProvider.isValidAccessToken(accessToken) && !jwtTokenProvider.isExpiredToken(accessToken)) {
			return true;
		} else {	
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return false;
		}		
	}
}
