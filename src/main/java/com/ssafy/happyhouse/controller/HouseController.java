package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.HouseDto;
import com.ssafy.happyhouse.model.service.HouseService;

@RestController
@RequestMapping("/house")
@CrossOrigin("*")
public class HouseController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	
	@Autowired
	private HouseService houseService;
	
	@GetMapping("/search") 
	public ResponseEntity<?> search(
			@RequestParam int offset, 
			@RequestParam int limit, 
			@RequestParam int dongCode,
			@RequestParam(required = false) String apartmentName) {
		try {
//			for (Entry<String, Object> s : map.entrySet()) {
//				logger.debug(s.getKey() + " " + s.getValue());
//			}
			
			List<HouseDto> list = houseService.search(offset, limit, dongCode, apartmentName);
			if (list != null && !list.isEmpty()) {
				return new ResponseEntity<List<HouseDto>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	@GetMapping("/count")
	public ResponseEntity<?> search(@RequestParam int dongCode) {
		try {
			int count = houseService.getTotalCount(dongCode);
			return new ResponseEntity<Integer>(count, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
