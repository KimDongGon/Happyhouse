package com.ssafy.happyhouse.controller;

import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, Model model) throws Exception {
		UserDto userDto = userService.login(map.get("id"), map.get("password"));
		
		if (userDto != null) {
			session.setAttribute("loginInfo", userDto);
			
			return "redirect:/";
		}
		
		model.addAttribute("message", "아이디 또는 비밀번호 확인 후 다시 로그인해주세요.");
		return "error";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/userList")
	public String userList() {
		return "user/userList";
	}
	
	@GetMapping("/notice")
	public String notice() {
		return "/notice/notice";
	}
}
