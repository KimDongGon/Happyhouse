package com.ssafy.happyhouse.jwt;

import java.util.Base64;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.ssafy.happyhouse.model.dto.UserDto;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Header;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JwtTokenProvider {
	private static final Logger logger = LoggerFactory.getLogger(JwtTokenProvider.class);
	
	@Value("${jwt.secret-key}") 
	private String secretKey;
	
	@Value("${jwt.token-validity-in-mili-seconds}")
	private Long tokenValidityInMiliSeconds;
	
	@Value("${jwt.refresh-token-validity-in-mili-seconds}")
	private Long refreshTokenValidityInMiliSeconds;
	
	@PostConstruct
	protected void init() {
		secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
	}

	public String generateToken(UserDto userDto) {
		Date now = new Date();
		
		return Jwts.builder()
				.setHeaderParam(Header.TYPE, Header.JWT_TYPE)
				.setIssuer("admin")
				.setIssuedAt(now)
				.setExpiration(new Date(now.getTime() + tokenValidityInMiliSeconds))
				.claim("id", userDto.getId())
				.claim("name", userDto.getName())
				.claim("address", userDto.getAddress())
				.claim("mobile", userDto.getNumber())
				.signWith(SignatureAlgorithm.HS256, secretKey)
				.compact();
	}

	public String generateRefreshToken() {
		Date now = new Date();
		
		return Jwts.builder()
				.setHeaderParam(Header.TYPE, Header.JWT_TYPE)
				.setIssuedAt(now)
				.setIssuer("admin")
				.setExpiration(new Date(now.getTime() + refreshTokenValidityInMiliSeconds))
				.signWith(SignatureAlgorithm.HS256, secretKey)
				.compact();
	}
	
	public String resolveAccessToken(HttpServletRequest request) {
		return request.getHeader("ACCESS_TOKEN");
	}
	
	public String resolveRefreshToken(HttpServletRequest request) {
		return request.getHeader("REFRESH_TOKEN");
	}
	
	public Claims getClaimsFromToken(String token) {
		return Jwts.parser()
				.setSigningKey(DatatypeConverter.parseBase64Binary(secretKey))
				.parseClaimsJws(token)
				.getBody();
	}
	
	public UserDto getUserInfoFromClaims(Claims claims) {
		UserDto userDto = new UserDto();
		userDto.setId((String) claims.get("id"));
		userDto.setName((String) claims.get("name"));
		userDto.setAddress((String) claims.get("address"));
		userDto.setNumber((String) claims.get("mobile"));
		return userDto;
	}
	
	public boolean isValidAccessToken(String accessToken) {
		try {
			Claims claims = getClaimsFromToken(accessToken);
			logger.debug("Token Expired? " + claims.getExpiration().before(new Date()));
			return true;
		} catch(ExpiredJwtException e) {
			logger.debug("Expired Access Token: " + e.getMessage());
			return false;
		} catch(JwtException e) {
			logger.debug("Access Token is invalid");
			return false;
		} catch(NullPointerException e) {
			logger.debug("Access Token is null");
			return false;
		} catch(Exception e) {
			return false;
		}
	}
	
	public boolean isValidRefreshToken(String refreshToken) {
		try {
			Claims claims = getClaimsFromToken(refreshToken);
			logger.debug("Token Expired? " + claims.getExpiration().before(new Date()));
			return true;
		} catch(ExpiredJwtException e) {
			logger.debug("Expired Refresh Token: " + e.getMessage());
			return false;
		} catch(JwtException e) {
			logger.debug("Refresh Token is invalid");
			return false;
		} catch(NullPointerException e) {
			logger.debug("Refresh Token is null");
			return false;
		} catch(Exception e) {
			return false;
		}
	}
	
	public boolean isExpiredToken(String accessToken) {
		try {
			Claims claims = getClaimsFromToken(accessToken);
			logger.debug("Token Expired? " + claims.getExpiration().before(new Date()));
			return false;
		} catch(ExpiredJwtException e) {
			logger.debug("Expired Refresh Token: " + e.getMessage());
			return true;
		} catch(JwtException e) {
			logger.debug("Refresh Token is invalid");
			return false;
		} catch(NullPointerException e) {
			logger.debug("Refresh Token is null");
			return false;
		} catch(Exception e) {
			return false;
		}
	}
}
