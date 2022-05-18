package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.service.UserService;

@RestController
@CrossOrigin("*")
public class MainController {
	
	@Autowired
	UserService userService;
	
//	@GetMapping("/")
//	public String index() {
//		return "index";
//	}
//	
//	@GetMapping("/signUp")
//	public String signUp() {
//		return "user/signUp";
//	}
	
	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody UserDto userDto) {
		try {
			UserDto user = userService.login(userDto);
			if (user != null) {				
				return new ResponseEntity<UserDto>(user, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "redirect:/";
//	}
//	
//	@GetMapping("/userList")
//	public String userList() {
//		return "user/userList";
//	}
//	
//	@GetMapping("/notice")
//	public String notice() {
//		return "/notice/notice";
//	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
