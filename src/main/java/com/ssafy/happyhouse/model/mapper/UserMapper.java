package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.dto.UserDto;

public interface UserMapper {

	UserDto login(String id, String password);
	int insert(UserDto dto);
	int idCheck(String checkId) throws Exception;
	
	List<UserDto> listUser();
	UserDto getUser(String id);
	void updateUser(UserDto userDto);
	void deleteUser(String id);

}