package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.DongCodeDto;
import com.ssafy.happyhouse.model.dto.GugunCodeDto;
import com.ssafy.happyhouse.model.dto.SidoCodeDto;
import com.ssafy.happyhouse.model.mapper.CodeMapper;
import com.ssafy.happyhouse.model.service.CodeService;

@RestController
@CrossOrigin("*")
@RequestMapping("/code")
public class CodeController {
	
	@Autowired
	CodeService codeService;
	
	@GetMapping("/sido")
	public ResponseEntity<?> sidoCode() {
		List<SidoCodeDto> list = codeService.getSido();
		
		if (list != null && !list.isEmpty()) {
			return new ResponseEntity<List<SidoCodeDto>>(list, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/gugun")
	public ResponseEntity<?> gugunCode(@RequestParam String sidoName) {
		List<GugunCodeDto> list = codeService.getGugun(sidoName);
		
		if (list != null && !list.isEmpty()) {
			return new ResponseEntity<List<GugunCodeDto>>(list, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/dong")
	public ResponseEntity<?> dongCode(@RequestParam Map<String, String> map) {
		List<DongCodeDto> list = codeService.getDong(map);
		
		if (list != null && !list.isEmpty()) {
			return new ResponseEntity<List<DongCodeDto>>(list, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
}
