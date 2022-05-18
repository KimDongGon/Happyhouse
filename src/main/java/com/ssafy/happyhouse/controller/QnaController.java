package com.ssafy.happyhouse.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.QnaDto;
import com.ssafy.happyhouse.model.service.QnaService;

import io.swagger.models.Response;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/qna")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private QnaService qnaService;
	
	// 모든 QnA 게시글 정보 반환
	@GetMapping
	public ResponseEntity<List<QnaDto>> retrieveQna() throws Exception {
		logger.debug("retriveQna - 호출");
		return new ResponseEntity<List<QnaDto>>(qnaService.retrieveQna(), HttpStatus.OK);
	}
	
	// 글번호에 해당하는 QnA 정보 반환
	@GetMapping("{no}")
	public ResponseEntity<QnaDto> detailQna(@PathVariable int no) {
		logger.debug("detailQna");
		return new ResponseEntity<QnaDto>(qnaService.detailQna(no), HttpStatus.OK);
	}
	
	// Qna 게시물 작성
	// DB 입력 성공 여부에 따라 'success' 또는 'fail'반환
	@PostMapping
	public ResponseEntity<String> WrtieQna(@RequestBody QnaDto qnaDto){
		logger.debug("writeQna호출");
		if(qnaService.writeQna(qnaDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	// 글번호에 해당하는 게시물 수정
	@PutMapping("{no}")
	public ResponseEntity<String> updateQna(@RequestBody QnaDto qnaDto){
		logger.debug("updateQna호출");
		logger.debug(""+qnaDto);
		if(qnaService.updateQna(qnaDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	// 게시물 삭제
	@DeleteMapping("{no}")
	public ResponseEntity<String> deleteQna(@PathVariable int no){
		
		logger.debug("deleteQna호출");
		if(qnaService.deleteQna(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}
