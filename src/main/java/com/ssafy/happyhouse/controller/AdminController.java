package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.QnaDto;
import com.ssafy.happyhouse.model.dto.ReplyDto;
import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.service.QnaService;
import com.ssafy.happyhouse.model.service.UserService;

@RestController
@RequestMapping("/admin")
@CrossOrigin("*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private UserService userService;
	@Autowired
	private QnaService qnaService;
	
	// 회원목록
	////////
	@GetMapping(value="/user")
	public ResponseEntity<?> userList() {
		try {
			List<UserDto> list = userService.listUser();
			if(list != null && !list.isEmpty()) {
				return new ResponseEntity<List<UserDto>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	// 회원 등록
	@PostMapping(value = "/user")
	public ResponseEntity<?> userRegister(@RequestBody UserDto userDto) {
		try {
			userService.addUser(userDto);
			List<UserDto> list = userService.listUser();
			return new ResponseEntity<List<UserDto>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	// 회원 상세조회
	@GetMapping(value = "/user/{id}")
	public ResponseEntity<?> userInfo(@PathVariable("id") String id) {
		try {
			logger.debug("파라미터 : {}", id);
			UserDto userDto = userService.getUser(id);
			if(userDto != null)
				return new ResponseEntity<UserDto>(userDto, HttpStatus.OK);
			else
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	// 회원 수정
	@PutMapping(value = "/user")
	public ResponseEntity<?> userModify(@RequestBody UserDto userDto) {
		try {
			userService.updateUser(userDto);
			List<UserDto> list = userService.listUser();
			return new ResponseEntity<List<UserDto>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	// 회원 삭제
	@DeleteMapping(value = "/user/{id}")
	public ResponseEntity<?> userDelete(@RequestParam Map<String, String> map, @PathVariable("id") String id) {
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			Map<String, String> param2 = new HashMap<String,String>();
			
			param.put("id",id);
			
			// 1. 회원 게시글이 존재하는지
			QnaDto qnaDto = new QnaDto();
			List<QnaDto> result = qnaService.retrieveQna(param);

			// 2. 존재하면 게시글 안에 댓글이 존재하는지  - 댓글 존재 확인
			if(result.size() > 0) {
				logger.debug("id >>> " + param.get("id"));
				qnaService.deleteReply(param);
				qnaService.deleteQna(param);
			}
			// 2. 회원 게시글이 존재하면 게시글 삭제
			
			
			// 3. 회원 삭제
			userService.deleteUser(id);
			List<UserDto> list = userService.listUser();
			return new ResponseEntity<List<UserDto>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
