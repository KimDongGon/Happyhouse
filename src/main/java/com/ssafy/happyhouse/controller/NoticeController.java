package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.service.NoticeService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private NoticeService noticeService;

	// 공지사항 목록
	@GetMapping(value="/list")
	public ResponseEntity<List<NoticeDto>> retrieveNotice() throws Exception {
		logger.debug("retriveNotice - 호출");
		return new ResponseEntity<List<NoticeDto>>(noticeService.retrieveNotice(), HttpStatus.OK);
	}

	// 공지사항 상세 보기
	@GetMapping(value="/list/{no}")
	public ResponseEntity<NoticeDto> detailNotice(@PathVariable int no) {
		logger.debug("detailNotice");
		return new ResponseEntity<NoticeDto>(noticeService.detailNotice(no), HttpStatus.OK);
	}

	// 공지사항 등록
	@PostMapping(value="/list/regist")
	public ResponseEntity<String> writeNotice(@RequestBody NoticeDto noticeDto) {
		logger.debug("writeNotice호출");
		if (noticeService.writeNotice(noticeDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	// 공지사항 수정
	@PutMapping(value="/list/modify/{no}")
	public ResponseEntity<String> updateNotice(@RequestBody NoticeDto noticeDto) {
		logger.debug("updateNotice호출");
		logger.debug("" + noticeDto);
		if (noticeService.updateNotice(noticeDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	// 공지사항 삭제
	@DeleteMapping(value="/list/delete/{no}")
	public ResponseEntity<String> deleteNotice(@PathVariable int no) {

		logger.debug("deleteNotice호출");
		if (noticeService.deleteNotice(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}
