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
	public ResponseEntity<List<QnaDto>> retrieveQna(@RequestParam
			Map<String, Object> map) throws Exception {
		logger.debug("retriveQna - 호출");
		return new ResponseEntity<List<QnaDto>>(qnaService.retrieveQna(map), HttpStatus.OK);
	}

	// 글번호에 해당하는 QnA 정보 반환 - 상세조회
	@GetMapping("{no}")
	public ResponseEntity<QnaDto> detailQna(@PathVariable int no) {
		logger.debug("detailQna");

		QnaDto qnaDto = new QnaDto();

		qnaDto.setNo(no);
		// 조회수 증가
		qnaService.increaseHitCount(qnaDto);
		// 전체 댓글 수 확인
		// qnaDto.setReplycount(qnaService.replyCount(no));
		qnaService.replyCount(no);
		// logger.debug("replyCnt >>> "+ replyCnt );
		return new ResponseEntity<QnaDto>(qnaService.detailQna(no), HttpStatus.OK);
	}

	// limit offset에 해당하는 게시글 정보 반환
	@GetMapping(value = "/pagelink")
	public ResponseEntity<List<QnaDto>> selectQnaLimitOffset(int limit, int offset) throws Exception {
		logger.debug("selectQnaLimitOffset호출");
		System.out.println("limit >> " + limit + " / offset >> " + offset);
		return new ResponseEntity<List<QnaDto>>(qnaService.selectQnaLimitOffset(limit, offset), HttpStatus.OK);
	}
	
	// Qna 게시글의 전체 건수 반환
	@GetMapping(value = "/pagelink/count")
	public ResponseEntity<Integer> selectQnaTotalCount() throws Exception {
		logger.debug("selectQnaTotalCount호출");
		return new ResponseEntity<Integer>(qnaService.selectQnaTotalCount(), HttpStatus.OK);
	}
	
	// Qna 게시물 작성
	// DB 입력 성공 여부에 따라 'success' 또는 'fail'반환
	@PostMapping
	public ResponseEntity<String> wrtieQna(@RequestBody QnaDto qnaDto) {
		logger.debug("writeQna호출");
		if (qnaService.writeQna(qnaDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	// 글번호에 해당하는 게시물 수정
	@PutMapping("{no}")
	public ResponseEntity<String> updateQna(@RequestBody QnaDto qnaDto) {
		logger.debug("updateQna호출");
		logger.debug("" + qnaDto);
		if (qnaService.updateQna(qnaDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	// 게시물 삭제
	@DeleteMapping("{no}")
	public ResponseEntity<String> deleteQna(@RequestParam Map<String, String> map, @PathVariable int no) {
		Map<String,Object> param = new HashMap<String, Object>();
		logger.debug("deleteQna호출");

		// 댓글 유무 확인 후 같이 삭제
		ReplyDto replyDto = new ReplyDto();
		replyDto.setNo(no);

		List<ReplyDto> result = qnaService.retrieveReply(no);
		//logger.debug("result Size >>> " + result.size());
		// 게시글에 댓글이 있다면
		if (result.size() > 0) {
			//logger.debug("deleteReply호출");
			//logger.debug("no >>> " + no);
			//logger.debug("reply >>> " + reply);
			param.put("no", String.valueOf(no));
			param.put("reply", map.get("reply") == null ? "0" : map.get("reply"));
			
			qnaService.deleteReply(param);
		}

		if (qnaService.deleteQna(param)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	// 해당 게시물에 대한 댓글 조회
	@GetMapping(value = "/reply/{no}")
	public ResponseEntity<List<ReplyDto>> retrieveReply(@PathVariable int no) throws Exception {
		logger.debug("retriveReply - 호출");
		return new ResponseEntity<List<ReplyDto>>(qnaService.retrieveReply(no), HttpStatus.OK);
	}

	// 댓글 작성
	@PostMapping(value = "/reply/{no}")
	public ResponseEntity<String> writeReply(@RequestBody ReplyDto replyDto, @PathVariable int no) {
		logger.debug("writeReply호출");
		if (qnaService.writeReply(replyDto) == 1) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	// 댓글 수정
	@PutMapping(value = "/reply/{no}")
	public ResponseEntity<String> updateReply(@RequestBody ReplyDto replyDto, @PathVariable int no) {
		logger.debug("updateReply호출");
		logger.debug("" + replyDto);
		if (qnaService.updateReply(replyDto) == 1) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	// 댓글 삭제
	@DeleteMapping(value = "/reply")
	public ResponseEntity<String> deleteReply(@RequestParam Map<String, Object> map) {

		logger.debug("deleteReply호출");

		if (qnaService.deleteReply(map) == 1) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}
