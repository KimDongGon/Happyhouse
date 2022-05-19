package com.ssafy.happyhouse.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
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
@CrossOrigin("*")
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
	public ResponseEntity<?> register(@RequestBody UserDto userDto) {
		System.out.println(userDto);
//		return userService.addUser(dto);
		try {
			int result = userService.addUser(userDto);
			if (result != 0) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
