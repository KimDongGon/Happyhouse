package com.ssafy.happyhouse.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ssafy.happyhouse.model.dto.TokenDto;
import com.ssafy.happyhouse.model.dto.UserDto;

public interface UserService {
	UserDto login(UserDto userDto) throws Exception;
	public int addUser(UserDto dto);

	int idCheck(String checkId) throws Exception;
	List<UserDto> listUser() throws Exception;
	UserDto getUser(String id) throws Exception;
	void updateUser(UserDto userDto) throws Exception;
	void deleteUser(String id) throws Exception;
	void updateTokens(String id, TokenDto tokenDto);
	TokenDto generateTokens(UserDto userDto);
	TokenDto issueToken(HttpServletRequest request);
}
