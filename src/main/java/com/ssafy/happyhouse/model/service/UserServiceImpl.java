package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
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



}
