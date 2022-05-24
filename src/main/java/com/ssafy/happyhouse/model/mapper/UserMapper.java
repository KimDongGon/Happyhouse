package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.model.dto.TokenDto;
import com.ssafy.happyhouse.model.dto.UserDto;

public interface UserMapper {

	UserDto login(UserDto userDto);
	int insert(UserDto dto);
	int idCheck(String checkId) throws Exception;
	
	List<UserDto> listUser();
	UserDto getUser(String id);
	void updateUser(UserDto userDto);
	void deleteUser(String id);
	void updateTokens(@Param("id") String id, @Param("tokens") TokenDto tokenDto);
	int isValidTokenInDB(@Param("id") String id, @Param("tokens") TokenDto tokenDto);
}