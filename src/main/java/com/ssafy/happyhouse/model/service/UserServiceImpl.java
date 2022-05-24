package com.ssafy.happyhouse.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.jwt.JwtTokenProvider;
import com.ssafy.happyhouse.model.dto.TokenDto;
import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.mapper.UserMapper;

import io.jsonwebtoken.Claims;

@Service
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private JwtTokenProvider jwtTokenProvider;
	
	public UserDto login(UserDto userDto) {
		return userMapper.login(userDto);
	}

	public int addUser(UserDto dto) {
		return userMapper.insert(dto);
	}

	@Override
	public int idCheck(String checkId) throws Exception {
		return userMapper.idCheck(checkId);
	}

	@Override
	public List<UserDto> listUser() throws Exception {
		return userMapper.listUser();
	}

	@Override
	public UserDto getUser(String id) throws Exception {
		return userMapper.getUser(id);
	}

	@Override
	public void updateUser(UserDto userDto) throws Exception {
		userMapper.updateUser(userDto);
	}

	@Override
	public void deleteUser(String id) throws Exception {
		userMapper.deleteUser(id);
	}

	@Override
	public void updateTokens(String id, TokenDto tokenDto) {
		userMapper.updateTokens(id, tokenDto);
	}
	
	@Override
	public TokenDto generateTokens(UserDto userDto) {
		String accessToken = jwtTokenProvider.generateToken(userDto);
		String refreshToken = jwtTokenProvider.generateRefreshToken();
		return new TokenDto(accessToken, refreshToken);
	}

	@Override
	public TokenDto issueToken(HttpServletRequest request) {
		String accessToken = jwtTokenProvider.resolveAccessToken(request);
		String refreshToken = jwtTokenProvider.resolveRefreshToken(request);
		TokenDto tokenDto = new TokenDto(accessToken, refreshToken);
		
		if (jwtTokenProvider.isValidAccessToken(accessToken)) {
			logger.debug("Access Token이 유효함");
			if (jwtTokenProvider.isExpiredToken(accessToken)) {
				logger.debug("Access Token이 만료됨");
				Claims claims = jwtTokenProvider.getClaimsFromExpiredToken(accessToken);
				
				String id = (String) claims.get("id");
				
				if (userMapper.isValidTokenInDB(id, tokenDto) == 1) {
					logger.debug("Token들이 유효함");
					accessToken = jwtTokenProvider.generateToken(jwtTokenProvider.getUserInfoFromClaims(claims));					
					tokenDto.setAccessToken(accessToken);
					userMapper.updateTokens(id, tokenDto);
					return tokenDto;
				} else {
					logger.debug("요청 받은 Refresh Token이 변조됨");
					return null;
				}
			} else {
				logger.debug("Access Token이 만료되지 않음");
				return null;
			}
		} else {
			logger.debug("Access Token이 변조됨");
			return null;
		}
	}
}
