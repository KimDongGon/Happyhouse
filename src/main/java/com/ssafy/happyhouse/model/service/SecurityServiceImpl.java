package com.ssafy.happyhouse.model.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.UserDto;

import io.jsonwebtoken.Header;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Service
public class SecurityServiceImpl implements SecurityService {
	
	@Value("${jwt.secret-key}") 
	private String secretKey;
	
	@Value("${jwt.token-validity-in-secods}")
	private Long tokenValidityInSeconds;

	@Override
	public String generateToken(UserDto userDto) {
		Date now = new Date();
		
		return Jwts.builder()
				.setHeaderParam(Header.TYPE, Header.JWT_TYPE)
				.setIssuer("admin")
				.setIssuedAt(now)
				.setExpiration(new Date(now.getTime() + tokenValidityInSeconds))
				.claim("id", userDto.getId())
				.claim("name", userDto.getName())
				.claim("address", userDto.getAddress())
				.claim("mobile", userDto.getNumber())
				.signWith(SignatureAlgorithm.HS256, secretKey)
				.compact();
	}

}
