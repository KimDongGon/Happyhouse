package com.ssafy.happyhouse.model.service;

import com.ssafy.happyhouse.model.dto.UserDto;

public interface SecurityService {
	String generateToken(UserDto userDto);
}
