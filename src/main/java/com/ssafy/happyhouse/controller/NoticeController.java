package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.dto.UserDto;
import com.ssafy.happyhouse.model.service.NoticeService;

@RestController
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	// 공지사항 목록
	@GetMapping("/list")
	public ResponseEntity<?> noticeList() {
		try {
			List<NoticeDto> list = noticeService.listNotice();
			if(list != null && !list.isEmpty()) {
				return new ResponseEntity<List<NoticeDto>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	// 공지사항 등록
	@PostMapping(value = "/list")
	public ResponseEntity<?> userRegister(@RequestBody NoticeDto noticeDto) {
		try {
			noticeService.addNotice(noticeDto);
			List<NoticeDto> list = noticeService.listNotice();
			return new ResponseEntity<List<NoticeDto>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
		
	// 공지사항 상세 보기
	@GetMapping("/list/{no}")
	public ResponseEntity<?> noticeInfo(@PathVariable("no") int no) {
		try {
			
			NoticeDto noticeDto = noticeService.getNotice(no);
			if(noticeDto != null)
				return new ResponseEntity<NoticeDto>(noticeDto, HttpStatus.OK);
			else
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
