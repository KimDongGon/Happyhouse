package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.UserDto;

public interface UserService {
	UserDto login(UserDto userDto) throws Exception;
	public int addUser(UserDto dto);

	int idCheck(String checkId) throws Exception;
	List<UserDto> listUser() throws Exception;
	UserDto getUser(String id) throws Exception;
	void updateUser(UserDto userDto) throws Exception;
	void deleteUser(String id) throws Exception;
}
