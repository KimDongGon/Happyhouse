package com.ssafy.happyhouse.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/idcheck")
	public String idCheck(@RequestParam("ckid") String checkId) throws Exception {
		int cnt = userService.idCheck(checkId);
		
		JSONObject json = new JSONObject();
		json.put("idcount", cnt);
		
		return json.toString();
	}
	
	@PostMapping("/register")
	public int register(@RequestBody UserDto dto) {
		return userService.addUser(dto);
	}
}
